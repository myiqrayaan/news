import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadMorePage extends StatefulWidget {
  const ReadMorePage({super.key, required this.url});
  final String url;
  @override
  State<ReadMorePage> createState() => _ReadMorePageState();
}

class _ReadMorePageState extends State<ReadMorePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Read more on News...")),
      body: WebViewWidget(controller: controller),
    );
  }
}
