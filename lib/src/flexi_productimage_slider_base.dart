import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

enum ThumbnailPosition { LEFT, RIGHT, BOTTOM }

enum ThumbnailShape { Circle, Square, Rectangle }

enum SliderStyle { Style1, Style2, }

class flexi_productimage_slider extends StatelessWidget{

  final List<String> arrayImages;
  final double aspectRatio;
  final BoxFit boxFit;
  final ThumbnailPosition thumbnailPosition;
  final ThumbnailShape thumbnailShape;
  final double thumbnailWidth;
  final SliderStyle sliderStyle;

  flexi_productimage_slider({
    required this.arrayImages,
    required this.aspectRatio,
    required this.boxFit,
    required this.thumbnailPosition,
    required this.thumbnailShape,
    required this.thumbnailWidth,
    required this.sliderStyle,
  });

  PageController _pageController = PageController(initialPage: 0,);

  @override
  Widget build(BuildContext context) {

    return  AspectRatio( aspectRatio: aspectRatio,
      child: _buildContent(),
    );
  }

  Widget _buildContent(){

    switch (sliderStyle){

      case SliderStyle.Style1: return _buildStyle1();

      case SliderStyle.Style2: return _buildStyle2();

      default: return _buildStyle1();

    }

  }

  Widget _buildStyle1(){
    return Stack(
      children: [

        Positioned.fill(
            child: _buildImageSlider()
        ),

        thumbnailPosition == ThumbnailPosition.BOTTOM ?

        Positioned(
            left: 0,bottom: 5,right: 0,
            child: _buildThmbnail(isVertical: false)
        ) :

        thumbnailPosition == ThumbnailPosition.LEFT ?

        Positioned(
            top: 5,left: 10,bottom: 5,
            child: _buildThmbnail(isVertical: true)
        )
            :
        Positioned(
            top: 5,right: 10,bottom: 5,
            child: _buildThmbnail(isVertical: true)
        )


      ],
    );
  }

  Widget _buildStyle2(){
    return

      Row(
        children: [

          thumbnailPosition == ThumbnailPosition.LEFT ?
          Padding(padding: EdgeInsets.only(left: 5,right: 5),
            child: _buildThmbnail(isVertical: true),
          ) : const SizedBox(),

          Expanded(
              child:

              Column(
                children: [

                  Expanded(
                    child: _buildImageSlider(),
                  ),

                  thumbnailPosition == ThumbnailPosition.BOTTOM ?

                  Padding(padding: EdgeInsets.only(top: 5,bottom: 5),
                    child: _buildThmbnail(isVertical: false),
                  ) : const SizedBox(),
                ],
              )
          ),

          thumbnailPosition == ThumbnailPosition.RIGHT ?
          Padding(padding: EdgeInsets.only(left: 5,right: 5),
            child: _buildThmbnail(isVertical: true),
          ) : const SizedBox(),

        ],
      );
  }

  Widget _buildImageSlider(){
    return PageView.builder(
      controller:_pageController,
      onPageChanged: (int currentPage){

      },
      itemCount: arrayImages.length,
      itemBuilder: (context, index) {

        return

          InkWell(
            onTap: (){

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => gallery_zoom_slides(arrayImages: arrayImages, currentIndex: index)));

              },
            child: funcDisplayImage(arrayImages[index],boxFit),
          );

      },
    );
  }

  Widget _buildThmbnail({required bool isVertical}){
    return Container(
      width: isVertical ? 50 : double.infinity,
      height: isVertical ? double.infinity : 55,
      child: ListView.builder(

        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        itemCount: arrayImages.length,
        itemBuilder: (context, index) {
          return Padding(padding: isVertical ? EdgeInsets.zero : EdgeInsets.only(left: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: (){

                    _pageController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.linear);

                  },
                  child: Container(height:thumbnailShape == ThumbnailShape.Rectangle ? (thumbnailWidth + (thumbnailWidth/2)) : thumbnailWidth ,width: thumbnailWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular( thumbnailShape == ThumbnailShape.Circle ?  (45/2) : 0),
                        //border: Border.all(width: 1,color: Theme.of(context).colorScheme.background)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular( thumbnailShape == ThumbnailShape.Circle ? (45/2) : 0),
                      child: funcDisplayImage(arrayImages[index],boxFit),
                    ),
                  ),
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
      imageUrl: "$strImageURL",
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
