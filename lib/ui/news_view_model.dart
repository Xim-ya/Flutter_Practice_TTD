import 'package:get/get.dart';
import 'package:unit_test/domain/model/article_model.dart';
import 'package:unit_test/domain/service/news_service.dart';

class NewsViewModel extends GetxController {
  NewsViewModel(this._service);

  final NewsService _service;
  final RxList<ArticleModel> _articles = RxList();
  bool loading = false;

  List<ArticleModel> get articles => _articles;

  Future<void> loadArticles() async {
    loading = true;
    _articles.value = await _service.getArticle();
    loading = false;
  }

  @override
  void onInit() {
    loadArticles();
    super.onInit();
  }
}
