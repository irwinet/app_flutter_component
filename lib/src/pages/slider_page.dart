import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valueSlider = 0.0;
  bool _disabledCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        )
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label:'Size image',
      //divisions: 20,
      onChanged: (_disabledCheck)?null: (value){
        //print(value);        
        setState(() {
          _valueSlider = value;
        });
      },
      value: _valueSlider,
      min:0.0,
      max: 400.0,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://w7.pngwing.com/pngs/190/364/png-transparent-minions-desktop-1080p-high-definition-video-animation-minions-heroes-computer-despicable-me.png'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox(){
    /*return Checkbox(
      value: _disabledCheck,
      onChanged: (value){        
        setState(() {
          _disabledCheck = value; 
        });
      },
    );*/

    return CheckboxListTile(
      value: _disabledCheck,
      title: Text('Disabled slider'),
      onChanged: (value){        
        setState(() {
          _disabledCheck = value; 
        });
      },
    );
  }

  Widget _createSwitch(){
    return SwitchListTile(
      value: _disabledCheck,
      title: Text('Disabled slider'),
      onChanged: (value){        
        setState(() {
          _disabledCheck = value; 
        });
      },
    );
  }
}