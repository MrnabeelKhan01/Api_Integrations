import 'package:api_integrat/helper/api_helper.dart';
import 'package:api_integrat/infrastruture/models/photos.dart';
import 'package:api_integrat/infrastruture/models/user.dart';
import 'package:flutter/cupertino.dart';
final  BaseApiHelper _apiHelper=BaseApiHelper();
class  GetServices{

  Future<List<UserModel>>getUserData(BuildContext context)async{
    final response= await _apiHelper.get(context, endPoint:"/posts");
    List<UserModel> _userData=[];
    for(var i in response){
      _userData.add(UserModel.fromJson(i));
    }
    return _userData;
  }
  Future<List<PhotosModel>>getPhotosData(BuildContext context)async{
    final response= await _apiHelper.get(context, endPoint:"/posts");
    List<PhotosModel> _photosData=[];
    for(var i in response){
      _photosData.add(PhotosModel.fromJson(i));
    }
    return _photosData;
  }
}