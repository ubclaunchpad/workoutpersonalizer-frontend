import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  final List<String> _exerciseList = [
    'exercise1',
    'exercise2',
    'exercise3',
    'exercise4',
    'exercise5',
    'exercise6',
    'exercise7'
  ];

  // var num = _exerciseList.length;

  Widget buildGrid(BuildContext context) {
    // return GridView.builder(
    //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //         maxCrossAxisExtent: 200,
    //         childAspectRatio: 3 / 2,
    //         crossAxisSpacing: 20,
    //         mainAxisSpacing: 20),
    //     itemCount: _exerciseList.length,
    //     itemBuilder: (BuildContext ctx, index) {
    //       return Container(
    //         alignment: Alignment.center,
    //         child: Text(_exerciseList[index]),
    //         decoration: BoxDecoration(
    //             color: Colors.amber, borderRadius: BorderRadius.circular(15)),
    //       );
    //     });

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: _exerciseList.length,
        itemBuilder: (context, index) {
          return Card(
            // child: Text(_exerciseList[index])
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.add),
                    title: Text(_exerciseList[index]),
                    subtitle: Text('muscle group',
                        style:
                            TextStyle(color: Colors.black.withOpacity(0.6)))),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'description',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
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
    return Scaffold(body: buildGrid(context));
  }
}
