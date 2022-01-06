import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'burc_liste.dart';
import 'package:palette_generator/palette_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListesi",

      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
    //    "/burcDetay/123": (context) => BurcDetay(),// yanliş kullanım index ise  ongeneratroute
      },

      onGenerateRoute: (RouteSettings settings)
      {
        List<String> pathElementleri= settings.name.split("/");
        if(pathElementleri[1]=='burcDetay'){
           return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElementleri[2])));
        }
        return null;
      },
      theme: ThemeData(primarySwatch: Colors.pink),
     // home: BurcListesi(),
    );
  }
}


















