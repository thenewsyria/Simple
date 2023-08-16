import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple/View/post_view.dart';

import 'Provider/post_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostsProvider()),
      ],
      child: MaterialApp(
          title: 'JSON Visualization App',
          home: MyHomePage(),
          debugShowCheckedModeBanner: false),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostsProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Visualization'),
      ),
      body: PostsListView(),
    );
  }
}
