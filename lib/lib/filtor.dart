import 'package:filtersearch/lib/profile_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Filtor extends StatelessWidget {
  final ProfileData profileList;
  Filtor(this.profileList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Profile"),
      centerTitle: true,
    ),
      body: SafeArea(
        child: SingleChildScrollView(child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              SizedBox(height: 70,),
              Center(
                child: CircleAvatar(backgroundImage: AssetImage("images/justin.jpg",
                ),radius: 70,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(profileList.name,style: TextStyle(fontSize: 21),),


                ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(profileList.age,style: TextStyle(fontSize: 21),),


                ],),


            ]),),
      ));
  }
}
