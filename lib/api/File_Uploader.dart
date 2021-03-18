import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kartenz/model/RespObj.dart';



class FileUploader{
  Dio dio;

  FileUploader(){
    dio = new Dio();
    dio.options.baseUrl = 'http://kartrenz.com:4000/';
    dio.options.connectTimeout = 100000; //10s
    dio.options.receiveTimeout = 50000;//10s
  }

  Future<RespObj> uploadFile(String route,PlatformFile file, String fileName,{String header,String id})  async {
    MultipartFile fileX = await MultipartFile.fromFile(file.path);

    FormData formData = FormData.fromMap({
      "id":"605090c250e448002a98c862",
      "image":fileX
    });
    // formData.fields.add(MapEntry("id", "605090c250e448002a98c862"));
    //
    // formData.files.add(MapEntry("image", fileX));
    dio.options.headers["x-auth-token"]= header;
    try{
      Response response = await dio.post(dio.options.baseUrl+route, data: formData,);
      if(response!=null){
        String respString = response.toString();
        print(respString);
        return RespObj(true);
      }
      else{
        return RespObj(false,msg: "Failed to connect");
      }
    }catch(ex){
      print("Exception ex: "+ex.toString());
      return RespObj(false,msg: "Failed to connect");
    }
  }
}

final fileUploader = FileUploader();