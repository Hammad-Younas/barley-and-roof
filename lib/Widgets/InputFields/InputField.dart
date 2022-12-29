import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Widgets/Texts/CommonText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  Widget prefixIcon;
  String labelText, hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool obsecureText;
  String? initialValue;
  bool? enabled;
  int? maxlines;
  double? height;
  void Function()? onTap;
  InputField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    required this.hintText,
    this.enabled,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.maxlines,
    this.onTap,
    this.height,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
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
                  height: widget.height ?? 20,
                  child: TextFormField(
                    maxLines: widget.maxlines ?? 1,
                    style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    enabled: widget.enabled,
                    initialValue: widget.initialValue,
                    obscureText: widget.obsecureText,
                    keyboardType: widget.keyboardType,
                    controller: widget.controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: widget.hintText,
                      contentPadding: const EdgeInsets.symmetric(vertical: 2),
                      hintStyle: GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
