import 'package:flutter/material.dart';
import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

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

 List<String> arrayImages = const [
   "https://i.ibb.co/ZLFHX3F/1.png",
   "https://i.ibb.co/JKJvs5S/2.png",
   "https://i.ibb.co/LCzV7b3/3.png",
   "https://i.ibb.co/L8JHn1L/4.png",
   "https://i.ibb.co/7RWNCXH/5.png",
   "https://i.ibb.co/bBsh5Pm/6.png",
 ];

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

            const SizedBox(height: 10,),

            flexiProductimageSlider(

              //required fields
                arrayImages: arrayImages,

                // optional fields

                //set where you want to set your thumbnail
                sliderStyle: SliderStyle.overSlider,//.nextToSlider

                // set you slider height like 1.0,1.5,2.0 etc...
                aspectRatio: 0.8,

                //set content mode of image
                boxFit: BoxFit.cover,

                //set your thumbnail alignment in slider
                thumbnailAlignment: ThumbnailAlignment.left,//.right , .bottom
                thumbnailBorderType: ThumbnailBorderType.all,//.bottom, .all
                thumbnailBorderWidth: 1.5,//double value

                //set corner radius of your thumbnail
                thumbnailBorderRadius: 2,

                //set your thumbnail height & width
                //NOTE : if you set ThumbnailShape.circle then set thumbnail width height same
                thumbnailWidth: 55,
                thumbnailHeight: 55,

                //set color of current image thumbnail border
                thumbnailBorderColor: Colors.blue,

                //make you action when user click on image
                onTap: (index){
                  print("selected index : $index");

                  //for zooming effect on click
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      galleryZoomSlides(

                        //required fields
                        arrayImages: arrayImages,

                        //Optional fields
                        zoomTheme: ZoomTheme.theme3,//.theme1, .theme2, .theme3
                        selectedImagePosition: index,
                        selectedThumbnailColor: Colors.blue,
                      )
                  )
                  );

                },
             ),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
