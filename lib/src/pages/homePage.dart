import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_api/src/components/allNewsComponents.dart';
import 'package:news_api/src/components/catagoryComponents.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/baseController.dart';
import 'package:news_api/src/widgets/kText.dart';
import 'package:news_api/src/widgets/loadingView.dart';
import 'package:news_api/src/widgets/notFound.dart';
import 'package:news_api/src/widgets/shammerWidget.dart';

class HomePage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    newsC.getNews();
    catagoryC.getCatagory();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: black,
          ),
        ),
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KText(
              text: 'Flutter With ',
              fontSize: 18,
              color: black87,
              fontWeight: FontWeight.w600,
            ),
            KText(
              text: 'Fsd',
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Obx(
        () => newsC.isLoading.value == false
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: padding10,
                  child: newsC.article.isNotEmpty
                      ? Column(
                          children: [
                            CatagoryComponent(),
                            sizeBox10,
                            AllNewsComponents(),
                          ],
                        )
                      : NotFound(),
                ),
              )
            : Center(
                child: customShammerView(),
              ),
      ),
    );
  }

  customShammerView() {
    return ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          return CustomShammerWidget();
        });
  }
}
