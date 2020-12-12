import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quickstart/provider/counter.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CATEGORY')),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: EgInput(
              change: (value) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(value),
                  behavior: SnackBarBehavior.floating,
                ));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                EgProviderCount(),
                EgButtonGroup(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EgButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var methods = context.watch<Counter>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          onPressed: () => methods.decrement(),
          child: Text('decrement'),
        ),
        RaisedButton(
          onPressed: () => context.read<Counter>().increment(),
          child: Text('increment'),
        ),
      ],
    );
  }
}

class EgInput extends StatelessWidget {
  final TextEditingController inputContrtoller = TextEditingController();
  final ValueChanged<String> change;

  EgInput({this.change});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: inputContrtoller,
          autofocus: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            labelText: 'category',
            helperText: 'please enter search content',
          ),
        ),
        RaisedButton(
          onPressed: () {
            change(inputContrtoller.text);
          },
          child: Text('get input value'),
        )
      ],
    );
  }
}

class EgProviderCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<Counter>();

    return Text(
      '${data.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
