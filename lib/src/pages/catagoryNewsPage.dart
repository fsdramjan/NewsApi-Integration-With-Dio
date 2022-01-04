import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/baseController.dart';
import 'package:news_api/src/models/catagory.dart';
import 'package:news_api/src/pages/newsDetailsPage.dart';
import 'package:news_api/src/widgets/kText.dart';
import 'package:news_api/src/widgets/loadingView.dart';
import 'package:news_api/src/widgets/notFound.dart';

class CatagoryNewsPage extends StatelessWidget with BaseController {
  final Catagory filterCatagory;
  CatagoryNewsPage({
    required this.filterCatagory,
  });

  @override
  Widget build(BuildContext context) {
    catagoryC.getCatagory();
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: filterCatagory.categorieName,
          color: black,
          fontFamily: medium,
        ),
      ),
      body: Obx(
        () => Padding(
          padding: padding10,
          child: ListView(
            children: [
              Container(
                // color: blueGrey,
                height: Get.height / 3,
                width: Get.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: filterCatagory.imageAssetUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black26,
                      ),
                      child: KText(
                        text: filterCatagory.categorieName,
                        textAlign: TextAlign.center,
                        color: white,
                        fontFamily: medium,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              sizeBox10,
              Divider(color: Colors.grey.shade200),
              catagoryC.catagoryFilters.isNotEmpty
                  ? catagoryC.isLoading.value
                      ? ListView.builder(
                          // padding: padding10,
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: catagoryC.catagoryFilters.length,
                          itemBuilder: (BuildContext context, int index) {
                            final allNews = catagoryC.catagoryFilters[index];
                            print(allNews);

                            return GestureDetector(
                              onTap: () => Get.to(
                                NewsDetailsPage(
                                  allNews: allNews,
                                ),
                              ),
                              child: Container(
                                // height: 350,
                                width: Get.width,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: blueGrey.withOpacity(.10)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: allNews.urlToImage.toString(),
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                              backgroundColor: Colors.brown,
                                              value: downloadProgress.progress),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                                'http://via.placeholder.com/400x230'),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          KText(
                                            text: allNews.title.toString(),
                                            maxLines: 2,
                                            color: black,
                                            fontFamily: medium,
                                            textAlign: TextAlign.justify,
                                            fontSize: 16,
                                          ),
                                          sizeBox10,
                                          Row(
                                            children: [
                                              KText(
                                                text: 'PublishedAt:',
                                                maxLines: 3,
                                                color: black54,
                                                fontFamily: regular,
                                                textAlign: TextAlign.justify,
                                                fontSize: 12,
                                              ),
                                              KText(
                                                text: DateFormat(
                                                        ' KK:mm:ss | dd-MM-yyyy')
                                                    .format(allNews.publishedAt
                                                        as DateTime),
                                                color: black,
                                                fontFamily: regular,
                                                textAlign: TextAlign.justify,
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey.shade200,
                                          ),
                                          allNews.description != null
                                              ? KText(
                                                  text: allNews.description
                                                      .toString(),
                                                  maxLines: 3,
                                                  color: black54,
                                                  fontFamily: regular,
                                                  textAlign: TextAlign.justify,
                                                  fontSize: 12,
                                                )
                                              : KText(
                                                  text: allNews.content
                                                      .toString(),
                                                  maxLines: 3,
                                                  color: black54,
                                                  fontFamily: regular,
                                                  textAlign: TextAlign.justify,
                                                  fontSize: 12,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : LoadingView()
                  : NotFound()
            ],
          ),
        ),
      ),
    );
  }
}
