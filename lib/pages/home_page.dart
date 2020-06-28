import 'package:flutter/material.dart';

import '../drawer.dart';
import '../name_card_widget.dart';

class Homepage extends StatefulWidget {


  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var url = "http://jsonplaceholder.typicode.com/photos";

  var myText = "Change my name";
  TextEditingController _nameController = TextEditingController();

  // Used to initialize something before starting of the screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.blue,
    //   child: Text("Hi Flutter App"),
    // );

    //Scaffold has prebuild some widget themes
     return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("My App"),
      ),

      // Container is similiar to <Div>
      body: Center(
        // use child: Row for changes
        // child: Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.teal,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          // Scrollable view
          child: SingleChildScrollView(
            //  First I pressed the bulb icon and choosed extract by widget option
            child:
                NameCardWidget(myText: myText, nameController: _nameController),
          ),
        ),
      ),
      drawer: MyDrawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;

          setState(() {});

          // Clears the text field after button press
          _nameController.clear();
        },
        child: Icon(Icons.send),
        hoverColor: Colors.black,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
