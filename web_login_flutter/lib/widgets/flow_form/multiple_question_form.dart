import 'package:flutter/material.dart';
import 'package:web_login_flutter/models/form/choice.dart';
import 'package:web_login_flutter/models/form/multiple_question.dart';
import 'package:web_login_flutter/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/bloc/flow_form_bloc.dart';

class MultipleQuestionForm extends StatefulWidget {
  final MultipleQuestion multipleQuestion;

  const MultipleQuestionForm({Key? key, required this.multipleQuestion})
      : super(key: key);

  @override
  State<MultipleQuestionForm> createState() => _MultipleQuestionFormState();
}

class _MultipleQuestionFormState extends State<MultipleQuestionForm> {
  late List<Choice> selectedChoices;
  @override
  Widget build(BuildContext context) {
    List<Widget> choicesWidgets = widget.multipleQuestion.choices
        .map((choice) => ChoiceForm(choice: choice, onPressed: () => _onPressed(choice), selected: _isChoiceSelected(choice),))
        .toList();
    return SizedBox(
      width: 350,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              width: 500,
              child: ListTile(
                title: Text(widget.multipleQuestion.title + _mandatoryString()),
                subtitle: widget.multipleQuestion.description != null
                    ? Text(widget.multipleQuestion.description!)
                    : null,
              ),
            ),
            for (Widget widget in choicesWidgets) widget,
            const SizedBox(height: 20),
            FormButton(
                text: "enviar",
                onPressed: () => _onPressedSend(context),
                isDisabled: _isDisabled()),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    selectedChoices = [];
  }
  void _onPressed(Choice choice) {
    setState(() {
      if(widget.multipleQuestion.allowMultiple!) {
        if(_isChoiceSelected(choice)) {
          selectedChoices.remove(choice);
        }else {
          selectedChoices.add(choice);
        }
      }else {
        if(selectedChoices.contains(choice)){
          selectedChoices.remove(choice);
        }else {
          selectedChoices.clear();
          selectedChoices.add(choice);
        }
      }
    });
  }
  bool _isChoiceSelected(Choice choice) {
    return selectedChoices.contains(choice);
  }
  String _mandatoryString() {
    String mandatory = "";
    if (widget.multipleQuestion.isMandatory) mandatory += " *";
    if (widget.multipleQuestion.allowMultiple!) mandatory += " (puedes elegir más de una)";
    if (!widget.multipleQuestion.allowMultiple!) mandatory += " (solo puedes elegir una)";
    return mandatory;
  }

  void _onPressedSend(BuildContext context) {
    context.read<FlowFormBloc>().add(AnswerMultipleQuestion(
        response: selectedChoices));
    selectedChoices = [];
  }
  bool _isDisabled() {
    if (!widget.multipleQuestion.isMandatory) return false;
    return selectedChoices.isEmpty;
  }
}

class ChoiceForm extends StatelessWidget {
  final Choice choice;
  final void Function() onPressed;
  final bool selected;
  const ChoiceForm({Key? key, required this.choice, required this.onPressed, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: selected ? Colors.cyan : Colors.white,
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Text(choice.name),
        ),
      ),
    );
  }
}
