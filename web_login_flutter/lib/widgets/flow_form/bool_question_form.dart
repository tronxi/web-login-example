import 'package:flutter/material.dart';
import 'package:web_login_flutter/models/form/bool_question.dart';
import 'package:web_login_flutter/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/bloc/flow_form_bloc.dart';

class BoolQuestionForm extends StatefulWidget {
  final BoolQuestion boolQuestion;

  const BoolQuestionForm({Key? key, required this.boolQuestion})
      : super(key: key);

  @override
  State<BoolQuestionForm> createState() => _BoolQuestionFormState();
}

class _BoolQuestionFormState extends State<BoolQuestionForm> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              width: 500,
              child: ListTile(
                title: Text(widget.boolQuestion.title + _mandatoryString()),
                subtitle: widget.boolQuestion.description != null
                    ? Text(widget.boolQuestion.description!)
                    : null,
              ),
            ),
            Checkbox(
              value: value,
              onChanged: (bool? value) {
                setState(() {
                  this.value = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            FormButton(
                text: "enviar",
                onPressed: () => _onPressedSend(context),
                isDisabled: false),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  String _mandatoryString() {
    if (widget.boolQuestion.isMandatory) return " *";
    return "";
  }

  void _onPressedSend(BuildContext context) {
    context
        .read<FlowFormBloc>()
        .add(AnswerBoolQuestion(response: value));
    value = false;
  }
}
