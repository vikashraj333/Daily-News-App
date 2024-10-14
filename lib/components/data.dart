import '../models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> myCategories = [];
  CategoryModel categoryModel;

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageAssetUrl = 'assets/images/technology.jpg';
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageAssetUrl = 'assets/images/business.jpg';
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageAssetUrl = 'assets/images/entertainment.jpg';
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageAssetUrl = 'assets/images/general.jpg';
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageAssetUrl = 'assets/images/health.jpg';
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageAssetUrl = 'assets/images/science.jpg';
  myCategories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageAssetUrl = 'assets/images/sports.jpg';
  myCategories.add(categoryModel);

  return myCategories;
}