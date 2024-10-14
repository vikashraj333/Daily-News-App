import 'package:daily_news/components/category_card_widget.dart';
import 'package:daily_news/components/data.dart';
import 'package:daily_news/components/news.dart';
import 'package:daily_news/components/newstile_widget.dart';
import 'package:daily_news/models/article.dart';
import 'package:daily_news/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;
  List<Article> newsList = [];
  List<CategoryModel> categories = [];

  Future<void> getNews() async {
    News news = News();
    await news.getNews();

    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: 'Flutter Daily News'.text.make(),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.red, Colors.orange],
          )),
        ),
      ),
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                                imageAssetUrl: categories[index].imageAssetUrl,
                                categoryName: categories[index].categoryName);
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: newsList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context,index){
                          return NewsTile(  imgUrl: newsList[index].urlToImage ?? "",
                            title: newsList[index].title ?? "",
                            desc: newsList[index].description ?? "",
                            content: newsList[index].content ?? "",
                            posturl: newsList[index].articleUrl ?? "",);
                        }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
