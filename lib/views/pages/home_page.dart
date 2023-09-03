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
  String category = "general";

  void fetchData() async {
    List<NewsModel> tmpData = await NewsAPI.fetchNews(category);
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
      appBar: AppBar(title: Text(category.toUpperCase())),
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple.shade100),
                child: const Center(
                    child: Text(
                  "News Category",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent),
                ))),
            ListTile(
                title: const Text("Business"),
                onTap: () {
                  setState(() {
                    category = "business";
                  });
                  fetchData();
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: const Text("Technology"),
                onTap: () {
                  setState(() {
                    category = "technology";
                  });
                  fetchData();
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: const Text("Sports"),
                onTap: () {
                  setState(() {
                    category = "sports";
                  });
                  fetchData();
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: const Text("Entertainment"),
                onTap: () {
                  setState(() {
                    category = "entertainment";
                  });
                  fetchData();
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: const Text("Health"),
                onTap: () {
                  setState(() {
                    category = "health";
                  });
                  fetchData();
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: const Text("Science"),
                onTap: () {
                  setState(() {
                    category = "science";
                  });
                  fetchData();
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
