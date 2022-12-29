import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/Colors/AppColors.dart';
import '../Texts/CommonText.dart';

class PhoneField extends StatefulWidget {
  Widget prefixIcon;
  String labelText, hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool obsecureText;
  String? phone;
  bool? enabled;
  void Function()? onTap;
  PhoneField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    required this.hintText,
    this.enabled,
    this.phone,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  bool hasFocus = false;

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ??
          () {
            focusNode.requestFocus();
          },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xffEEEEEE),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            widget.prefixIcon,
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: widget.labelText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: Get.width * 0.62,
                  height: 20,
                  child: CommonText(
                    text: widget.phone ?? "Enter here",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
