import 'package:flutter/material.dart';
import 'package:kartenz/constants/app_font_style.dart';
import 'package:kartenz/constants/colors.dart';
import 'package:kartenz/model/ImageModel.dart';
import 'package:kartenz/ui/utilis/no_image_utilis.dart';

class ExteriorImageWidget extends StatefulWidget {
  List<ImageModel> images;

  ExteriorImageWidget(this.images);

  @override
  _ExteriorImageWidgetState createState() => _ExteriorImageWidgetState();
}

class _ExteriorImageWidgetState extends State<ExteriorImageWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.images==null?Container():ListView.builder(
      shrinkWrap: true,
        itemCount: widget.images.length,
        itemBuilder: (context, pos){
        ImageModel  imageModel = widget.images[pos];
          return Container(
            child: Card(
              elevation: 0.5,
              child: Column(
                children: [
                  ImageUtil.banner(imageModel.image),
                  SizedBox(height: 12,),
                  Text("${imageModel.value}", style: AppFontStyle.regularTextStyle(APP_BLACK_COLOR),),
                  SizedBox(height: 8,),
                ],
              ),
            ),
          );
        }
    );
  }
}
