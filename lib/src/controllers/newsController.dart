import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/configs/appConfigs.dart';
import 'package:news_api/src/models/article.dart';
import 'package:news_api/src/pages/homePage.dart';
import 'package:news_api/src/widgets/kText.dart';

class NewsController extends GetxController {
  final _dio = Dio();

  // final article = Map().obs;
  final article = RxList<Article>();

  final isLoading = RxBool(false);

  //

  final author = RxString('');
  final title = RxString('');
  final description = RxString('');
  final url = RxString('');
  final urlToImage = RxString('');

  final content = RxString('');
  // late DateTime? publishedAt ;

  //Missing Data Delete Method for Id Null'

  getNews() async {
    try {
      if (isLoading.value = true) {
        final res = await _dio.get(baseUrl);

        final List<Article> articleData = res.data['articles']
            .map((json) => Article.fromJson(json))
            .toList()
            .cast<Article>();

        if (res.statusCode == 200) {
          print('''--
Status Code - ${res.statusCode}''');
          print('Api Connected');
          print(articleData.length);
          print('--');
          article.addAll(articleData);
          isLoading.value = false;
        }
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        colorText: white,
      );
    }
    isLoading.value = false;
  }

  editNews() async {
    try {
      final res = await _dio.put(
        baseUrl,
        data: Article(
          author: author.value,
          description: description.value,
          title: title.value,
          url: url.value,
          urlToImage: urlToImage.value,
          publishedAt: null,
          content: content.value,
        ),
      );
      if (res.statusCode == 200) {
        Get.defaultDialog(
          title: 'Update success',
          content: KText(
            text: res.statusCode.toString(),
            color: black,
          ),
        );

        print(res.data);

        await Get.offAll(HomePage());

        return res.data;
      }
    } catch (e) {
      print(e.toString());

      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        colorText: white,
      );
    }
  }

  addNews() async {
    try {
      final res = await _dio.post(
        baseUrl,
        data: Article(
          author: author.value,
          description: description.value,
          title: title.value,
          url: url.value,
          urlToImage: urlToImage.value,
          publishedAt: DateTime.now(),
          content: content.value,
        ),
      );
      if (res.statusCode == 201) {
        Get.defaultDialog(
          title: 'Add success',
          content: KText(
            text: res.statusCode.toString(),
            color: black,
          ),
        );
        await Future.delayed(Duration(seconds: 1));
        await Get.to(HomePage());
        print(res.data.length);
        return res.data;
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        colorText: white,
      );
    }
  }
}
