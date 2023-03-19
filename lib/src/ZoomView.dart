import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

class ZoomView extends StatelessWidget {

  int currentIndex;
  List<String> arrayImages;
  ZoomView({required this.arrayImages,required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

        body:  gallery_zoom_slides(
            arrayImages: arrayImages,
            currentIndex: currentIndex
        )

    );
  }
}