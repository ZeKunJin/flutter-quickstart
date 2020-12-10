import 'package:flutter/material.dart';
import 'package:flutter_quickstart/utils/navigate.dart';
import '../../api/eg.dart';
import '../../entity/eg_entity.dart';

class HomePage extends StatefulWidget {
  _HomePageSate createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  bool loading = false;
  List<EgArrayEntity> egArray = [];
  ScrollController _scrollController = ScrollController();

  Future<void> _fetch() async {
    var params = {'username': 'USERNAME'};
    var res = await AuthRequest.getArray(params);
    setState(() {
      EgEntity egEntity = EgEntity.fromJson(res);
      egArray = egEntity.data;
    });
  }

  @override
  void initState() {
    _fetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('on reach bottom');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME')),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.pink,
        onRefresh: _fetch,
        child: ListView.builder(
          itemCount: egArray.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, .0),
              child: InkWell(
                onTap: () {
                  Navigate.to(context, '/product?id=${egArray[index].id}');
                },
                child: Image.network(egArray[index].image),
              ),
            );
          },
          controller: _scrollController,
        ),
      ),
    );
  }
}
