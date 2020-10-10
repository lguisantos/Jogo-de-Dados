import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> diceFace = [
    'assets/images/d1.jpg',
    'assets/images/d2.jpg',
    'assets/images/d3.jpg',
    'assets/images/d4.jpg',
    'assets/images/d5.jpg',
    'assets/images/d6.jpg',
    'assets/images/impacta.png'
  ];

  String image = '';
  double _width = 0;
  double _heigth = 0;

  _updateState() {
    setState(() {
      _width = 300;
      _heigth = 300;
    });
  }

  _updateStateMinus() {
    setState(() {
      _width = 0;
      _heigth = 0;
    });
  }

  void _getImage() {
    _updateStateMinus();
    image = diceFace[Random().nextInt(diceFace.length)];
    Timer(const Duration(seconds: 3), _updateState());
  }

  _callImage() {
    if (image.isEmpty) {
      setState(() {
        _width = 300;
        _heigth = 300;
      });
      return Image.asset('assets/images/impacta.png');
    } else {
      return Image.asset(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    double heigthScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Victor Bingos",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          children: [
            Container(
              height: heigthScreen * 0.02,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(25.0),
                  bottomRight: const Radius.circular(25.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: widthScreen * 0.2),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 900),
                curve: Curves.bounceOut,
                width: _width,
                height: _heigth,
                child: _callImage(),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: widthScreen * 0.05),
              child: SizedBox(
                width: 250,
                height: 50,
                child: RaisedButton(
                  onPressed: _getImage,
                  color: Colors.pink,
                  child: Text(
                    "Role o Seu Dado",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
