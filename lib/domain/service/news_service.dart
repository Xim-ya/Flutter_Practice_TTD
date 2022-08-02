import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:unit_test/domain/model/article_model.dart';

class NewsService {
  final _articles = List.generate(
      10,
      (_) => ArticleModel(
          title: lorem(paragraphs: 1, words: 3),
          content: lorem(paragraphs: 10, words: 500)));

  Future<List<ArticleModel>> getArticle() async {
    await Future.delayed(const Duration(seconds: 1));
    return _articles;
  }
}
