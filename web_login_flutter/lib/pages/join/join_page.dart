import 'package:web_login_flutter/bloc/join_bloc.dart';
import 'package:web_login_flutter/pages/join/join_form.dart';
import 'package:web_login_flutter/routes.dart';
import 'package:web_login_flutter/shared/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("Registro"),
            //automaticallyImplyLeading: false
          ),
          body: BlocProvider(
            create: (BuildContext context) => JoinBloc(),
            child: const JoinPageContent(),
          ),
    );
  }
}

class JoinPageContent extends StatelessWidget {
  const JoinPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JoinBloc, JoinState>(
        builder: (context, state) {
          if(state is JoinInitial) {
            return JoinForm();
          }else if (state is JoinSuccess){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed(RouteGenerator.loginPage);
              Snackbar.showInfo(context, "Usario registardo correctamente");
            });
            return JoinForm();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Snackbar.showError(context, "Error en el registro");
            });
            return JoinForm();
          }
    });
  }
}

