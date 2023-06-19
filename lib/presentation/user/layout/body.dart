import 'package:api_integrat/infrastruture/models/user.dart';
import 'package:api_integrat/infrastruture/services/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserBody extends StatelessWidget {
  UserBody({Key? key}) : super(key: key);
  final GetServices _getServices = GetServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureProvider.value(
              value: _getServices.getUserData(context),
              initialData: [UserModel()],
              builder: (context, child) {
                List<UserModel> userList = context.watch<List<UserModel>>();
                return ListView.builder(
                    itemCount: userList.length,
                    physics:NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text(userList[i].title.toString(),style:const TextStyle(
                                fontSize:18,fontWeight:FontWeight.w700
                              ),),
                              Row(
                              children: [
                                Text(userList[i].id.toString()),
                                Expanded(child: Text(userList[i].body.toString())),

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
