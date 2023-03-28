import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheNetworkImagePage extends StatelessWidget {
  static const route = "cacheNetworkImage";
  const CacheNetworkImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cache Network Image working "),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => CachedNetworkImage(
          key: UniqueKey(),
          imageUrl:
              'https://serpapi.com/playground?q=Apple&tbm=isch&ijn=$index',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.black,
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.black12,
            child: const Icon(
              Icons.error,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(15.0),

      //   child: Center(

      //     child: Column(
      //       children: <Widget>[
      //         //With this plugn you can handle large image too, this plugin has the qay to work with this.
      //         CachedNetworkImage(
      //           // In this Url comes the picture to show
      //           imageUrl:
      //               "http://mvs.bslmeiyu.com/storage/profile/2022-05-02-626fc39bf18a6.png",
      //           imageBuilder: (context, imageProvider) => Container(
      //             width: 200,
      //             height: 400,
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //                 image:
      //                     imageProvider, // this image provder comes from image builder as a parameter,
      //                 fit: BoxFit.fitWidth,
      //               ),
      //             ),
      //           ),
      //           // this place holder is the info que se mostrara cuando se este cargando la foto, un loading puede ser
      //           placeholder: (context, url) =>
      //               const CircularProgressIndicator(),
      //           // Container(
      //           //   alignment: Alignment.center,
      //           //   child: Image.asset("assets/dowload.gif"),
      //           // ),
      //           errorWidget: (context, url, error) =>
      //               Image.asset("assets.darling.jpg"),
      //           //On error loadidng shows an error image
      //         ),
      //         // Container(
      //         //   width: 200,
      //         //   height: 400,
      //         //   decoration: const BoxDecoration(
      //         //     image: DecorationImage(
      //         //         image: NetworkImage(
      //         //             "http://mvs.bslmeiyu.com/storage/profile/2022-05-02-626fc39bf18a6.png"),
      //         //         fit: BoxFit.fitWidth),
      //         //   ),
      //         // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
