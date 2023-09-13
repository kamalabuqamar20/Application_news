import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/service/news_service.dart';

class ArticleProvider extends ChangeNotifier {
  List<ArticleModel> _article = [];
  NewsService? newsService;
  set setArticle(List<ArticleModel> article) {
    _article = article;
    notifyListeners();
  }

  List<ArticleModel> get getArticle {
    return _article;
  }
}
