import 'package:flutter/material.dart';
import 'package:flutter_cnode/models/topic.dart';
import 'package:flutter_cnode/pages/home_drawer.dart';
import 'package:flutter_cnode/services/apis.dart';
import 'package:flutter_cnode/widgets/better_future_builder.dart';
import 'package:flutter_cnode/widgets/home_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: Text('CNode'),
      ),
      body: BetterFutureBuilder<List<Topic>>(
        future: getTopics(mdrender: false),
        builder: (context, data) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return HomeList(data[index]);
            },
            itemCount: data.length,
            itemExtent: 100,
          );
        },
      ),
    );
  }
}
