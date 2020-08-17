import 'package:app_flutter_component/src/pages/alert_page.dart';
import 'package:app_flutter_component/src/providers/menu_provider.dart';
import 'package:app_flutter_component/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {

    //print(menuProvider.options);
    //get for use ListView
    /*menuProvider.loadData().then((data){
      print('_list');
      print(data);
    });*/

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext buildContext, AsyncSnapshot<List<dynamic>> snapshot){
        
        //print(snapshot.data);

        return ListView(
          children: _listItems(snapshot.data, buildContext),
        ); 
      },
    );

    /*return ListView(
      children: _listItems(),
    );*/
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext buildContext) {
    /*return [
      ListTile(title: Text('Hello World')),
      Divider(),
      ListTile(title: Text('Hello World')),
      Divider(),
    ];*/
    final List<Widget> options = [];

    //if(data == null){ return []; }

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){
          
          /*final route = MaterialPageRoute(
            builder: (buildContext) =>AlertPage()
          );*/          
          
          //Navigator.push(buildContext, route);

          Navigator.pushNamed(buildContext, element['ruta']);
        },
      );

      options..add(widgetTemp)
             ..add(Divider());  
    });    

    return options;
  }
}