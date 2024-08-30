import 'package:billingapp/res/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode? focusNode;
  final Color? backGroundColor;
  final String? hintText;
  final TextInputType? textInputType;

  const AppTextField({
    super.key,
    this.backGroundColor,
    this.hintText,
    required this.textController,
    this.focusNode, this.textInputType,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.sp),
      height: 48.sp,
      decoration: BoxDecoration(
        color: widget.backGroundColor ?? itsGreyColor.shade200,
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: Center(
        child: TextFormField(
          keyboardType: widget.textInputType ?? TextInputType.text,
          controller: widget.textController,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText?.validate(),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.sp,
            ),
          ),
          validator: (val) => null,
        ),
      ),
    );
  }
}
