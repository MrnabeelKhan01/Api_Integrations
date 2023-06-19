import 'package:api_integrat/infrastruture/models/photos.dart';
import 'package:api_integrat/infrastruture/services/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotosBody extends StatelessWidget {
   PhotosBody({Key? key}) : super(key: key);
  final GetServices _getServices= GetServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureProvider.value(
              value: _getServices.getPhotosData(context),
              initialData: [PhotosModel()],
              builder: (context, child) {
                List<PhotosModel> photoList = context.watch<List<PhotosModel>>();
                return ListView.builder(
                    itemCount: photoList.length,
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:NetworkImage(photoList[i].url.toString()),
                              ),
                              Text(photoList[i].title.toString(),style:const TextStyle(
                                  fontSize:18,fontWeight:FontWeight.w700
                              ),),
                              Row(
                                children: [
                                  Text(photoList[i].id.toString()),

                                ],
                              )],
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
