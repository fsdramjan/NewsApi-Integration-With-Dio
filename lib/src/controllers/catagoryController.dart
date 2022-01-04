import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appConfigs.dart';
import 'package:news_api/src/models/article.dart';
import 'package:news_api/src/models/catagory.dart';

class CatagoryController extends GetxController {
  // final allData = RxList<Article>();
  final catagoryFilters = RxList<Article>();
  final _dio = Dio();

  final isLoading = RxBool(false);
  getCatagory() async {
    try {
      if (isLoading.value = true) {
        final res = await _dio.get(baseUrl);
        final List<Article> shortByCatagory = res.data['articles']
            .map((json) => Article.fromJson(json))
            .toList()
            .cast<Article>();

        if (res.statusCode == 200) {
          print('Catagory $shortByCatagory');

          catagoryFilters.addAll(shortByCatagory);

          isLoading.value = false;
        }
      } 
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  final myCategories = [
    Catagory(
      categorieName: 'Business',
      imageAssetUrl:
          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80',
      filterCatagory: 'business',
    ),
    Catagory(
      categorieName: 'Entertainment',
      imageAssetUrl:
          'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
      filterCatagory: 'entertainment',
    ),
    Catagory(
      categorieName: 'General',
      imageAssetUrl:
          'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
      filterCatagory: 'general',
    ),
    Catagory(
      categorieName: 'Health',
      imageAssetUrl:
          'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80',
      filterCatagory: 'health',
    ),
    Catagory(
      categorieName: 'Science',
      imageAssetUrl:
          'https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80',
      filterCatagory: 'science',
    ),
    Catagory(
      categorieName: 'Sports',
      imageAssetUrl:
          'https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
      filterCatagory: 'sports',
    ),
    Catagory(
      categorieName: 'Technology',
      imageAssetUrl:
          'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
      filterCatagory: 'technology',
    ),
  ];
}
