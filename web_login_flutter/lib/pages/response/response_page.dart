import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/models/form/finished/finished_form.dart';
import 'package:web_login_flutter/shared/token_service.dart';
import 'package:web_login_flutter/widgets/lateral_drawer.dart';
import 'package:web_login_flutter/widgets/logout_app_bar.dart';

import '../../bloc/finished_form_bloc.dart';

class ResponsePage extends StatelessWidget {
  const ResponsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LateralDrawer(),
      appBar: LogoutAppBar(context: context, title: "Home").build(),
      // body: const HomePageContent()
      body: BlocProvider(
        create: (BuildContext context) => FinishedFormBloc(),
        child: const ResponsePageContent(),
      ),
    );
  }
}

class ResponsePageContent extends StatelessWidget {
  const ResponsePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishedFormBloc, FinishedFormState>(
        builder: (context, state) {
      if (state is FinishedFormInitial) {
        context.read<FinishedFormBloc>().add(
            FinishedFormRetrieve(userId: TokenService().retrieveUserId()!));
        return const Center(child: CircularProgressIndicator());
      }
      if (state is FinishedFormRetrieved) {
        return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.finishedForm.length,
            itemBuilder: (BuildContext context, int index) {
              return FinishedFormWidget(
                  finishedForm: state.finishedForm[index]);
            });
      } else {
        return const Text("error");
      }
    });
  }
}

class FinishedFormWidget extends StatelessWidget {
  final FinishedForm finishedForm;
  const FinishedFormWidget({Key? key, required this.finishedForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListTile> responses = finishedForm.finishedAttempt.responses
            .map((e) => ListTile(title: Text(e.title),subtitle: Text(e.response)))
            .toList();
    print(finishedForm.finishedAttempt.responses.length);
    return Card(
      child: Column(
        children: [
          ListTile(
              title: Text(finishedForm.formName),
              subtitle: Text(finishedForm.formDescription)),
          Card(
            child: Column(
              children: responses,
            ),
          )
        ],
      ),
    );
  }
}
