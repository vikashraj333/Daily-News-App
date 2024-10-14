import 'package:daily_news/views/category_news.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;
  const CategoryCard(
      {super.key, required this.imageAssetUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: AssetImage(imageAssetUrl),
                height: 60,
                width: 120,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black26,
              ),
              child: categoryName.text.center
                  .color(Colors.white)
                  .fontWeight(FontWeight.w500)
                  .size(14)
                  .make(),
            ),
          ],
        ),
      ),
    );
  }
}
