import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:web_login_flutter/models/form/range_question.dart';
import 'package:web_login_flutter/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/bloc/flow_form_bloc.dart';

class RangeQuestionForm extends StatefulWidget {
  final RangeQuestion rangeQuestion;
  const RangeQuestionForm({Key? key, required this.rangeQuestion})
      : super(key: key);

  @override
  State<RangeQuestionForm> createState() => _RangeQuestionFormState();
}

class _RangeQuestionFormState extends State<RangeQuestionForm> {
  late double value;
  @override
  void initState() {
    super.initState();
    value = widget.rangeQuestion.initValue;
  }
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
                title: Text(widget.rangeQuestion.title),
                subtitle: widget.rangeQuestion.description != null
                    ? Text(widget.rangeQuestion.description!)
                    : null,
              ),
            ),
            SleekCircularSlider(
                min: widget.rangeQuestion.startValue,
                max: widget.rangeQuestion.endValue,
                initialValue: widget.rangeQuestion.initValue,
                // min: 0,
                // max: 10,
                // initialValue: 0,
                appearance: CircularSliderAppearance(
                    counterClockwise: true,
                    angleRange: 260,
                    startAngle: 200,
                    customColors: CustomSliderColors(
                      trackColor: Colors.grey,
                      progressBarColor: Colors.blue,
                      shadowStep: 10,
                    ),
                    infoProperties: InfoProperties(
                      modifier: (percentage) => percentage.toInt().toString(),
                    )),
                onChange: (value) => _onChange(value),),
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
  void _onChange(double val) {
    value = val.roundToDouble();
  }

  void _onPressedSend(BuildContext context) {
    context
        .read<FlowFormBloc>()
        .add(AnswerRangeQuestion(response: value));
    value = widget.rangeQuestion.initValue;
  }
}
