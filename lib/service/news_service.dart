import 'package:dio/dio.dart';
import 'package:news_app/models/articles_model.dart';

class NewsService {
  Dio dio = Dio();
  List<ArticleModel> articlesList = [];
  String baseUrl = 'https://newsapi.org/v2';
  String apiKey = '872072cdb1bc46be95aeda317cd1d20b';
  String country = 'us';

  Future<List<ArticleModel>> getGeneralNews(
      {required String nameCategory}) async {
    Response response = await dio.get(
        '$baseUrl/top-headlines?country=$country&apiKey=$apiKey&category=$nameCategory');//$baseUrl/top-headlines?country=$country&apiKey=$apiKey&category=$nameCategory
    Map<String, dynamic> jsonData = response.data;

    List<dynamic> articles = jsonData['articles'];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(article);
      articlesList.add(articleModel);
    }

    return articlesList;
  }
}
