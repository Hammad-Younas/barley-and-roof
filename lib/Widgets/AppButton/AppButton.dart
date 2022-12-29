import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Widgets/Texts/CommonText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppButton extends StatelessWidget {
  String text;

  void Function()? onTap;
  bool isLoading;
  AppButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? const SpinKitThreeBounce(
                  size: 20,
                  color: Colors.white,
                )
              : CommonText(
                  text: text,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
