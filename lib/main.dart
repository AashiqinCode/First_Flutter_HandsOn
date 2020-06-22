import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

// Stateless widget=>created using a shortcut-stle
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.blue,
    //   child: Text("Hi Flutter App"),
    // );

    //Scaffold has prebuild some widget themes
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),

      // Container is similiar to <Div>
      body: Container(
        height: 500,
        color: Colors.teal,
        // use child: Row for changes
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(9),
              width: 100,
              height: 100,
              color: Colors.red,
              alignment: Alignment.center,
            ),
            Container(
              padding: const EdgeInsets.all(9),
              width: 100,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
            ),
            Container(
              padding: const EdgeInsets.all(9),
              width: 100,
              height: 100,
              color: Colors.red,
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
