import 'package:flutter/material.dart';
import 'package:web_login_flutter/pages/login/login_page.dart';
import 'package:web_login_flutter/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "environments/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Web Login Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.lightBlue
        ),
        darkTheme: ThemeData(
            primarySwatch: Colors.lightBlue,
            brightness: Brightness.dark
        ),
        themeMode: ThemeMode.light,
        home: const LoginPage(),
        initialRoute: RouteGenerator.loginPage,
        onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
