import 'package:flutter/material.dart';

class PlaylistGallery extends StatelessWidget {
  const PlaylistGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Playlist gallery'),
        ),
        body: const Gallery()
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Text('Go back!'),
        //   ),
        // ),
        );
  }
}

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

  Widget _buildList() {
    return ListView.builder(
      itemCount: _exerciseList.length,
      itemBuilder: (context, index) {
        return Card(
          // child: Text(_exerciseList[index])
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.add),
                  title: Text(_exerciseList[index]),
                  subtitle: Text('some muscle group',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)))),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'some description blah blah blah',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {},
                      child: const Text('See more'))
                ],
              )
            ],
          ),
        );
      },
    );
    // return ListView(
    //     padding: const EdgeInsets.all(18),
    //     children: List.generate(_exerciseList.length, (index) {
    //       return Container(
    //           margin: const EdgeInsets.all(10),
    //           height: 50,
    //           width: 70,
    //           color: Colors.amber[600],
    //           child: Center(child: Text(_exerciseList[index])));

    // children: <Widget>[

    //   Container(
    //     height: 50,
    //     color: Colors.amber[600],
    //     child: Center(child: Text(_exerciseList[0])),
    //   ),
    //   Container(
    //     height: 50,
    //     color: Colors.amber[500],
    //     child: Center(child: Text(_exerciseList[1])),
    //   ),
    //   Container(
    //     height: 50,
    //     color: Colors.amber[100],
    //     child: Center(child: Text(_exerciseList[2])),
    // }));
  }

  Widget build(BuildContext context) {
    return Scaffold(body: _buildList());
  }
}
