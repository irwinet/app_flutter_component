import 'package:app_flutter_component/src/pages/animate_container.dart';
import 'package:app_flutter_component/src/pages/card_page.dart';
import 'package:app_flutter_component/src/pages/input_page.dart';
import 'package:app_flutter_component/src/pages/listview_page.dart';
import 'package:app_flutter_component/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:app_flutter_component/src/pages/alert_page.dart';
import 'package:app_flutter_component/src/pages/avatar_page.dart';
import 'package:app_flutter_component/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' : (BuildContext context)=> HomePage(),
    'alert' : (BuildContext context)=> AlertPage(),
    AvatarPage.pageName : (BuildContext context)=> AvatarPage(),
    'card' : (BuildContext context)=> CardPage(),
    'animateContainer' : (BuildContext context)=> AnimateContainerPage(),
    'inputs' : (BuildContext context)=> InputPage(),
    'slider' : (BuildContext context)=> SliderPage(),
    'list' : (BuildContext context)=> ListPage(),
  };
}