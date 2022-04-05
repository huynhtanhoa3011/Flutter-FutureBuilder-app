import 'package:flutter/material.dart';
import 'package:lession15_futurebuilder_app/network_page/network_detail_page.dart';
import 'package:lession15_futurebuilder_app/network_request/network_request_api.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("FutureBuilder"),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      snapshot.data[index].url
                    ),
                  ),
                  title: Text(snapshot.data[index].title),
                  subtitle: Text(snapshot.data[index].url),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => NetworkPage(snapshot.data[index])));
                  },
                );
              });
            } else if (snapshot.hasError) {
              return Container(
                child: Center(child: Text("Not Found data")),
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator()
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
