import 'dart:convert';

import 'package:newstrove/models/article.dart';
import 'package:http/http.dart' as http;


class News{
  List<Article> news=[];
  Future<void> getNews() async{
    String url="https://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=dab0fabec17c4f8385fbdc00a6fa371d";

    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          Article article=Article(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publshedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],

          );
          news.add(article);
        }
      });
    }
  }




}