import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/theme.dart';

class CustomTextfield extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final Function() onChanged;
  const CustomTextfield(
      {super.key,
      required this.placeholder,
      required this.controller,
      required this.onChanged});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: borderRadius,
        border: active
            ? Border.all(color: primaryColor, width: 1)
            : Border.all(color: surfaceColor, width: 1),
      ),
      child: CupertinoTextField(
        onChanged: (value) {
          setState(() {
            active = value.isNotEmpty;
          });
          widget.onChanged();
        },
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        controller: widget.controller,
        placeholder: widget.placeholder,
      ),
    );
  }
}
