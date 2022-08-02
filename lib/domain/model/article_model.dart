class ArticleModel {
  final String title;
  final String content;

  ArticleModel({required this.title, required this.content});

  @override
  String toString() => 'Article Info($title + $content)';
}
