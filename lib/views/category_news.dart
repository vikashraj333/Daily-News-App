import 'package:daily_news/components/news_category.dart';
import 'package:daily_news/components/newstile_widget.dart';
import 'package:daily_news/models/article.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  const CategoryNews({super.key, required this.newsCategory});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  bool _loading = true;
  List<Article> newslist = [];

  @override 
  void initState(){
    getNews();
    super.initState();
  }

  void getNews() async {
    NewsForCategory news = NewsForCategory();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title:  Text(
          '${widget.newsCategory.firstLetterUpperCase()} News',
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.red, Colors.orange],
            ),
          ),
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: newslist.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        imgUrl: newslist[index].urlToImage ?? "",
                        title: newslist[index].title ?? "",
                        desc: newslist[index].description ?? "",
                        content: newslist[index].content ?? "",
                        posturl: newslist[index].articleUrl ?? "",
                      );
                    }),
              ),
            ),
    );
  }
}