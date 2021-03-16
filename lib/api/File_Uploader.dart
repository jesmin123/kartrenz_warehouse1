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
    FormData formData = FormData.fromMap({
      "id":id,
      fileName: await MultipartFile.fromFile(file.path)
    });
    formData.fields.add(MapEntry("id", id));
    formData.files.add(MapEntry("image", await MultipartFile.fromFile(file.path)));
    try{
      Response response = await dio.post(dio.options.baseUrl+route, data: formData);
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