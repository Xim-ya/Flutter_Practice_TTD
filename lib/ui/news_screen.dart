import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_test/domain/service/news_service.dart';
import 'package:unit_test/ui/news_view_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _controller = Get.put(NewsViewModel(NewsService()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News"),
        ),
        body: Obx(
          () => _controller.articles.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: ListView.builder(
                      itemCount: _controller.articles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Text(
                              _controller.articles[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(),
                            ),
                            Text(_controller.articles[index].content),
                          ],
                        );
                      }),
                ),
        ));
  }
}
