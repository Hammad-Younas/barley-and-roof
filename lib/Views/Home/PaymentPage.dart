import 'package:barley_and_roof/Constants/AppPaddings/AppPadding.dart';
import 'package:flutter/material.dart';

import '../../Constants/Colors/AppColors.dart';
import '../../Widgets/Texts/CommonText.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.defaultPadding,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xffeeeeee),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CommonText(
                            text: "Room No 123",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                          CommonText(
                            text: "2 Months Remaining on Tenancy",
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff808080),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Center(
                    child: Container(
                      height: 97,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CommonText(
                                  text: "Last Payment",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    CommonText(
                                      text: "\$7500",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CommonText(
                                      text: "12 Jan 2023",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CommonText(
                                  text: "Next Payment",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    CommonText(
                                      text: "\$4000",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CommonText(
                                      text: "12 Feb 2023(in 5 days)",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              CommonText(
                text: "My Payment History",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          paymentHistory("\$1500", "12 feb 2023", "Monthly Feb"),
          const SizedBox(
            height: 10,
          ),
          paymentHistory("\$7500", "12 Jan 2023", "New Booking"),
          const SizedBox(
            height: 10,
          ),
          paymentHistory("\$1000", "12 Jan 2023", "Booking Deposit"),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget paymentHistory(String price, Date, status) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffeeeeee)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: price,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              CommonText(
                text: Date,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: const Color(0xffb1b1b1),
              ),
            ],
          ),
          CommonText(
            text: status,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: const Color(0xffb1b1b1),
          ),
        ],
      ),
    );
  }
}
