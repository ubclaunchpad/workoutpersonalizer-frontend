import 'package:flutter/material.dart';

class SideLayout extends StatefulWidget {
  @override
  SideLayoutState createState() => new SideLayoutState();
}

class SideLayoutState extends State<SideLayout> {
  Map<String, bool> values = {
    'chest': false,
    'back': false,
    'arms': false,
    'shoulders': false,
    'legs': false,
    'calves': false,
    'abs': false,
    'neck': false,
    'hips': false,
    'tummy': false
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
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child:
                        const Icon(Icons.airline_seat_legroom_extra, size: 30),
                  ),
                  const Text(
                    " Muscle Groups",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: values.keys.map((String key) {
                    return CheckboxListTile(
                      title: Text(key),
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
