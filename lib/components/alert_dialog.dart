import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaizen_elecon/constants/colors.dart';
import 'package:kaizen_elecon/constants/metrics.dart';
import 'package:url_launcher/url_launcher.dart';

void newAlertDialog(
  String title,
  String message,
  String okButtonText,
  BuildContext context, {
  Function(String)? onActionClick,
}) {
  final colors = Theme.of(context).colors;

  if (Get.isDialogOpen!) {
    Get.back(); // Close the current open dialog
  }
  Get.dialog(
    Dialog(
      backgroundColor: colors.colorWhite,
      shadowColor: colors.colorWhite,
      surfaceTintColor: colors.colorWhite,
      insetPadding: EdgeInsets.all(20.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 15.h,
          left: 10.w,
          right: 10.w,
          bottom: 15.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue[100],
              child: Icon(Icons.error, color: colors.colorWhite),
            ),
            SizedBox(height: 15.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.colorBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 5.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.colorBlack, fontSize: 15.sp),
              maxLines: 5,
            ),
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.only(
                top: 10.h,
                left: 10.w,
                right: 10.w,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: colors.colorBlue,
              ),
              height: 40.h,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  if (onActionClick != null) {
                    onActionClick.call('data');
                  } else {
                    // Navigator.of(context).pop();
                  }
                },
                child: Center(
                  child: Text(
                    okButtonText,
                    style: TextStyle(
                      color: colors.colorWhite,
                      fontSize: 15.h,
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
    barrierDismissible: false,
  );
}

void newSuccessDialog(
  String title,
  String message,
  String okButtonText,
  BuildContext context, {
  Function(String)? onActionClick,
}) {
  final colors = Theme.of(context).colors;

  if (Get.isDialogOpen!) {
    Get.back(); // Close the current open dialog
  }
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.all(20.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 15.h,
          left: 10.w,
          right: 10.w,
          bottom: 15.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue[100],
              child: const Icon(Icons.cloud_done, color: Colors.white),
            ),
            SizedBox(height: 15.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.colorBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 5.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.colorBlack, fontSize: 15.sp),
              maxLines: 5,
            ),
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.only(
                top: 10.h,
                left: 10.w,
                right: 10.w,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: colors.colorBlue,
              ),
              height: 40.h,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  if (onActionClick != null) {
                    onActionClick.call('data');
                  } else {
                    // Navigator.of(context).pop();
                  }
                },
                child: Center(
                  child: Text(
                    okButtonText,
                    style: TextStyle(
                      color: colors.colorWhite,
                      fontSize: 15.h,
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
    barrierDismissible: false,
  );
}

void handleLaunchPhnURL({required String contact}) async {
  final phnUrl = 'tel:$contact';
  if (await canLaunchUrl(Uri.parse(phnUrl))) {
    Get.back();
    await launchUrl(Uri.parse(phnUrl));
  } else {
    newAlertDialog("oopss".tr, 'Cannot launch URL', "ok".tr, Get.context!);
  }
}

void newDialog(
  String title,
  String message,
  String number,
  String okButtonText,
  BuildContext context, {
  Function(String)? onActionClick,
}) {
  final colors = Theme.of(context).colors;

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.all(20.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 15.h,
                left: 10.w,
                right: 10.w,
                bottom: 15.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: Metrics.height(context) * 0.02),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.colorBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colors.colorBlack, fontSize: 15.sp),
                    maxLines: 5,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colors.colorBlack, fontSize: 15.sp),
                    maxLines: 5,
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.h,
                      left: 10.w,
                      right: 10.w,
                      bottom: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: colors.colorBlue,
                    ),
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (onActionClick != null) {
                          onActionClick.call('data');
                        }
                      },
                      child: Center(
                        child: Text(
                          okButtonText,
                          style: TextStyle(
                            color: colors.colorWhite,
                            fontSize: 15.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  handleLaunchPhnURL(contact: '9016004271');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  height: Metrics.getResponsiveSize(context, 0.12),
                  width: Metrics.getResponsiveSize(context, 0.12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(50),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Icon(Icons.phone, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void customDialog(
  String title,
  String message,
  String okButtonText,
  String? cancelBtnText,
  BuildContext context, {
  Function(String)? okBtnTap,
  Function(String)? cancelBtnTap,
  Widget? extraMessage,
  String? imageAsset,
  bool? showCloseButton,
}) {
  final colors = Theme.of(context).colors;
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext dialogContext) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          backgroundColor: colors.colorWhite,
          shadowColor: colors.colorWhite,
          surfaceTintColor: colors.colorWhite,
          insetPadding: EdgeInsets.all(Metrics.height(context) * 0.02),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: colors.colorLightGrey),
            borderRadius: BorderRadius.all(
              Radius.circular(Metrics.height(context) * 0.02),
            ),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Metrics.height(context) * 0.02,
                  horizontal: Metrics.width(context) * 0.03,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (imageAsset != null) ...[
                      Image.asset(
                        imageAsset,
                        height: Metrics.height(context) * 0.06,
                        width: Metrics.width(context) * 0.22,
                        fit: BoxFit.fitHeight,
                      ),
                      Divider(),
                      // SizedBox(height: Metrics.height(context) * 0.01),
                    ],
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.colorLightBlue,
                        fontSize: Metrics.getFontSize(context, 20),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 5,
                    ),
                    SizedBox(height: Metrics.height(context) * 0.01),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.colorBlack,
                        fontSize: Metrics.getFontSize(context, 15),
                      ),
                      maxLines: 5,
                    ),
                    if (extraMessage != null) ...[
                      SizedBox(height: Metrics.height(context) * 0.01),
                      extraMessage,
                    ],
                    SizedBox(height: Metrics.height(context) * 0.02),
                    Row(
                      mainAxisAlignment: cancelBtnText != null
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: [
                        if (cancelBtnText != null) ...[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.red.shade600,
                              backgroundColor: Colors.red.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Metrics.height(context) * 0.01,
                                ),
                                side: BorderSide(color: Colors.red.shade300),
                              ),
                            ),
                            onPressed: () {
                              if (cancelBtnTap != null) {
                                cancelBtnTap.call('data');
                              } else {
                                Navigator.of(dialogContext).pop();
                              }
                            },
                            child: Text(
                              cancelBtnText ?? '',
                              style: TextStyle(
                                fontSize: Metrics.isTablet(context)
                                    ? Metrics.getFontSize(context, 12)
                                    : Metrics.getFontSize(context, 14),
                              ),
                            ),
                          ),
                        ],
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueGrey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Metrics.height(context) * 0.01,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (okBtnTap != null) {
                              okBtnTap.call('data');
                            } else {
                              Navigator.of(dialogContext).pop();
                            }
                          },
                          child: Text(
                            okButtonText ?? 'OK',
                            style: TextStyle(
                              fontSize: Metrics.isTablet(context)
                                  ? Metrics.getFontSize(context, 12)
                                  : Metrics.getFontSize(context, 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: InkWell(
              //     onTap: () => Navigator.of(context).pop(),
              //     child: Container(
              //       padding: const EdgeInsets.all(3),
              //       decoration: BoxDecoration(
              //         color: Colors.amber,
              //         borderRadius: BorderRadius.circular(
              //           Metrics.height(context) * 0.01,
              //         ),
              //       ),
              //       child: Icon(
              //         Icons.close,
              //         color: Colors.white,
              //         size: Metrics.width(context) * 0.08,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    },
  );
}
