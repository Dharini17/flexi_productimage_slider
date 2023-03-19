## flexi_productimage_slider

 An image slider to represents your products..:)

## Features

 - set image slider with its rest of the thumbnails 
 - it provides 2 style and each contains square & circle thumbnail with 3 styles

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
    </tr>
</table>

## Installation

  In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  flexi_productimage_slider: <latest_version>
```

## Usage

    aspectRatio : set this value as per your image ratio
    
    boxFit : how your image should fit in box

    thumbnailPosition : where you want present the rest of the images to end user

    thumbnailShape : set thumbnail shapes either sqaure or circle

    sliderStyle : Style1 : display thumbnails on the image (left , right , bottom)
                  Style2 : display thumbnails next to image (left , right , bottom)

```dart

import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';

        flexi_productimage_slider(
                    arrayImages: [
                                "https://thumbs.dreamstime.com/b/mauve-flower-composition-1-690383.jpg",
                                "https://c4.wallpaperflare.com/wallpaper/226/777/282/beautiful-flower-wallpaper-hd-free-download-1704-wallpaper-preview.jpg",
                                ],
                    aspectRatio: 16/9,
                    boxFit: BoxFit.cover,
                    thumbnailPosition: ThumbnailPosition.LEFT,
                    thumbnailShape: ThumbnailShape.Circle,
                    sliderStyle: SliderStyle.Style2
        ),
        ...


```

## Additional information

Images used for example is just for a demo purpose.
