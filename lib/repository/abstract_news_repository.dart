import 'package:pro_connect_tz/repository/mock_new_repository.dart';
import 'package:pro_connect_tz/repository/models/article.dart';

abstract class AbstractNewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);

}


