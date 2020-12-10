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

  Future _fetch() {
    setState(() {
      loading = true;
    });

    var params = {'username': 'USERNAME'};
    AuthRequest.getArray(params).then((res) {
      setState(() {
        EgEntity egEntity = EgEntity.fromJson(res);
        egArray = egEntity.data;
      });
    });

    return Future.delayed(Duration(seconds: 3), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    _fetch();
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
        ),
      ),
    );
  }
}
