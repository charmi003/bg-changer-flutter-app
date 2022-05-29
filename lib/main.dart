import 'package:flutter/material.dart';
import 'dart:math';

main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'BG Changer',
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(),
      home:Scaffold(
        appBar: AppBar(
          title:const Text('Random Background')
        ),
        body:HomePage()
      )

    );
  }
}


class HomePage extends StatefulWidget
{
  @override 
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>
{
  var colors=[
    Colors.amber,
    Colors.black,
    Colors.black87,
    Colors.blue,
    Colors.blueAccent,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.indigo,
    Colors.pink,
    Colors.teal,
    Colors.lime
  ];

  var currentColor=Colors.white;
  var btnColor=Colors.black54;

  void setRandomColor(){
    var rnd=Random().nextInt(colors.length-1);  //0 to max 13
    setState(() {
      // currentColor=colors[rnd];
      currentColor=Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      btnColor=Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override 
  Widget build(BuildContext context)
  {
    return Container(
      color: currentColor,
      child:Center(
        child:ElevatedButton(
          onPressed: setRandomColor, 
          child: const Text('Change It!', style: TextStyle(fontSize: 20)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnColor),
            padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 15, 30, 15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.white)
              )
            )
          ),
        )
      )
    );
  }

}

