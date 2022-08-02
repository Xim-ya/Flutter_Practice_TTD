import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test/domain/model/article_model.dart';
import 'package:unit_test/domain/service/news_service.dart';
import 'package:unit_test/ui/news_view_model.dart';

// NewsService 인터페이스 상속
/// Bad Approach
// class BedMockNewsService implements NewsService {
//   bool getArticledCalled = false;
//
//   @override
//   Future<List<ArticleModel>> getArticle() async {
//     // Return And Put Predictable Articles
//     getArticledCalled = true;
//     return [
//       ArticleModel(title: 'Test 1', content: 'Test 1 Content'),
//       ArticleModel(title: 'Test 2', content: 'Test 2 Content'),
//       ArticleModel(title: 'Test 3', content: 'Test 1 Content'),
//       ArticleModel(title: 'Test 4', content: 'Test 2 Content'),
//     ];
//   }
// }

// 다른 인턴스 값을 주워야 할 때 용이.
// 각각의 다른 테스트 케이스에 용이.
class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsViewModel sut; // System Under Test
  late MockNewsService mockNewsService;

  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsViewModel(mockNewsService);
    /*
    sut = NewsViewModel(NewsService());
    이렇게 초기화하는 방식은 좋지 않다.
    Test Specific Implementaion하는 방식이 좋다.
     */
  });

  test("initial value are correct", () {
    expect(sut.articles, []);
  });
  // When We use Method It is remcommended to Use gorup

  group('[News View Model]', () {
    List<ArticleModel> articleList = [
      ArticleModel(title: "title 1", content: 'content 1'),
      ArticleModel(title: "title 2", content: 'content 2'),
      ArticleModel(title: "title 3", content: 'content 3'),
    ];
    void arrangeNewsServiceArticleDataReturns() {
      when(() => mockNewsService.getArticle())
          .thenAnswer((invocation) async => articleList);
    }

    test('기사 정보 호출 메소드 작동여부', () async {
      arrangeNewsServiceArticleDataReturns(); // Arange Mocks
      await sut.loadArticles(); // Act
      verify(() => mockNewsService.getArticle()).called(1); // Assert
    });

    test('기사 정보 데이터 리턴 여부', () async {
      arrangeNewsServiceArticleDataReturns();
      final future = sut.loadArticles();
      expect(sut.loading, true);
      await future;
      expect(sut.articles, articleList);
      expect(sut.loading, false);
    });
  });
}
