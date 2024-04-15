import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/category_list.dart';
import 'package:studdy/src/features/home/screens/categories.dart';
import 'package:studdy/src/routing/navigation.dart';

class CategoryController extends GetxController {
    void seeAllCategories(String category) {
    AppNavigation.navigateToWithParams(const CategoryList(), {"name":category});
  }

}