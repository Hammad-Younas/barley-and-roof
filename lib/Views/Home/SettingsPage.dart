import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:barley_and_roof/Constants/Svgs/SvgIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../Widgets/Texts/CommonText.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.defaultPadding,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              CommonText(
                text: "My Current Requests",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomContainer('Payment Notifications'),
          const SizedBox(
            height: 10,
          ),
          CustomContainer('Email Notifications'),
          const SizedBox(
            height: 10,
          ),
          CustomContainer('Announcements Notifications'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              CommonText(
                text: "Teenant Agreement",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          DownloadAgreement(
            text: 'Download Agreement',
          ),
        ],
      ),
    );
  }

  Widget CustomContainer(String title) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffeeeeee),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          const switchbutton(),
        ],
      ),
    );
  }
}

//switch button
class switchbutton extends StatefulWidget {
  const switchbutton({Key? key}) : super(key: key);

  @override
  State<switchbutton> createState() => _switchbuttonState();
}

class _switchbuttonState extends State<switchbutton> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterSwitch(
        width: 28.0,
        height: 20.0,
        toggleSize: 15.0,
        value: status,
        borderRadius: 100.0,
        padding: 2.0,
        toggleColor: Colors.white,
        switchBorder: Border.all(
          color: AppColors.primaryColor,
          width: 1.0,
        ),
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.white,
        inactiveToggleColor: AppColors.primaryColor,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        },
      ),
    );
  }
}

class DownloadAgreement extends StatelessWidget {
  String text;

  void Function()? onTap;
  bool isLoading;
  DownloadAgreement({
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
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.string(SvgIcons.downloadIcon),
                    const SizedBox(
                      width: 8,
                    ),
                    CommonText(
                      text: text,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
