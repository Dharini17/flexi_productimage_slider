## flexi_productimage_slider

 An image slider to represents your products..:)

## Features

 - Slide your products with thumbnail 
 - set your thumbnail in various shapes,custom sizes, custom selected color
 - perform your action on click on image

<table>
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/1.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/2.png">
      </td> 
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/3.png">
      </td> 
    </tr>
  <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/4.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/5.png">
      </td> 
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/6.png">
      </td> 
    </tr>
  <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/7.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/8.png">
      </td> 
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/9.png">
      </td> 
    </tr>
  <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/10.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/11.png">
      </td> 
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/12.png">
      </td> 
    </tr>
<tr>
 <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/13.png">
      </td>  
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/14.png">
      </td>          
    </tr>
<tr>
 <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_productimage_slider/master/assets/15.png">
      </td>  
      <td></td>          
    </tr>
</table>

## Installation

  In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  flexi_productimage_slider: 1.0.5
```

```dart

import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';

        flexiProductimageSlider(
        
                //required fields
                arrayImages: const [
                "https://i.ibb.co/ZLFHX3F/1.png",
                "https://i.ibb.co/JKJvs5S/2.png",
                "https://i.ibb.co/LCzV7b3/3.png",
                "https://i.ibb.co/L8JHn1L/4.png",
                "https://i.ibb.co/7RWNCXH/5.png",
                "https://i.ibb.co/bBsh5Pm/6.png",
                ],
                
                // optional fields
                
                //set where you want to set your thumbnail
                sliderStyle: SliderStyle.overSlider,//SliderStyle.nextToSlider
                
                // set you slider height like 1.0,1.5,2.0 etc...
                aspectRatio: 0.8,
                
                //set content mode of image
                boxFit: BoxFit.cover,
                
                //set your thumbnail alignment & shape
                thumbnailAlignment: ThumbnailAlignment.right,//ThumbnailAlignment.right , ThumbnailAlignment.bottom
                thumbnailShape: ThumbnailShape.circle,//ThumbnailShape.circle
                
                //set your thumbnail height & width
                //NOTE : if you set ThumbnailShape.circle then set thumbnail width height same
                thumbnailWidth: 50,
                thumbnailHeight: 65,
                
                //set color of current image thumbnail border
                thumbnailBorderColor: Colors.deepOrangeAccent,

                //set radius of your (thumbnailShape)custom thumbnail
                thumbnailBorderRadius: 10,
                
                //make you action when user click on image
                onTap: (index){
                      print("selected index : $index");
                },
        ),
        ...


```
NOTE : Images taken only for demo purpose
