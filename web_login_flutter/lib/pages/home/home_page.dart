import 'package:flutter/material.dart';
import 'package:web_login_flutter/widgets/lateral_drawer.dart';
import 'package:web_login_flutter/widgets/logout_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const LateralDrawer(),
        appBar: LogoutAppBar(
            context: context,
            title: "Home"
        ).build(),
        body: const HomePageContent()
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Contenido de la home'),
            subtitle: Text(
              'texto',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Home de prueba sin ninguna funcionalidad',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}

