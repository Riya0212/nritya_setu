// import 'dart:developer';

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:kaizen_elecon/constants/colors.dart';

// import '../../constants/index.dart';


// class GenericDropdown<T> extends StatelessWidget {
//   final List<T> items;
//   final T? selectedItem;
//   final ValueChanged<T?> onChanged;
//   final String? hintText;
//   final String? title;
//   final TextStyle? titleTextStyle;
//   final bool? isRequired;
//   final OutlineInputBorder? enabledBorder;
//   final String? validationLabel;
//   final String? Function(T?)? validationHandle;
//   final bool? isReadOnly;
//   final bool? needsValidation;
//   final String? customValidationError;
//   final AutovalidateMode? autovalidateMode;

//   /// Converts item to simple string (for fallback or default usage)
//   final String Function(T) itemToString;

//   /// Custom builder for each dropdown item widget
//   final Widget Function(BuildContext context, T item, bool isSelected)?
//   itemBuilder;

//   /// Optional custom builder for selected item widget (shown in the button)
//   final Widget Function(BuildContext context, T item)? selectedItemBuilder;

//   const GenericDropdown({
//     Key? key,
//     required this.items,
//     required this.selectedItem,
//     required this.onChanged,
//     required this.itemToString,
//     this.itemBuilder,
//     this.validationLabel,
//     this.selectedItemBuilder,
//     this.hintText,
//     this.title,
//     this.titleTextStyle,
//     this.isRequired = false,
//     this.validationHandle,
//     this.enabledBorder,
//     this.isReadOnly,
//     this.needsValidation = false,
//     this.autovalidateMode,
//     this.customValidationError,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colors;
//     final isTablet = Metrics.isTablet(context);
//     final isPortrait = Metrics.isPortrait(context);
//     log('[read only] ${isReadOnly}');
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         title != null
//             ? Padding(
//                 padding: EdgeInsets.only(
//                   top: Metrics.getResponsiveSize(context, 0.03),
//                   bottom: Metrics.getResponsiveSize(context, 0.03),
//                 ),
//                 child: RichText(
//                   textScaler: isTablet == true
//                       ? isPortrait
//                             ? const TextScaler.linear(0.6)
//                             : const TextScaler.linear(0.4)
//                       : const TextScaler.linear(1),
//                   text: TextSpan(
//                     text: title,
//                     style:
//                         titleTextStyle ??
//                         TextStyle(
//                           color: colors.colorBlack,
//                           fontWeight: FontWeight.bold,
//                           fontSize: Metrics.getFontSize(context, 15.5),
//                         ),
//                     children: [
//                       isRequired == true
//                           ? TextSpan(
//                               text: '*',
//                               style: TextStyle(
//                                 color: Colors.red,
//                                 fontSize: isTablet
//                                     ? Metrics.getFontSize(context, 10)
//                                     : Metrics.getFontSize(context, 14),
//                               ),
//                             )
//                           : const TextSpan(),
//                     ],
//                   ),
//                 ),
//               )
//             : Container(),
//         DropdownButtonHideUnderline(
//           child: DropdownButtonFormField2<T>(
//             isExpanded: true,
//             value: selectedItem,
//             items: _buildDropdownItems(context),
//             validator: needsValidation == true
//                 ? createDropdownValidator(validationLabel)
//                 : null,
//             onChanged: isReadOnly == true ? null : onChanged,
//             autovalidateMode: autovalidateMode,
//             selectedItemBuilder: (context) {
//               List<Widget> selectedWidgets = [];

//               int actualItemIndex = 0;

//               for (int i = 0; i < (items.length * 2) - 1; i++) {
//                 if (i.isEven) {
//                   final item = items[actualItemIndex];
//                   final itemString = itemToString(item);
//                   final isSelected = item == selectedItem;

//                   if (selectedItemBuilder != null) {
//                     selectedWidgets.add(selectedItemBuilder!(context, item));
//                   } else {
//                     selectedWidgets.add(
//                       RichText(
//                         text: TextSpan(
//                           text: itemString,
//                           style: TextStyle(
//                             color: colors.colorBlack,
//                             fontSize: Metrics.getFontSize(context, 14),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                   actualItemIndex++;
//                 } else {
//                   // For dividers, return an empty widget with zero height
//                   selectedWidgets.add(const SizedBox.shrink());
//                 }
//               }

//               return selectedWidgets;
//             },
//             hint: Text(
//               hintText!,
//               style: TextStyle(
//                 color: colors.isDarkMode ? Colors.white : Colors.grey,
//                 fontWeight: FontWeight.normal,
//                 fontSize: Metrics.isTablet(context)
//                     ? Metrics.getFontSize(context, 10)
//                     : Metrics.getFontSize(context, 14),
//               ),
//             ),
//             style: TextStyle(
//               color: colors.colorBlack,
//               fontSize: Metrics.isTablet(context)
//                   ? Metrics.getFontSize(context, 10)
//                   : Metrics.getFontSize(context, 14),
//             ),
//             buttonStyleData: ButtonStyleData(
//               height: Metrics.height(context) * 0.055,
//               decoration: BoxDecoration(
//                 // color: Colors.grey[50],
//                 color: isReadOnly == true
//                     ? colors.colorLightGrey100
//                     : colors.colorWhite,
//                 borderRadius: BorderRadius.circular(
//                   Metrics.height(context) * 0.02,
//                 ),
//               ),
//               padding: const EdgeInsets.all(0),
//             ),
//             decoration: InputDecoration(
//               fillColor: isReadOnly == true
//                   ? colors.colorLightGrey100
//                   : colors.colorWhite,
//               filled: true,
//               focusedErrorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red, width: 1),
//                 borderRadius: BorderRadius.circular(
//                   Metrics.height(context) * 0.02,
//                 ),
//               ),
//               errorMaxLines: 1,
//               errorStyle: TextStyle(
//                 color: Colors.red,

//                 fontSize: Metrics.getFontSize(context, 13),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red, width: 1),
//                 borderRadius: BorderRadius.circular(
//                   Metrics.height(context) * 0.02,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: colors.appbarColor, width: 1),
//                 borderRadius: BorderRadius.circular(
//                   Metrics.height(context) * 0.02,
//                 ),
//               ),
//               enabledBorder:
//                   enabledBorder ??
//                   OutlineInputBorder(
//                     borderSide: BorderSide(color: colors.colorLightGrey),
//                     borderRadius: BorderRadius.circular(
//                       Metrics.height(context) * 0.02,
//                     ),
//                   ),
//               isDense: true,
//               hintStyle: TextStyle(
//                 color: Colors.grey,
//                 fontSize: Metrics.getFontSize(context, 14),
//                 fontWeight: FontWeight.normal,
//               ),
//               contentPadding: const EdgeInsets.all(2),
//             ),
//             iconStyleData: IconStyleData(
//               icon: Icon(
//                 Icons.arrow_drop_down,
//                 size: Metrics.height(context) * 0.04,
//               ),
//               iconEnabledColor: colors.colorBlack,
//             ),
//             dropdownStyleData: DropdownStyleData(
//               elevation: 2,
//               decoration: BoxDecoration(
//                 color: colors.colorWhite,
//                 border: Border.all(color: colors.colorLightGrey),
//                 borderRadius: BorderRadius.circular(
//                   Metrics.height(context) * 0.01,
//                 ),
//               ),
//               isOverButton: false,
//               offset: Offset(0, -5),
//               maxHeight: 215,
//             ),
//             menuItemStyleData: MenuItemStyleData(
//               customHeights: generateCustomHeights(
//                 itemCount: items.length,
//                 itemHeight: 33,
//                 dividerHeight: 2,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   String? Function(T?) createDropdownValidator<T>(String? fieldName) {
//     return (T? value) {
//       if (value == null) {
//         return customValidationError ?? 'Please select $fieldName';
//       }
//       return null;
//     };
//   }

//   List<double> generateCustomHeights({
//     required int itemCount,
//     required double itemHeight,
//     required double dividerHeight,
//   }) {
//     List<double> heights = [];
//     for (var i = 0; i < (itemCount * 2) - 1; i++) {
//       if (i.isEven) {
//         // Even indexes: actual item height
//         heights.add(itemHeight);
//       } else {
//         // Odd indexes: divider height
//         heights.add(dividerHeight);
//       }
//     }
//     return heights;
//   }

//   List<DropdownMenuItem<T>> _buildDropdownItems(BuildContext context) {
//     final colors = Theme.of(context).colors;
//     List<DropdownMenuItem<T>> menuItems = [];

//     for (var i = 0; i < items.length; i++) {
//       final item = items[i];
//       final bool isSelected = item == selectedItem;

//       Widget child;
//       if (itemBuilder != null) {
//         child = itemBuilder!(context, item, isSelected);
//       } else {
//         // Default child: simple text with style change if selected
//         child = Text(
//           itemToString(item),
//           style: TextStyle(
//             fontSize: Metrics.getFontSize(context, 14),
//             color: isSelected ? colors.appbarColor : colors.colorBlack,
//             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//         );
//       }

//       menuItems.add(DropdownMenuItem<T>(value: item, child: child));

//       // Add divider between items except last one
//       if (i != items.length - 1) {
//         menuItems.add(
//           const DropdownMenuItem(enabled: false, child: Divider(height: 1)),
//         );
//       }
//     }

//     return menuItems;
//   }
// }

import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kaizen_elecon/constants/colors.dart';

import '../../constants/index.dart';

class GenericDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final String? hintText;
  final String? title;
  final TextStyle? titleTextStyle;
  final bool? isRequired;
  final OutlineInputBorder? enabledBorder;
  final String? validationLabel;
  final String? Function(T?)? customValidator;
  final bool? isReadOnly;
  final bool? needsValidation;
  final String? customValidationError;
  final AutovalidateMode? autovalidateMode;

  /// Converts item to simple string (for fallback or default usage)
  final String Function(T) itemToString;

  /// Custom builder for each dropdown item widget
  final Widget Function(BuildContext context, T item, bool isSelected)? itemBuilder;

  /// Optional custom builder for selected item widget (shown in the button)
  final Widget Function(BuildContext context, T item)? selectedItemBuilder;

  const GenericDropdown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.itemToString,
    this.itemBuilder,
    this.validationLabel,
    this.selectedItemBuilder,
    this.hintText,
    this.title,
    this.titleTextStyle,
    this.isRequired = false,
    this.customValidator,
    this.enabledBorder,
    this.isReadOnly,
    this.needsValidation = false,
    this.autovalidateMode,
    this.customValidationError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    final isTablet = Metrics.isTablet(context);
    final isPortrait = Metrics.isPortrait(context);

    log('[read only] ${isReadOnly}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.only(
              top: Metrics.getResponsiveSize(context, 0.03),
              bottom: Metrics.getResponsiveSize(context, 0.03),
            ),
            child: RichText(
              textScaler: isTablet
                  ? isPortrait
                      ? const TextScaler.linear(0.6)
                      : const TextScaler.linear(0.4)
                  : const TextScaler.linear(1),
              text: TextSpan(
                text: title,
                style: titleTextStyle ??
                    TextStyle(
                      color: colors.colorBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: Metrics.getFontSize(context, 15.5),
                    ),
                children: [
                  if (isRequired == true)
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: isTablet
                            ? Metrics.getFontSize(context, 10)
                            : Metrics.getFontSize(context, 14),
                      ),
                    ),
                ],
              ),
            ),
          ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<T>(
            isExpanded: true,
            value: selectedItem,
            items: _buildDropdownItems(context),
            validator: needsValidation == true
                ? (value) {
                    // ✅ Use custom validator if provided
                    if (customValidator != null) {
                      return customValidator!(value);
                    }
                    // Default required validation
                    if (isRequired == true && value == null) {
                      return customValidationError ?? 'Please select $validationLabel';
                    }
                    return null;
                  }
                : null,
            onChanged: isReadOnly == true ? null : onChanged,
            autovalidateMode: autovalidateMode?? AutovalidateMode.onUserInteraction,
            selectedItemBuilder: (context) {
              List<Widget> selectedWidgets = [];
              int actualItemIndex = 0;

              for (int i = 0; i < (items.length * 2) - 1; i++) {
                if (i.isEven) {
                  final item = items[actualItemIndex];
                  final isSelected = item == selectedItem;

                  if (selectedItemBuilder != null) {
                    selectedWidgets.add(selectedItemBuilder!(context, item));
                  } else {
                    selectedWidgets.add(
                      RichText(
                        text: TextSpan(
                          text: itemToString(item),
                          style: TextStyle(
                            color: colors.colorBlack,
                            fontSize: Metrics.getFontSize(context, 14),
                          ),
                        ),
                      ),
                    );
                  }
                  actualItemIndex++;
                } else {
                  selectedWidgets.add(const SizedBox.shrink());
                }
              }

              return selectedWidgets;
            },
            hint: Text(
              hintText ?? '',
              style: TextStyle(
                color: colors.isDarkMode ? Colors.white : Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: Metrics.isTablet(context)
                    ? Metrics.getFontSize(context, 10)
                    : Metrics.getFontSize(context, 14),
              ),
            ),
            style: TextStyle(
              color: colors.colorBlack,
              fontSize: Metrics.isTablet(context)
                  ? Metrics.getFontSize(context, 10)
                  : Metrics.getFontSize(context, 14),
            ),
            buttonStyleData: ButtonStyleData(
              height: Metrics.height(context) * 0.055,
              decoration: BoxDecoration(
                color: isReadOnly == true
                    ? colors.colorLightGrey100
                    : colors.colorWhite,
                borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
              ),
              padding: const EdgeInsets.all(0),
            ),
            decoration: InputDecoration(
              fillColor: isReadOnly == true ? colors.colorLightGrey100 : colors.colorWhite,
              filled: true,
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
              ),
              errorMaxLines: 1,
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: Metrics.getFontSize(context, 13),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.appbarColor, width: 1),
                borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
              ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: colors.colorLightGrey),
                    borderRadius: BorderRadius.circular(Metrics.height(context) * 0.02),
                  ),
              isDense: true,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: Metrics.getFontSize(context, 14),
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.all(2),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                size: Metrics.height(context) * 0.04,
              ),
              iconEnabledColor: colors.colorBlack,
            ),
            dropdownStyleData: DropdownStyleData(
              elevation: 2,
              decoration: BoxDecoration(
                color: colors.colorWhite,
                border: Border.all(color: colors.colorLightGrey),
                borderRadius: BorderRadius.circular(Metrics.height(context) * 0.01),
              ),
              isOverButton: false,
              offset: const Offset(0, -5),
              maxHeight: 215,
            ),
            menuItemStyleData: MenuItemStyleData(
              customHeights: generateCustomHeights(
                itemCount: items.length,
                itemHeight: 33,
                dividerHeight: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<double> generateCustomHeights({
    required int itemCount,
    required double itemHeight,
    required double dividerHeight,
  }) {
    List<double> heights = [];
    for (var i = 0; i < (itemCount * 2) - 1; i++) {
      if (i.isEven) {
        heights.add(itemHeight);
      } else {
        heights.add(dividerHeight);
      }
    }
    return heights;
  }

  List<DropdownMenuItem<T>> _buildDropdownItems(BuildContext context) {
    final colors = Theme.of(context).colors;
    List<DropdownMenuItem<T>> menuItems = [];

    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final bool isSelected = item == selectedItem;

      Widget child;
      if (itemBuilder != null) {
        child = itemBuilder!(context, item, isSelected);
      } else {
        child = Text(
          itemToString(item),
          style: TextStyle(
            fontSize: Metrics.getFontSize(context, 14),
            color: isSelected ? colors.appbarColor : colors.colorBlack,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        );
      }

      menuItems.add(DropdownMenuItem<T>(value: item, child: child));

      if (i != items.length - 1) {
        menuItems.add(const DropdownMenuItem(enabled: false, child: Divider(height: 1)));
      }
    }

    return menuItems;
  }
}

