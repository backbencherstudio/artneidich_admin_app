import 'package:artneidich_admin/src/core/theme/theme_extension/color_pallete.dart';
import 'package:flutter/material.dart';

class CircleCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CircleCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  _CircleCheckboxState createState() => _CircleCheckboxState();
}

class _CircleCheckboxState extends State<CircleCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.value ? AppColor.primaryColor : Colors.transparent,
          border: Border.all(
            color: widget.value ? AppColor.primaryColor : AppColor.borderColor,
            width: 2.0,
          ),
        ),
        child: Center(
          child: widget.value
              ? Icon(
            Icons.check,
            color: AppColor.white,
            size: 18.0,
          )
              : null,
        ),
      ),
    );
  }
}
