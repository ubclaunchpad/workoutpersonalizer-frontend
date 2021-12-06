import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class SideLayout extends StatefulWidget {
  @override
  SideLayoutState createState() => new SideLayoutState();
}

class SideLayoutState extends State<SideLayout> {
  Map<String, bool> values = {
    'Chest': false,
    'Back': false,
    'Arms': false,
    'Shoulders': false,
    'Legs': false,
    'Calves': false,
    'Abs': false,
    'Neck': false,
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: Color(0x00000000),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFFCD78),
                    child: Icon(Icons.airline_seat_legroom_extra,
                        size: 30, color: Colors.black),
                  ),
                  Text(
                    " Muscle Groups",
                    style: filterHeaderStyle,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  controller: ScrollController(),
                  children: values.keys.map((String key) {
                    return CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(key, style: filterItemStyle),
                      value: values[key],
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            values[key] = value;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          )),
    );
  }
}
