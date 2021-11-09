import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  final List<String> exerciseList;

  const Gallery({Key? key, required this.exerciseList}) : super(key: key);

  @override
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  void buttonAction(value) {
    print("this is value " + value);
  }

  Widget buildGrid(BuildContext context, exerciseList) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 13 / 16,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: widget.exerciseList.length,
        itemBuilder: (context, index) {
          return Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                    title: Text(widget.exerciseList[index]),
                    subtitle: Text('muscle group',
                        style:
                            TextStyle(color: Colors.black.withOpacity(0.6)))),
                // Image.asset('images/pushup.jpg', fit: BoxFit.fitWidth),
                Stack(alignment: Alignment.bottomLeft, children: <Widget>[
                  Image.asset('images/pushup.jpg', fit: BoxFit.fitWidth),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopupMenuButton(
                        onSelected: (value) {
                          buttonAction(value);
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text("First"),
                            value: "first",
                          ),
                          const PopupMenuItem(
                            child: Text("Second"),
                            value: "second",
                          )
                        ],
                        // onPressed: () => print("hello"),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0), //or 15.0
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.black,
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 25.0),
                          ),
                        ),
                      ))
                ]),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'other tags',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ))),
                // ButtonBar(
                //   alignment: MainAxisAlignment.start,
                //   children: [
                //     TextButton(
                //         style: TextButton.styleFrom(
                //           primary: Colors.red,
                //         ),
                //         onPressed: () {},
                //         child: const Text('See more'))
                //   ],
                // )
              ],
            ),
          );
        });

    //   itemCount: _exerciseList.length,
    //   itemBuilder: (context, index) {
    //     return Card(
    //       // child: Text(_exerciseList[index])
    //       child: Column(
    //         children: <Widget>[
    //           ListTile(
    //               leading: Icon(Icons.add),
    //               title: Text(_exerciseList[index]),
    //               subtitle: Text('some muscle group',
    //                   style: TextStyle(color: Colors.black.withOpacity(0.6)))),
    //           Padding(
    //             padding: const EdgeInsets.all(16),
    //             child: Text(
    //               'some description blah blah blah',
    //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
    //             ),
    //           ),
    //           ButtonBar(
    //             alignment: MainAxisAlignment.start,
    //             children: [
    //               TextButton(
    //                   style: TextButton.styleFrom(
    //                     primary: Colors.red,
    //                   ),
    //                   onPressed: () {},
    //                   child: const Text('See more'))
    //             ],
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  Widget build(BuildContext context) {
    return Scaffold(body: buildGrid(context, widget.exerciseList));
  }
}
