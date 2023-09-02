import 'package:flutter/material.dart';

import '../../controllers/news_api.dart';
import '../../models/news_model.dart';
import '../widgets/news_article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModel> allNews = [];

  void fetchData() async {
    List<NewsModel> tmpData = await NewsAPI.fetchNews();
    setState(() {
      allNews = tmpData;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allNews.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: allNews.length,
              itemBuilder: (context, index) => NewsArticle(
                imgUrl: allNews[index].urlToImage,
                content: allNews[index].content,
                desc: allNews[index].description,
                title: allNews[index].title,
                url: allNews[index].url,
              ),
            ),
    );
  }
}
