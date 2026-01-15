import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nritya_setu/components/index.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/images.dart';
import 'package:nritya_setu/constants/metrics.dart';

import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/alert_dialog.dart';

Widget _optionItem(
  BuildContext context, {
  required String icon,
  required String label,
  VoidCallback? onTap,
}) {
  final colors = Theme.of(context).colors;

  return InkWell(
    onTap: () {
      Navigator.pop(context);
      onTap?.call();
    },
    child: Padding(
      padding: EdgeInsets.all(Metrics.height(context) * 0.01),
      child: Column(
        children: [
          Image.asset(icon, height: Metrics.height(context) * 0.035),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: colors.colorBlack)),
        ],
      ),
    ),
  );
}

Future<void> showImageOptionsBottomSheet({
  required BuildContext context,
  VoidCallback? onCameraTap,
  VoidCallback? onGalleryTap,
  VoidCallback? onFileTap,
}) {
  final colors = Theme.of(context).colors;

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        width: Metrics.width(context),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          right: Metrics.width(context) * 0.04,
          left: Metrics.width(context) * 0.04,
        ),
        decoration: BoxDecoration(
          color: colors.colorWhite,
          border: Border.all(color: colors.colorLightGrey),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Metrics.height(context) * 0.02),
            topRight: Radius.circular(Metrics.height(context) * 0.02),
          ),
          boxShadow: [
            BoxShadow(
              color: colors.colorLightGrey.withAlpha(50),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Padding(
              padding: EdgeInsets.all(Metrics.width(context) * 0.03),
              child: Center(
                child: Container(
                  height: 4,
                  width: Metrics.getResponsiveSize(context, 0.25),
                  decoration: BoxDecoration(
                    color: colors.colorLightBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            TextComponent(
              text: 'Choose Image Options:',
              style: TextStyle(
                color: colors.colorLightBlue,
                fontWeight: FontWeight.w600,
                fontSize: Metrics.getFontSize(context, 17),
              ),
            ),

            Divider(color: colors.dividerGrey),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _optionItem(
                  context,
                  icon: Images.cameraIcon,
                  label: 'Camera',
                  onTap: onCameraTap,
                ),
                _optionItem(
                  context,
                  icon: Images.galleryIcon,
                  label: 'Gallery',
                  onTap: onGalleryTap,
                ),
                _optionItem(
                  context,
                  icon: Images.filesIcon,
                  label: 'File',
                  onTap: onFileTap,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Future<File?> pickFileFromGalleryWithPermission({
  required BuildContext context,
  required ImagePicker imagePicker,
  required String kaizenNo,
  required bool isAfter,
  String? Function()? fileNameBuilder,
}) async {
  final status = await Permission.photos.request();

  if (status.isDenied) {
    customDialog(
      imageAsset: Images.warning,
      'Permission Required',
      'Gallery access is required to select a file.',
      'Request again',
      'Cancel',
      okBtnTap: (_) async {
        Navigator.pop(context);
        await pickFileFromGalleryWithPermission(
          context: context,
          imagePicker: imagePicker,
          kaizenNo: kaizenNo,
          isAfter: isAfter,
          fileNameBuilder: fileNameBuilder,
        );
      },
      context,
    );
    return null;
  }

  if (status.isPermanentlyDenied || status.isRestricted || status.isLimited) {
    customDialog(
      imageAsset: Images.warning,
      'Gallery Permission Disabled',
      'Please enable Gallery permission in your device settings.',
      'Open Settings',
      'Cancel',
      okBtnTap: (_) async {
        Navigator.pop(context);
        await openAppSettings();
      },
      context,
    );
    return null;
  }

  final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

  if (image == null) return null;

  final original = File(image.path);

  final fileName =
      fileNameBuilder?.call() ?? '${kaizenNo}_${isAfter ? "after" : "before"}';

  final newPath = '${original.parent.path}/$fileName.png';

  return await original.copy(newPath);
}

Future<File?> pickPdfFileGeneric() async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result == null || result.files.single.path == null) {
      return null;
    }

    return File(result.files.single.path!);
  } catch (e, s) {
    log('pickPdfFileGeneric error', error: e, stackTrace: s);
    return null;
  }
}

Future<Uint8List?> generatePdfThumbnail(File pdfFile) async {
  try {
    final bytes = await pdfFile.readAsBytes();
    final doc = await PdfDocument.openData(bytes);
    final page = await doc.getPage(1);

    final pageImage = await page.render(
      width: (page.width * 2).toDouble(),
      height: (page.height * 2).toDouble(),
      format: PdfPageImageFormat.png,
    );

    await page.close();
    return pageImage?.bytes;
  } catch (e) {
    debugPrint('PDF thumbnail error: $e');
    return null;
  }
}

Future<void> showPdfAgreementDialog(
  BuildContext context,
  File pdfUrl,
  VoidCallback onAccepted,
  PdfControllerPinch? pdfController,
) async {
  final colors = Theme.of(context).colors;

  final pdfDocument = PdfDocument.openFile(pdfUrl.path);
  // Create controller
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext buildCont) {
      return Stack(
        children: [
          Dialog(
            backgroundColor: colors.colorWhite,
            shadowColor: colors.colorWhite,
            surfaceTintColor: colors.colorWhite,
            insetPadding: EdgeInsets.all(0),

            shape: null,

            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(
                //   Radius.circular(Metrics.height(context) * 0.02),
                // ),
              ),
              child: Stack(
                children: [
                  PdfViewPinch(
                    padding: 0,
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(width: 0),
                    ),
                    controller: pdfController!,
                    scrollDirection: Axis.vertical,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        margin: EdgeInsets.all(Metrics.width(context) * 0.02),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: colors.colorLightBlue,
                          borderRadius: BorderRadius.circular(
                            Metrics.height(context) * 0.01,
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: Metrics.width(context) * 0.08,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<File?> pickImageFromCameraWithPermission({
  required BuildContext context,
  required ImagePicker imagePicker,
  required String kaizenNo,
  required bool isAfter,
  String? Function()? fileNameBuilder,
}) async {
  final status = await Permission.camera.request();

  if (status.isDenied) {
    customDialog(
      imageAsset: Images.warning,
      'Permission Required',
      'Camera access is required to take a picture.',
      'Request again',
      'Cancel',
      okBtnTap: (_) async {
        Navigator.pop(context);
        await pickImageFromCameraWithPermission(
          context: context,
          imagePicker: imagePicker,
          kaizenNo: kaizenNo,
          isAfter: isAfter,
          fileNameBuilder: fileNameBuilder,
        );
      },
      context,
    );
    return null;
  }

  if (status.isPermanentlyDenied || status.isRestricted || status.isLimited) {
    customDialog(
      imageAsset: Images.warning,
      'Camera Permission Disabled',
      'Please enable camera permission in your device settings.',
      'Open Settings',
      'Cancel',
      okBtnTap: (_) async {
        Navigator.pop(context);
        await openAppSettings();
      },
      context,
    );
    return null;
  }

  final XFile? image = await imagePicker.pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );

  if (image == null) return null;

  final original = File(image.path);

  final fileName =
      fileNameBuilder?.call() ?? '${kaizenNo}_${isAfter ? "after" : "before"}';

  final newPath = '${original.parent.path}/$fileName.png';

  return await original.copy(newPath);
}

void showFullScreenImage(
  BuildContext context,
  File image, {
  bool hasWhiteBg = false,
}) {
  final colors = Theme.of(context).colors;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: hasWhiteBg ? Colors.white : Colors.transparent,
        insetPadding: EdgeInsets.all(Metrics.width(context) * 0.03),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child:
                    image.existsSync()
                        ? Image.file(
                          image,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        )
                        : Stack(
                          children: [
                            Image.asset(
                              Images.filesIcon,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Metrics.height(context) * 0.05,
                                    vertical: Metrics.width(context) * 0.05,
                                  ),
                                  color: Colors.black54,
                                  child: TextComponent(
                                    text: 'Image has been deleted from device.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Metrics.getFontSize(
                                        context,
                                        14,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
              ),
            ),
            // Close Button
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      Metrics.height(context) * 0.01,
                    ),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: Metrics.width(context) * 0.08,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
