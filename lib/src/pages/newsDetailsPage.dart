import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/baseController.dart';
import 'package:news_api/src/models/article.dart';
import 'package:news_api/src/pages/addNewNewsPage.dart';
import 'package:news_api/src/pages/updateNewsPage.dart';
import 'package:news_api/src/pages/webViewContent.dart';
import 'package:news_api/src/widgets/kText.dart';
import 'package:news_api/src/widgets/loadingView.dart';

class NewsDetailsPage extends StatelessWidget with BaseController {
  final Article allNews;
  NewsDetailsPage({
    required this.allNews,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: allNews.title.toString(),
          color: black,
          fontFamily: medium,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(AddNewNewsPage()),
            icon: Icon(
              Icons.add,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(
              UpdateNewsPage(allNews: allNews),
            ),
            icon: Icon(
              Icons.edit,
              size: 20,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          allNews.urlToImage != null
              ? CachedNetworkImage(
                  imageUrl: allNews.urlToImage.toString(),
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.network('http://via.placeholder.com/400x230'),
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: CircularProgressIndicator(
                      color: red,
                    ),
                  ),
                ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        EvaIcons.person,
                        size: 50,
                        color: white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: KText(
                        text: allNews.author != null
                            ? allNews.author.toString()
                            : 'Unknown',
                        maxLines: 2,
                        color: black,
                        fontFamily: medium,
                        textAlign: TextAlign.justify,
                        fontSize: 14,
                      ),
                    ),
                  ],
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
                      text: DateFormat(' KK:mm:ss | dd-MM-yyyy')
                          .format(allNews.publishedAt as DateTime),
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
                        text: allNews.description.toString(),
                        maxLines: 3,
                        color: black54,
                        fontFamily: regular,
                        textAlign: TextAlign.justify,
                        fontSize: 12,
                      )
                    : Container(),
                Divider(
                  color: Colors.grey.shade200,
                ),
                KText(
                  text: allNews.content.toString(),
                  maxLines: 100,
                  color: black54,
                  fontFamily: regular,
                  textAlign: TextAlign.justify,
                  fontSize: 12,
                ),
                sizeBox20,
                Divider(color: Colors.grey.shade200),
                sizeBox20,
                InkWell(
                  onTap: () => Get.to(
                    WebViewContent(
                      url: allNews.url.toString(),
                      title: allNews.title.toString(),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: blueGrey.withOpacity(.10),
                      // ),
                      color: blueGrey.withOpacity(.10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: KText(
                          text: 'View Original News',
                          color: black,
                          fontFamily: medium,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          recentNews(),
          sizeBox20,
        ],
      ),
    );
  }

  Widget recentNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey.shade200),
        sizeBox10,
        Padding(
          padding: padding10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KText(
                text: 'Recent News',
                maxLines: 2,
                color: black,
                fontFamily: medium,
                textAlign: TextAlign.justify,
                fontSize: 18,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        sizeBox10,
        Obx(
          () => newsC.isLoading.value == false
              ? Container(
                  height: 250,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(right: 10),
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: newsC.article.length,
                    itemBuilder: (BuildContext context, int index) {
                      final allNews = newsC.article[index];
                      return InkWell(
                        onTap: () => Get.offAll(
                          NewsDetailsPage(
                            allNews: allNews,
                          ),
                        ),
                        child: Container(
                          width: 250,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: blueGrey.withOpacity(.10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              allNews.urlToImage != null
                                  ? Container(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              allNews.urlToImage.toString(),
                                          fit: BoxFit.cover,
                                          width: Get.width,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                                backgroundColor: red,
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                          // errorWidget: (context, url, error) =>
                                          //     Image.network(
                                          //         'http://via.placeholder.com/400x230'),
                                        ),
                                      ),
                                    )
                                  : Center(child: LoadingView()),
                              Divider(
                                color: Colors.grey.shade200,
                              ),
                              Padding(
                                padding: padding10,
                                child: Expanded(
                                  child: KText(
                                    text: allNews.title.toString(),
                                    maxLines: 2,
                                    color: black,
                                    fontFamily: medium,
                                    textAlign: TextAlign.justify,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: LoadingView(),
                ),
        ),
      ],
    );
  }
}
