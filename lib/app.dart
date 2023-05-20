import 'package:flutter/material.dart';
import 'formfield.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  double ageval = 43.00;
  double heightval = 171;
  double weightval = 60;
  String genderval = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Find your BMI',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: FormBox(
        agedata: ageval,
        heightdata: heightval,
        weightdata: weightval,
        genderdata: genderval,
      ),
    );
  }
}
