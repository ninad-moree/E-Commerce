import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    loadCategories();
    super.onInit();
  }

  // Load Category Data
  Future<void> loadCategories() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source(firebase / api)
      final categories = await _categoryRepository.getAllCategories();

      // Update Category List
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(
        allCategories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: 'Error: $e');
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  // Load Selected Category Data

  // Get Category or Subcategory Products
}
