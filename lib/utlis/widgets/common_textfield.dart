import 'package:flutter/material.dart';
import 'package:municipality_car_management_system/utlis/assets/app_colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.onTap,
    this.suffixIconData,
    this.focusNode,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function()? onTap;
  final IconData? suffixIconData;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Open suggestions when tapped
      child: IgnorePointer(
        ignoring: true, // Disable manual typing
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          cursorColor: Colors.black,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColor.darkTextColor,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: AppColor.darkTextColor,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: suffixIconData != null
                ? Icon(
                    suffixIconData,
                    color: AppColor.darkTextColor,
                  )
                : const SizedBox(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColor.primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColor.darkTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
