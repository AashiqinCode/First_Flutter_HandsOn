import 'package:flutter/material.dart';

// stle=> Stateless Widget
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
