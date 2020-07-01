import 'package:first_app/pages/home_page_with_fb.dart';
import 'package:flutter/material.dart';

import 'package:first_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login_page.dart';
import 'utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

// We have enclosed in stle to prevent hot reloading
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove debugsymbol
      debugShowCheckedModeBanner: false,

      // For persistence
      home: Constants.prefs.getBool("LoggedIn") == true
          ? HomepageFb()
          : LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        Homepage.routeName: (context) => Homepage(),
        HomepageFb.routeName: (context) => HomepageFb()
      },
    );
  }
}

// Stateless widget=>created using a shortcut => stle
