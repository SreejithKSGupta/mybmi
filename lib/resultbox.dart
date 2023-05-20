import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultBox extends StatefulWidget {
  double agedata;
  double heightdata;
  double weightdata;
  String genderdata;
  ResultBox(
      {super.key,
      required this.agedata,
      required this.heightdata,
      required this.weightdata,
      required this.genderdata});

  @override
  State<ResultBox> createState() => _ResultBoxState();
  // pass bmivalue to the state widget
}

class _ResultBoxState extends State<ResultBox> {
  double bmival = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Text('Your BMI is: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                )),
            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Text(
              getBMI(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayLarge!.fontSize,
                  color: getBMIcol(),
                  textBaseline: TextBaseline.alphabetic),
            ),
            Text(
              getBMItext()[0],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayLarge!.fontSize,
                  color: getBMItext()[1],
                  textBaseline: TextBaseline.alphabetic),
            ),
          ],
        ),
      ),
    );
  }

  String getBMI() {
    double bmi = 0;
    bmi = (widget.weightdata / (widget.heightdata * widget.heightdata)) * 10000;
    setState(() {
      bmival = bmi;
    });
    return bmi.toStringAsFixed(1);
  }

  List getBMItext() {
    if (bmival < 18.5) {
      return ['Underweight', const Color.fromARGB(255, 158, 143, 9)];
    } else if (bmival < 25) {
      return ['Normal', Colors.green];
    } else if (bmival < 30) {
      return ['Overweight', const Color.fromARGB(255, 148, 134, 7)];
    } else {
      return ['Obese', Colors.red];
    }
  }

  Color getBMIcol() {
    if (bmival < 10 || bmival > 50) {
      return Colors.red;
    } else if (bmival < 20) {
      final double t = (bmival - 10) / (22);
      return Color.lerp(Colors.red, const Color.fromARGB(255, 0, 255, 8), t)!;
    } else {
      final double t = (bmival - 10) / (50 - 22);
      return Color.lerp(const Color.fromARGB(255, 0, 255, 8), Colors.red, t)!;
    }
  }
}
