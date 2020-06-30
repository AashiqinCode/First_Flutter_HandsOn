import 'package:flutter/material.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var url = "http://jsonplaceholder.typicode.com/photos";
  var data;
  // Used to initialize something before starting of the screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  fetchdata() async {
    var res = await http.get(url);
    // print(res.body);

    // json parsing
    data = jsonDecode(res.body);
    print(data);

    //To tell the UI that we got the data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold has prebuild some widget themes
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("My App"),
      ),

      // Container is similiar to <Div>
      body: data != null
          // ? Container(
          //     color: Colors.white,
          // )
          ?
          // GridView.builder(
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

          ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]["title"]),
                  subtitle: Text("ID :${data[index]["id"]}"),
                  leading: Image.network(data[index]["url"]),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),

      drawer: MyDrawer(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        hoverColor: Colors.black,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
