import 'package:flutter/material.dart';

import 'load_some_data.dart';

class PostMethodPage extends StatefulWidget {
  const PostMethodPage({super.key});

  @override
  State<PostMethodPage> createState() => PposMmethoPpageState();
}

class PposMmethoPpageState extends State<PostMethodPage> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum =
        fetchAlbum(); // load the data if lo pones en el buidl lo estara haciendocada vez que
    //se redibuje el widget.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example material',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
