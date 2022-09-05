import 'package:flutter/material.dart';
import 'package:web_login_flutter/routes.dart';
import 'package:web_login_flutter/shared/token_service.dart';

class LateralDrawer extends StatelessWidget {
  const LateralDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => _onHome(context),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => _onProfile(context),
          ),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('Responses'),
            onTap: () => _onResponse(context),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => _onLogout(context),
          ),
        ],
      ),
    );
  }
  void _onLogout(BuildContext context) {
    TokenService().destroy();
    Navigator.of(context).pushReplacementNamed(RouteGenerator.loginPage);
  }
  void _onProfile(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.profilePage);
  }
  void _onHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.homePage);
  }
  void _onResponse(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.responsesPage);
  }
}