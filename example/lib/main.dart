import 'package:flutter/material.dart';
import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flexi_productimage_slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flexi_productimage_slider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:  SingleChildScrollView(
        child: Column(

          children: <Widget>[

            flexi_productimage_slider(
                arrayImages: [
                  "https://thumbs.dreamstime.com/b/mauve-flower-composition-1-690383.jpg",
                  "https://c4.wallpaperflare.com/wallpaper/226/777/282/beautiful-flower-wallpaper-hd-free-download-1704-wallpaper-preview.jpg",
                ],
                aspectRatio: 16/9,
                boxFit: BoxFit.cover,
                thumbnailPosition: ThumbnailPosition.LEFT,
                thumbnailShape: ThumbnailShape.Circle,
                sliderStyle: SliderStyle.Style2),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
