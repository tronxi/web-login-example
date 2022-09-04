import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/bloc/form_bloc.dart' as form_bloc;
import 'package:web_login_flutter/widgets/flow_form/flow_form.dart';
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
        // body: const HomePageContent()
        body: BlocProvider(
          create: (BuildContext context) => form_bloc.FormBloc(),
          child: const HomePageContent(),
        ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<form_bloc.FormBloc, form_bloc.FormState>(
        builder: (context, state) {
          if (state is form_bloc.FormInitial) {
            context.read<form_bloc.FormBloc>().add(form_bloc.FormRetrieve());
            return const Center(child: CircularProgressIndicator());
          } else if (state is form_bloc.FormRetrieved) {
            return FlowForm(form: state.form);
          } else {
            return const Text("error");
          }
        }
    );
  }
}

