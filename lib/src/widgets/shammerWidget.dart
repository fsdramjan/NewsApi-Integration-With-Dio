import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appColors.dart';

class CustomShammerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: blueGrey.withOpacity(.10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            sizeBox10,
            Padding(
              padding: padding10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customShammerWidget(20, Get.width / 1),
                  sizeBox10,
                  customShammerWidget(20, Get.width),
                  sizeBox20,
                  customShammerWidget(15, Get.width / 2),
                  sizeBox10,
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  sizeBox10,
                  customShammerWidget(10, Get.width),
                  SizedBox(height: 5),
                  customShammerWidget(10, Get.width / 2),
                  SizedBox(height: 5),
                  customShammerWidget(10, Get.width / 3),
                  sizeBox10,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customShammerWidget(
    double height,
    double width,
  ) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
