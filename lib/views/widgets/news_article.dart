import 'package:flutter/material.dart';

class NewsArticle extends StatelessWidget {
  const NewsArticle({
    required this.content,
    required this.desc,
    required this.imgUrl,
    required this.title,
    required this.url,
    super.key,
  });

  final String imgUrl, title, content, desc, url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
          imgUrl,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            desc,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 17,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Read More"),
            ),
          ),
        )
      ]),
    );
  }
}
