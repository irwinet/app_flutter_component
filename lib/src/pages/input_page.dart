import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _name = '';
  String _email = '';
  String _date = '';
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _powers = ['Fly','Ray X','Super Breath','Super Strength'];
  String _optionSelected = 'Fly';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_name.length}'),
        hintText: 'Name',
        labelText: 'Name',
        helperText: 'Only name',
        suffixIcon: Icon(Icons.accessibility),
        icon : Icon(Icons.account_circle)
      ),
      onChanged: (value){
        
        //print(_name);
        setState(() {
          _name = value;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropdown(){
    List<DropdownMenuItem<String>> list = new List();
    _powers.forEach((element) {
      list.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return list;
  }

  Widget _createDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: _optionSelected,
            items: getOptionsDropdown(),
            onChanged: (opt){
              //print(opt);
              setState(() {
                _optionSelected = opt;
              });
            },
          ),
        )
      ],
    );      
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name is: $_name'),
      subtitle: Text('Email is: $_email'),
      trailing: Text(_optionSelected),
    );
  }

  Widget _createEmail(){
    return TextField(
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Letras ${_name.length}'),
        hintText: 'Email',
        labelText: 'Email',
        //helperText: 'Only email',
        suffixIcon: Icon(Icons.alternate_email),
        icon : Icon(Icons.email)
      ),
      onChanged: (value){
        
        //print(_name);
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword(){
    return TextField(
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Letras ${_name.length}'),
        hintText: 'Password',
        labelText: 'Password',
        //helperText: 'Only email',
        suffixIcon: Icon(Icons.lock_open),
        icon : Icon(Icons.lock)
      ),
      onChanged: (value){
        
        //print(_name);
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createDate(BuildContext context){
    return TextField(
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      //obscureText: true,
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        //counter: Text('Letras ${_name.length}'),
        hintText: 'Date',
        labelText: 'Date',
        //helperText: 'Only email',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon : Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
    );

    if(picked!=null){
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }


}