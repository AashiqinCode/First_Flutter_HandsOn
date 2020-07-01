import 'package:first_app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

// Statefull widget will not loose the content in the form field on hot reload
class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/bg.jpg",
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.7),
              colorBlendMode: BlendMode.darken),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2, 180.0, 2, 0),
              child: Form(
                key: formkey,
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        // Center will not work as we are usign singlechildScrollview
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _userNameController,
                            validator: (s) {},
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter Email ID",
                                labelText: "Username"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (s) {},
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            onPressed: () {
                              //  formkey.currentState.validate();

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Homepage()));
                              
                              Constants.prefs.setBool("LoggedIn", true);

                              // Better way to define routes
                              // Navigator.pushNamed(context, Homepage.routeName);

                              // This makes the route to come to the loginpage on pressing back button
                              Navigator.pushReplacementNamed(
                                  context, Homepage.routeName);
                            },
                            child: Text(
                              "Sign In",
                            ),
                            color: Colors.blue[100],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
