import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumbers = new List(); // = [1,2,3,4,5];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _add10Images();

    _scrollController.addListener(() {
      //print('Scrol!!!');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_add10Images();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),            
        ],
      )          
    );
  }

  Widget _createList(){
    return RefreshIndicator(
      onRefresh: getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index){
          
          final imagen = _listNumbers[index];
          
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future <Null> getPage1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listNumbers.clear();
      _lastItem++;
      _add10Images();
    });

    return Future.delayed(duration);
  }

  void _add10Images(){
    for(var i=1; i<10; i++){
      _lastItem++;
      _listNumbers.add(_lastItem);
    }

    setState(() {
      
    });
  }

  Future fetchData() async{
    _isLoading = true;
    setState(() {
      
    });

    final duration = new Duration(seconds: 2);
    return new Timer(duration, responseHttp);
  }

  void responseHttp(){
    _isLoading = false;
    
    _scrollController.animateTo(
      _scrollController.position.pixels+100, 
      duration: new Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );

    _add10Images();
  }

  Widget _createLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );      
    }
    else{
      return Container();
    }
  }

}