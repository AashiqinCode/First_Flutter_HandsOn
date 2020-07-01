// sb -> Stream builder,mainly used for Backend(firebase) which returns stream of data

import 'package:first_app/pages/login_page.dart';
import 'package:first_app/utils/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomepageSb extends StatelessWidget {
  static const String routeName = "/homeFB";
  Future fetchdata() async {
    final url = "http://jsonplaceholder.typicode.com/photos";

    var res = await http.get(url);
    // print(res.body);

    // json parsing
    var data = jsonDecode(res.body);
    // print(data);

    //To tell the UI that we got the data
    // setState(() {});

    return data;
  }

  Stream<List<String>> getStream() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "Item $index")]);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold has prebuild some widget themes
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("My App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool("LoggedIn", false);

                // Navigator.pop(context);

                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              })
        ],
      ),

      // Container is similiar to <Div>

      // Future builder is used to handle async data on demand
      body: StreamBuilder(
          stream: getStream(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("Fetch Something"),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Has error"),
                  );
                }
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data[index]),
                        subtitle: Text("ID :${snapshot.data[index]["id"]}"),
                        leading: Image.network(snapshot.data[index]["url"]),
                      );
                    },
                    itemCount: snapshot.data.length);
            }
          }),
      drawer: MyDrawer(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        hoverColor: Colors.black,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
