import 'package:flutter/material.dart';
import 'package:lession15_futurebuilder_app/models/photos.dart';

class NetworkPage extends StatelessWidget {

  final Photo photo;
  NetworkPage(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("FutureBuilder page"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Text('${photo.title}' '${photo.url}'),
      ),
    );
  }
}

