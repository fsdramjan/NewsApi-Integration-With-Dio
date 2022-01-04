import 'package:get/get.dart';
import 'package:news_api/src/controllers/catagoryController.dart';
import 'package:news_api/src/controllers/newsController.dart';

class BaseController {
  final newsC = Get.put(NewsController());
  final catagoryC = Get.put(CatagoryController());
}
