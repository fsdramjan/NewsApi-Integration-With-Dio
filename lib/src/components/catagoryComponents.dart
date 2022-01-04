import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/baseController.dart';
import 'package:news_api/src/pages/catagoryNewsPage.dart';
import 'package:news_api/src/widgets/loadingView.dart';
import 'package:news_api/src/widgets/shammerWidget.dart';

class CatagoryComponent extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizeBox10,
        Container(
          height: 65,
          // color: blueGrey,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(right: 10),
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: catagoryC.myCategories.length,
            itemBuilder: (BuildContext context, int index) {
              final allCatagory = catagoryC.myCategories[index];
              return InkWell(
                onTap: () => Get.to(
                  CatagoryNewsPage(
                    filterCatagory: allCatagory,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 14),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: allCatagory.imageAssetUrl,
                          // height: 60,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 65,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black26),
                        child: Text(
                          allCatagory.categorieName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
