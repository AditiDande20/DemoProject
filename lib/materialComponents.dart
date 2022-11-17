import 'package:flutter/material.dart';


class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

enum RadioList { flutter,kotlin,java }

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  RadioList? _language = RadioList.flutter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('flutter'),
          leading: Radio<RadioList>(
            value: RadioList.flutter,
            groupValue: _language,
            onChanged: (RadioList? value) {
              setState(() {
                _language = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('kotlin'),
          leading: Radio<RadioList>(
            value: RadioList.kotlin,
            groupValue: _language,
            onChanged: (RadioList? value) {
              setState(() {
                _language = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('java'),
          leading: Radio<RadioList>(
            value: RadioList.java,
            groupValue: _language,
            onChanged: (RadioList? value) {
              setState(() {
                _language = value;
              });
            },
          ),
        )
      ],
    );
  }
}


class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: flag,
      activeColor: Colors.blue,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          flag = value;
        });
      },
    );
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 6,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

List<String> dropDownList = <String>['Flutter','Kotlin','Java'];

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

  String dropdownValue = dropDownList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_circle_down),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: dropDownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}




