import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  
  //const HomePageTemp({Key key}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: _createItemMin(),
      ),
    );
  }

  List<Widget> _createItems(){

    List<Widget> list = new List<Widget>();
    for (var item in options) {
      final tempWidget = ListTile(title: Text(item),);
      
      list..add(tempWidget)
          ..add(Divider());
      
      //list.add(tempWidget);
      //list.add(Divider());
    }

    return list;
  }

  List<Widget> _createItemMin(){
    var widgets = options.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Description'),
            leading: Icon(Icons.add),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }

}