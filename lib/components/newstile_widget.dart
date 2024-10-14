import 'package:daily_news/views/article_view.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;
  const NewsTile(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.desc,
      required this.content,
      required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(postUrl: posturl)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imgUrl,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              12.heightBox,
              title.text
                  .maxLines(2)
                  .color(Colors.white70)
                  .size(20)
                  .fontWeight(FontWeight.w500)
                  .make(),
              4.heightBox,
              desc.text.maxLines(2).color(Colors.white60).size(14).make(),
            ],
          ),
        ),
      ),
    );
  }
}
