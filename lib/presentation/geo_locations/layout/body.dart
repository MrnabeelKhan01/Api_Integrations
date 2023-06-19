import 'package:api_integrat/infrastruture/models/map.dart';
import 'package:api_integrat/infrastruture/models/photos.dart';
import 'package:api_integrat/infrastruture/services/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeoBody extends StatelessWidget {
  GeoBody({Key? key}) : super(key: key);
  final GetServices _getServices = GetServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureProvider.value(
              value: _getServices.getMapData(context),
              initialData: [MapModel()],
              builder: (context, child) {
                List<MapModel> _mapList = context.watch<List<MapModel>>();
                return ListView.builder(
                    itemCount: _mapList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _mapList[i].name.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                _mapList[i].email.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                _mapList[i].username.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                _mapList[i].company.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  Text(_mapList[i].id.toString()),
                                ],
                              ),
                              Text(_mapList[i].address!.city.toString(),style:const TextStyle(
                                  fontSize:18,fontWeight:FontWeight.w700
                              ),),
                              Text(_mapList[i].address!.geo!.lat.toString(),style:const TextStyle(
                                  fontSize:18,fontWeight:FontWeight.w700
                              ),),
                            ],
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
