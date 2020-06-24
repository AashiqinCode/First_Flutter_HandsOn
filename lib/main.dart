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
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/bg.jpg",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      myText,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 08,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Name:",
                            labelText: "Name"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        // key: ,

        child: ListView(

            // Padding is becoz the listview has some padding at the top by default
            padding: const EdgeInsets.all(0),
            // Listview,rows,columns must have children
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Aashiq Ahmed"),
                accountEmail: Text("aashiqahmed10101@gmail.com"),
                // currentAccountPicture: Image.network(
                //     "https://images.unsplash.com/photo-1488052001737-d4decfe00039?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80"),

                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1488052001737-d4decfe00039?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Aashiq ahmed"),
                subtitle: Text("Developer"),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text("aashiqahmed10101@gmail.com"),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone"),
                subtitle: Text("8838098146"),
                trailing: Icon(Icons.edit),
              ),
            ]),
      ),
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
