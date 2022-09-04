import 'package:flutter/material.dart';
import 'package:web_login_flutter/models/form/text_question.dart';
import 'package:web_login_flutter/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/bloc/flow_form_bloc.dart';

class TextQuestionForm extends StatefulWidget {
  final TextQuestion textQuestion;

  const TextQuestionForm({Key? key, required this.textQuestion})
      : super(key: key);

  @override
  State<TextQuestionForm> createState() => _TextQuestionFormState();
}

class _TextQuestionFormState extends State<TextQuestionForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDisabled = _isDisabled(_controller.value.text);
    return SizedBox(
      width: 350,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              width: 500,
              child: ListTile(
                title: Text(widget.textQuestion.title + _mandatoryString()),
                subtitle: widget.textQuestion.description != null
                    ? Text(widget.textQuestion.description!)
                    : null,
              ),
            ),
            SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _controller,
                  onChanged: (text) => {
                    setState(() {
                      isDisabled = _isDisabled(text);
                    })
                  },
                )),
            const SizedBox(height: 20),
            FormButton(
                text: "enviar",
                onPressed: () => _onPressedSend(context),
                isDisabled: isDisabled),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  String _mandatoryString() {
    if (widget.textQuestion.isMandatory) return " *";
    return "";
  }

  void _onPressedSend(BuildContext context) {
    context
        .read<FlowFormBloc>()
        .add(AnswerTextQuestion(response: _controller.value.text));
    _controller.clear();
  }

  bool _isDisabled(String text) {
    if (!widget.textQuestion.isMandatory) return false;
    return text.isEmpty;
  }
}
