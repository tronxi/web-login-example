import 'package:web_login_flutter/routes.dart';
import 'package:web_login_flutter/shared/token_service.dart';
import 'package:flutter/material.dart';

class LogoutAppBar  {
  final BuildContext _context;
  final String _title;
  LogoutAppBar({required context, required title}) : _context = context, _title = title;
  AppBar build() {
    return AppBar(
        title: Text(_title),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: _onLogout,
                child: const Icon(Icons.logout, size: 26.0),
              )
          )
        ]
    );
  }

  void _onLogout() {
    TokenService().destroy();
    Navigator.of(_context).pushReplacementNamed(RouteGenerator.loginPage);
  }
}
