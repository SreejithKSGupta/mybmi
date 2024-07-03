import 'package:flutter/material.dart';
import 'resultbox.dart';

// ignore: must_be_immutable
class FormBox extends StatefulWidget {
  double agedata;
  double heightdata;
  double weightdata;
  String genderdata;
  FormBox({
    super.key,
    required this.agedata,
    required this.heightdata,
    required this.weightdata,
    required this.genderdata,
  });

  @override
  State<FormBox> createState() => _FormBoxState();
}

class _FormBoxState extends State<FormBox> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            makeslider('Height', 20.0, 250.00),
            makeslider('Weight', 2.0, 200.00),
            ResultBox(
              agedata: widget.agedata,
              heightdata: widget.heightdata,
              weightdata: widget.weightdata,
              genderdata: widget.genderdata,
            ),
            cautioncontainer(),
          ]),
    ));
  }

  Container makeslider(name, min, max) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.13,
            child: Text(
              name,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Slider(
              activeColor: Theme.of(context).colorScheme.onSurface,
              secondaryActiveColor: Theme.of(context).colorScheme.onPrimary,
              inactiveColor: Theme.of(context).colorScheme.onPrimary,
              thumbColor: Theme.of(context).colorScheme.surface,
              onChanged: (value) {
                setState(() {
                  if (name == 'Age') {
                    widget.agedata = value;
                  } else if (name == 'Height') {
                    widget.heightdata = value;
                  } else if (name == 'Weight') {
                    widget.weightdata = value;
                  }
                });
              },
              min: min,
              max: max,
              label: getvar(name).toString(),
              value: getvar(name),
            ),
          ),
          Text(
            getvar(name).roundToDouble().toString(),
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  double getvar(name) {
    if (name == 'Age') {
      return widget.agedata;
    } else if (name == 'Height') {
      return widget.heightdata;
    } else if (name == 'Weight') {
      return widget.weightdata;
    } else {
      return 0.0;
    }
  }

  Container cautioncontainer() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Text(
            ' Children under 14 and adults over 65 won\'t get accurate results.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            ),
          ),
          Text(
            'The results are just for reference.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
