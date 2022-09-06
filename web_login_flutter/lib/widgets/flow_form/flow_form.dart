import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/bloc/flow_form_bloc.dart';
import 'package:web_login_flutter/models/form/bool_question.dart';
import 'package:web_login_flutter/models/form/form.dart';
import 'package:web_login_flutter/models/form/multiple_question.dart';
import 'package:web_login_flutter/models/form/question.dart';
import 'package:web_login_flutter/models/form/range_question.dart';
import 'package:web_login_flutter/models/form/section.dart';
import 'package:web_login_flutter/models/form/text_question.dart';
import 'package:web_login_flutter/shared/token_service.dart';
import 'package:web_login_flutter/widgets/flow_form/bool_question_form.dart';
import 'package:web_login_flutter/widgets/flow_form/multiple_question_form.dart';
import 'package:web_login_flutter/widgets/flow_form/range_question_form.dart';

import 'text_question_form.dart';

class FlowForm extends StatelessWidget {
  final FormModel form;
  const FlowForm({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FlowFormBloc(form: form),
      child: FlowFormContent(form: form),
    );
  }
}

class FlowFormContent extends StatelessWidget {
  final FormModel form;
  const FlowFormContent({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowFormBloc, FlowFormState>(builder: (context, state) {
      if (state is FlowFormInitial) {
        context.read<FlowFormBloc>().add(
            CreateAttempt(userId: TokenService().retrieveUserId()!, formId: 0));
        return FlowFormBody(
            form: form,
            actualQuestion: form.sections.first.question,
            actualSection: form.sections.first,
            responses: 0);
      } else if (state is FlowFormAnswered) {
        return FlowFormBody(
            form: state.formState.form,
            actualQuestion: state.formState.actualQuestion,
            actualSection: state.formState.actualSection,
            responses: state.formState.responses);
      } else if (state is WaitingForFinish) {
        context
            .read<FlowFormBloc>()
            .add(FinishAttempt(attemptId: state.attemptId));
        return const Center(child: CircularProgressIndicator());
      } else if (state is FlowFormFinished) {
        return const Center(
          child: Text("Formulario terminado"),
        );
      } else {
        return const Text("error");
      }
    });
  }
}

class FlowFormBody extends StatelessWidget {
  final FormModel form;
  final Section actualSection;
  final Question actualQuestion;
  final int responses;
  const FlowFormBody(
      {Key? key,
      required this.form,
      required this.actualSection,
      required this.actualQuestion,
      required this.responses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Card(
            child: Column(
          children: [
            SizedBox(
              width: 500,
              child: ListTile(
                title: Text(form.name),
                subtitle:
                    form.description != null ? Text(form.description!) : null,
                leading: responses != 0
                    ? IconButton(
                        icon: const Icon(Icons.backspace),
                        onPressed: () => _onPressedBackButton(context),
                      )
                    : null,
              ),
            ),
            Card(
              child: Column(
                children: [
                  SizedBox(
                    width: 475,
                    child: ListTile(
                      title: Text(
                          "${actualSection.name} ${form.sectionPosition(actualSection) + 1}/${form.totalSections}"),
                      subtitle: actualSection.description != null
                          ? Text(actualSection.description!)
                          : null,
                    ),
                  ),
                  if (actualQuestion is TextQuestion)
                    TextQuestionForm(
                        textQuestion: actualQuestion as TextQuestion),
                  if (actualQuestion is BoolQuestion)
                    BoolQuestionForm(
                        boolQuestion: actualQuestion as BoolQuestion),
                  if (actualQuestion is MultipleQuestion)
                    MultipleQuestionForm(
                        multipleQuestion: actualQuestion as MultipleQuestion),
                  if (actualQuestion is RangeQuestion)
                    RangeQuestionForm(
                        rangeQuestion: actualQuestion as RangeQuestion)
                ],
              ),
            )
          ],
        )),
      ]),
    );
  }

  void _onPressedBackButton(BuildContext context) {
    context.read<FlowFormBloc>().add(FlowFormPrevious());
  }
}
