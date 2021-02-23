import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kartenz/model/RespObj.dart';

class ApiUtils {
  static ApiUtils _instance  = new ApiUtils.internal();
  ApiUtils.internal();

  factory ApiUtils() => _instance;
  static final baseUrl = "http://kartrenz.com:4000/";

  Future<RespObj> getData(String route,{String header}) async{
    Map<String, String> mHeaders = {"Content-type": "application/json","x-auth-token":header};
    try{
      Response response = await get(baseUrl+route,headers: mHeaders);
      print(response.body.toString());
      if(response.statusCode==200){
        return RespObj.fromJSON(json.decode(response.body));
      }else{
        return RespObj(false,msg: response.body);
      }
    }catch(ex){
      print("Exception e :"+ex.toString());
      return RespObj(false,msg: 'Server Unavailable');
    }

  }

  Future<RespObj> postData(String route,{String mBody,String header}) async{
    Map<String, String> mHeaders = {"Content-Type": "application/json","x-auth-token":header};
    try{
      Response response = await post(baseUrl+route,headers: mHeaders,body: mBody);
      if(response.statusCode==200){
        return RespObj.fromJSON(json.decode(response.body));

      }else{

        return RespObj(false,msg: response.body);
      }
    }catch(e){
      return RespObj(false,msg: 'Server Unavailable');
    }
  }


  Future<RespObj> fileUplaod(String route,File file, String fileName,{String header,String id}) async{

    print('ID Api : '+id);
    var request = MultipartRequest("POST", Uri.parse(baseUrl+route));
    request.fields["id"] = id;
    var image = await MultipartFile.fromPath(fileName, file.path);
    request.files.add(image);

    var resp = await request.send();
    print("Raw resp"+resp.toString());
    var responseData = await resp.stream.toBytes();
    print("Resp Data"+responseData.toString());
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    return RespObj.fromJSON(json.decode(responseString));

  }

}

final api = ApiUtils();