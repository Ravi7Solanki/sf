import 'package:filtersearch/lib/profile_data.dart';
import 'package:flutter/material.dart';

import 'filtor.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];

  @override

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(children: [ Column(
          children: <Widget>[
            SizedBox(height: 25,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Padding(
                padding: const EdgeInsets.only(left: 15.0,),
                child: Text("Groups", style: TextStyle(color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.add, color: Colors.blue,),
                )
              ],),
            SizedBox(height: 10,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text("Profiles", style: TextStyle(color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),),
              )
              ],),




          ],
        ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .06,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .91,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black12,),
                  borderRadius: BorderRadius.circular(10)
              ),

              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            10.0)),
                    )),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: profileList.length,

              itemBuilder: (context, index) {
                ProfileData profile = profileList[index];
                if (editingController.text.isEmpty) {
                  return ListTile(
                    title:
                    Text('${profileList[index].name}',style: TextStyle(fontSize: 14),),
                    subtitle: Text('${profileList[index].age.toString()}',style: TextStyle(fontSize: 14),),
                    trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Filtor(profile)));
                    },
                  );
                } else if (profileList[index]
                    .name
                    .toLowerCase()
                    .contains(editingController.text) ||
                    profileList[index]
                        .age
                        .toLowerCase()
                        .contains(editingController.text)) {
                  return ListTile(
                    title:
                    Text('${profileList[index].name} '),
                    subtitle: Text('${profileList[index].age.toString()}'),
                    trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Filtor(profile)));
                    },

                  );
                } else {
                  return Container(

                  );
                }
              }),],)
      ),
    );
  }
}
