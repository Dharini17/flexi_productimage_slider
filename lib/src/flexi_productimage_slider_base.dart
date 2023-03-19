import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ThumbnailAlignment { left, right, bottom }

enum ThumbnailShape { circle, custom }

enum SliderStyle { overSlider, nextToSlider, }

class flexiProductimageSlider extends StatelessWidget{

  final List<String> arrayImages;
  final double? aspectRatio;
  final BoxFit? boxFit;
  final ThumbnailAlignment? thumbnailAlignment;
  final ThumbnailShape? thumbnailShape;
  final double? thumbnailWidth;
  final double? thumbnailHeight;
  final Color? thumbnailBorderColor;
  final SliderStyle? sliderStyle;
  final Function? onTap;

  flexiProductimageSlider({
    required this.arrayImages,
    this.aspectRatio = 16/9,
    this.boxFit = BoxFit.fill,
    this.thumbnailAlignment = ThumbnailAlignment.left,
    this.thumbnailShape = ThumbnailShape.custom,
    this.thumbnailWidth = 40,
    this.thumbnailHeight = 40,
    this.thumbnailBorderColor = Colors.blueGrey,
    this.sliderStyle,
    this.onTap,
  });

  PageController pageController = PageController(initialPage: 0,);
  ValueNotifier<int> currentPageViewPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {

    return  buildContent();
  }

  Widget buildContent(){

    switch (sliderStyle){

      case SliderStyle.overSlider: return buildTheme1();

      case SliderStyle.nextToSlider: return buildTheme2();

      default: return buildTheme1();

    }

  }

  Widget buildTheme1(){
    return AspectRatio( aspectRatio: aspectRatio!,
              child:Stack(
      children: [

        Positioned.fill(
            child: buildImageSlider()
        ),

        thumbnailAlignment == ThumbnailAlignment.bottom ?

        Positioned(
            left: 0,bottom: 5,right: 0,
            child: buildThumbnail(isVertical: false)
        ) :

        thumbnailAlignment == ThumbnailAlignment.left ?

        Positioned(
            top: 5,left: 10,bottom: 5,
            child: buildThumbnail(isVertical: true)
        )
            :
        Positioned(
            top: 5,right: 10,bottom: 5,
            child: buildThumbnail(isVertical: true)
        )


      ],
    ));
  }

  Widget buildTheme2(){
    return

      thumbnailAlignment == ThumbnailAlignment.bottom ?
    Column(
      children: [

      AspectRatio( aspectRatio: aspectRatio!,
      child:buildImageSlider(),
      ),


        Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
          child: buildThumbnail(isVertical: false),
        )

      ],
    ):
      AspectRatio( aspectRatio: aspectRatio!,
          child:
      Row(
        children: [

          thumbnailAlignment == ThumbnailAlignment.left ?
          Padding(padding: EdgeInsets.only(left: 5,right: 5),
            child: buildThumbnail(isVertical: true),
          ) : const SizedBox(),

          Expanded(
              child:  buildImageSlider(),
          ),

          thumbnailAlignment == ThumbnailAlignment.right ?
          Padding(padding: EdgeInsets.only(left: 5,right: 5),
            child: buildThumbnail(isVertical: true),
          ) : const SizedBox(),

        ],
      ));
  }

  Widget buildImageSlider(){
    return PageView.builder(
      controller:pageController,
      onPageChanged: (int currentPage){

        currentPageViewPage.value = currentPage;
        currentPageViewPage.notifyListeners();

      },
      itemCount: arrayImages.length,
      itemBuilder: (context, index) {

        return

          InkWell(
            onTap: ()=> onTap!(index),
            child: funcDisplayImage(arrayImages[index],boxFit!),
          );

      },
    );
  }

  Widget buildThumbnail({required bool isVertical}){
    return Container(
       width: isVertical ? thumbnailWidth! + 10 : double.infinity,
      height: isVertical ? double.infinity : thumbnailHeight! + 10,
      child: ListView.builder(

        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        itemCount: arrayImages.length,
        itemBuilder: (context, index) {
          return Padding(padding: isVertical ? EdgeInsets.zero : EdgeInsets.only(left: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: (){

                    pageController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.linear);
                    currentPageViewPage.value = index;
                    currentPageViewPage.notifyListeners();

                  },
                  child:

                  ValueListenableBuilder(
                      valueListenable: currentPageViewPage,
                      builder: (BuildContext context, currIndexValue, child) {

                        return Container(
                          height:thumbnailHeight,
                          width: thumbnailWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular( thumbnailShape == ThumbnailShape.circle ?  (thumbnailHeight!/2) : 0),
                              border: currIndexValue != index ? Border.all(width: 0 ,color: Colors.transparent) : Border.all(width: 1,color: thumbnailBorderColor!)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular( thumbnailShape == ThumbnailShape.circle ? (thumbnailHeight!/2) : 0),
                            child: Padding(
                              padding: EdgeInsets.all(thumbnailShape == ThumbnailShape.circle ? 0 : 5),
                              child: funcDisplayImage(arrayImages[index],boxFit!),
                            ),
                          ),
                        );
                      })

                ),
                const SizedBox(height: 10,)
              ],
            ),
          );
        },

      ),
    );
  }

  //display network image
  static CachedNetworkImage funcDisplayImage(String strImageURL, BoxFit varBoxType) {

    return CachedNetworkImage(
      imageUrl: strImageURL,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: varBoxType,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(Icons.image_outlined,color: Colors.grey.shade400,),
      ),
    );
  }
}
