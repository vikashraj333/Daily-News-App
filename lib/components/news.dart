import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/article.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    const String url =
       // "https://newsapi.org/v2/everything?q=tesla&from=2024-09-10&sortBy=publishedAt&apiKey=4231556d29084b82ae30fb7cbda41d11";
        "https://newsapi.org/v2/everything?q=apple&from=2024-14-10&sortBy=popularity&apiKey=4231556d29084b82ae30fb7cbda41d11";
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

        if (jsonData['status'] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element['urlToImage'] != null && element['description'] != null) {
              Article article = Article(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                urlToImage: element['urlToImage'],
                publishedAt: DateTime.parse(element['publishedAt']),
                content: element["content"],
                articleUrl: element["url"],
              );
              news.add(article);
            }
          });
        }
      } else {
        // Handle API request failure
        print('Failed to load news');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }
}