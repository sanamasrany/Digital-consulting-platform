import 'package:digital_consulting_platform/config/server_config.dart';
import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/Fav_list.dart';
import 'package:digital_consulting_platform/pages/expert_page/expertpage.dart';
import 'package:digital_consulting_platform/pages/favorite_page/fav_page_controller.dart';
import 'package:digital_consulting_platform/pages/main_page/main_page_controller.dart';



import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../constant.dart';



class FavoritePage extends StatelessWidget{
  FAVPageController controller = Get.put(FAVPageController());

  @override
  Widget build(BuildContext context) {
   // final provider = Provider.of<FavoriteProvider>(context);
    //final expertlist = provider.favlist;
  //  FAVPageController controller = FAVPageController();
  //  FAVPageController controller = Get.find();

   return Scaffold(


       backgroundColor: firstBackColor,
       appBar: AppBar(
         title: Text("Favorites".tr,
           style:  TextStyle(
             fontSize: 25,
             // fontWeight: FontWeight.bold,
             fontFamily: "Raleway bold",
           ),
         ),
         backgroundColor: firstBackColor,
         toolbarHeight: 80,
         centerTitle: true,
         shadowColor: Colors.black,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),

       ),


       body:
       SafeArea(
           child: Container(
               decoration: gradientBackground,
               child: Obx (() {
                 if (controller.loading1.isTrue) {
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 return ListView.builder(
                     scrollDirection: Axis.vertical,
                     itemCount: controller.expertsListFav.length,

                     itemBuilder: (context, i) {
                       Favlist   ex = controller.expertsListFav[i];
                       return
                         Card(
                             elevation: 5.2,
                             shadowColor: firstBackColor,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30)),
                             child: GestureDetector(
                               onTap: () {



                               },
                               child: Container(
                                 height: 65,
                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width,
                                 margin: const EdgeInsets.only(top: 10, bottom: 4),
                                 //  padding:
                                 //const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
                                 child: Row(

                                     children: [ Expanded(child:
                                     //picture

                                     Container(
                                       height: 60,
                                       width: MediaQuery
                                           .of(context)
                                           .size
                                           .width * 0.25,
                                       // color: Colors.amber,
                                       child:
                                       controller.expertsListFav[i].expert.imgpath !=null
                                           ? CircleAvatar(
                                         backgroundImage:

                                         NetworkImage('${ServerConfig.domainNameserver}/${controller.expertsListFav[i].expert.imgpath}'


                                         ) ,//
                                       )

                                           : CircleAvatar(
                                         backgroundImage:

                                         AssetImage('assets/images/profile2.jpg') ,//
                                       ) ,

                                     )),
                                       Expanded(child: Column(

                                           children: [
                                             Expanded(child: Text(
                                                 controller.expertsListFav[i].expert.name

                                                 ,
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 16,
                                                   fontFamily: 'Raleway bold',
                                                 )
                                             )),

                                             Expanded(child: Text(
                                                 controller.expertsListFav[i].expert.experinces
                                                 ,
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 15,
                                                   fontFamily: 'Raleway reg',
                                                 )))
                                           ])),
                                       Expanded(child: SizedBox(width: 130,)),
                                       Expanded(child: Icon(
                                         Icons.favorite, color: Colors.red,
                                         size: 20,

                                       ),
                                       )
                                     ]),


                               ),
                             )
                         );
                     }
                 );
               }  )
           )
       )


     //     SafeArea(
     //       child : Container (
     //       decoration: gradientBackground,
     //       child:
     //     ListView.builder(
     //
     //         itemCount: expertlist.length ,
     //         itemBuilder:  (context,index){
     //           Expert  ex = expertlist[index];
     //           return
     //
     //             Card(
     //               child: ListTile (
     //
     //                 title: Text(ex.name ?? 'expert'),
     //                 leading: CircleAvatar(backgroundImage: AssetImage("assets/images/kou.jpg")),
     //                 trailing:
     //                 IconButton(onPressed: (){
     //                   provider.togglefav(ex);
     //                 },
     //
     //                     icon: provider.isExist(ex)
     //                         ?Icon(Icons.favorite, color: Colors.red)
     //                         :Icon(Icons.favorite_border,)
     //                 ),
     //               ),
     //             );
     //         }
     //
     //     ),
     //       )
     // )
   );
  }



}
