import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygetx/myproduct1/Products.dart';

import 'Apiservice.dart';

class Controller extends GetxController {


  RxList<Products> prolist=<Products>[].obs;

  ApiService apiService=ApiService();
  Future<void> Fetch() async {

    var list =await apiService.fetchdata();
    prolist.assignAll(list as Iterable<Products>);
    update();
  }
}



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      home:First() ,
    );
  }
}
class First extends StatelessWidget {

  First({super.key});




  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    controller.Fetch();

    return Scaffold(
      appBar: AppBar(

        
      ),
      body: Center(
        child: GetBuilder<Controller>(
            builder: (_)
            {
              return ListView.builder(
              itemCount: controller.prolist.length,
              itemBuilder: (BuildContext context, int index) {

                Products p=controller.prolist[index];
                return ListTile(
                  title: Text("${p.title}"),
                  subtitle: Text("${p.category}"),
                  leading: Text("${p.brand}"),
                );

              },



              );
            }
               ),
      ),


    );
  }
}


