import 'package:flutter/material.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:super_tooltip/super_tooltip.dart';

class TooltipTextField extends StatefulWidget {
  final String title;
  final String hint;
  final String? tooltipMessage;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int? maxLines;

  const TooltipTextField({
    Key? key,
    required this.title,
    required this.hint,
    this.tooltipMessage,
    this.controller,
    this.onChanged,
    this.maxLines,
  }) : super(key: key);

  @override
  State<TooltipTextField> createState() => _TooltipTextFieldState();
}

class _TooltipTextFieldState extends State<TooltipTextField> {
  final FocusNode _focusNode = FocusNode();
  late SuperTooltip _tooltip;

  @override
  void initState() {
    super.initState();

    _tooltip = SuperTooltip(
      showCloseButton: false,
      popupDirection: TooltipDirection.down,
      content: Material(
        color: Colors.transparent,
        child: Text(
          widget.tooltipMessage ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus && widget.tooltipMessage != null) {
    //     Future.delayed(const Duration(milliseconds: 300), () {
    //       if (!_tooltip.isOpen) {
    //         _tooltip.show(context);
    //       }
    //     });
    //   } else {
    //     if (_tooltip.isOpen) {
    //       _tooltip.close();
    //     }
    //   }
    // });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    // _tooltip.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: colors.colorBlack,
            fontWeight: FontWeight.bold,
            fontSize: 15.5,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          maxLines: widget.maxLines ?? 1,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.colorLightGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.appbarColor),
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
