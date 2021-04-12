import 'package:flutter/material.dart';
import 'package:flutter_layout/flutter_layout.dart';

import 'package:flutter_layout/src/layout/a_test/grid.dart';
import 'package:flutter_layout/src/layout/a_test/wrap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Layout Example"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("fdfdf"),
            Layout.blank(
              layoutFormat: LayoutFormat.layout1x1,
              blank: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Layout.grid(
              layoutFormat: LayoutFormat.layout2x1,
              height: 200,
              grids: [
                WidgetGrid(
                  width: 100,
                  backgroundColor: Colors.blue,
                  child: Text("dfdsfdf" * 1000),
                ),
                WidgetGrid(
                  backgroundColor: Colors.yellow,
                  child: Text("dfdsfdf" * 1000),
                ),
              ],
            ),
            SizedBox(height: 20),
            Layout.flexible(
              layoutFormat: LayoutFormat.layout2x1,
              flexible: [
                WidgetFlexible(
                  backgroundColor: Colors.blue,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text("dfdsfdf" * 30),
                ),
                WidgetFlexible(
                  backgroundColor: Colors.yellow,
                  child: Text("dfdsfdf" * 100),
                ),
              ],
            ),

            // ---------------------------------------------
            SizedBox(height: 20),
            OwGrid(
              // padding: EdgeInsets.only(left: 20, right: 0),
              numbersInRowAccordingToWidgth: [500, 700, 900, 1100, 1300],
              flexColumns: [1, 2, 1, 1],
              widthColumns: [100, null, 50],
              
              rowHeight: 150,
              horizontalQuantity: 2,
              children: [
                Container(
                  // height: 10,
                  color: Colors.blue,
                  child: Text("1"),
                ),
                Container(
                  // height: 10,
                  // width: 500,
                  color: Colors.red,
                  child: Text("2"),
                ),
                Container(
                  // width: 100,
                  // height: 300,
                  color: Colors.blue,
                  child: Text("3"),
                ),
                Container(
                  // width: 100,
                  // height: 100,
                  color: Colors.red,
                  child: Text("4"),
                ),
                Container(
                  // width: 100,
                  // height: 100,
                  color: Colors.blue,
                  child: Text("5"),
                ),
              ],
            ),

            SizedBox(height: 50),
            OwWrap(
              // padding: EdgeInsets.only(left: 20, right: 0),
              numbersInRowAccordingToWidgth: [500, 700, 900, 1100, 1300],
              // flexColumns: [1, 2, 1, 1, 1],
              widthColumns: [100, null, 150],
              
              rowHeight: 150,
              horizontalQuantity: 2,
              children: [
                Container(
                  height: 10,
                  color: Colors.blue,
                  child: Text("1"),
                ),
                Container(
                  height: 10,
                  width: 500,
                  color: Colors.red,
                  child: Text("2"),
                ),
                Container(
                  width: 100,
                  height: 300,
                  color: Colors.blue,
                  child: Text("3"),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Text("4"),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Text("5"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

