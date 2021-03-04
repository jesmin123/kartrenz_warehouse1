
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kartenz/api/api.dart';
import 'package:kartenz/constants/colors.dart';

class ImageUtil{

  static network(String url){
    if(url==null || url.isEmpty){
      return Image.asset(
        'assets/images/137.jpg',
        height: 120,
      );
    }
    return CachedNetworkImage(
      imageUrl: ApiUtils.imagebaseUrl+url,
      fit: BoxFit.fitHeight,
      height: 120,
      errorWidget: (context,url,error){
        return Image.asset(
          'assets/images/137.jpg',
          height: 120,
        );
      },
      placeholder: (context,url){
        return SpinKitWave(
          color: Colors.white,
          size: 24.0,
        );
      },
    );
  }

  static banner(String url){
    if(url==null || url.isEmpty){
      return Image.asset(
        'assets/images/137.jpg',
      );
    }
    return CachedNetworkImage(
      imageUrl: ApiUtils.imagebaseUrl+url,
      fit: BoxFit.cover,
      errorWidget: (context,url,error){
        return Image.asset(
          'assets/images/137.jpg',
        );
      },
      placeholder: (context,url){
        return SpinKitWave(
          color: PRIMARY_COLOR,
          size: 24.0,
        );
      },
    );
  }
}