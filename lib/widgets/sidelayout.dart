import 'package:flutter/material.dart';

class SideLayout extends StatelessWidget {
  const SideLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Color(0xff404040),
              child: MyStatefulWidget())
          // child: ListView(
          //   children: <Widget>[
          //     const SizedBox(height: 48),
          //     buildMenuItem(
          //       text: 'test',
          //       icon: Icons.people,
          //     ),
          //   ],
          // )),
          ),
    );
  }

  // Widget buildMenuItem({
  //   required String text,
  //   required IconData icon,
  // }) {
  //   final color = Colors.white;
  //   final hoverColor = Colors.white70;

  //   // return ListTile(
  //   //   leading: Icon(icon, color: color),
  //   //   title: Text(text, style: TextStyle(color: color)),
  //   //   hoverColor: hoverColor,
  //   //   onTap: () {},
  //   return LabeledCheckbox(
  //     title: Text(text),
  //     value: timeDilation != 1.0,
  //     onChanged: (bool? value) {
  //       setState(() {
  //         timeDilation = value! ? 10.0 : 1.0;
  //       });
  //     },
  //     secondary: const Icon(Icons.hourglass_empty),
  //   );
  // }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return LabeledCheckbox(
      label: 'This is the label text',
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}
