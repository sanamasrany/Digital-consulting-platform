import 'package:digital_consulting_platform/config/user_information.dart';
import 'package:digital_consulting_platform/models/Fav_list.dart';
import 'package:digital_consulting_platform/models/business_model.dart';
import 'package:digital_consulting_platform/models/expert.dart';
import 'package:digital_consulting_platform/models/family_model.dart';
import 'package:digital_consulting_platform/models/medical_model.dart';
import 'package:digital_consulting_platform/models/psychological_model.dart';
import 'package:digital_consulting_platform/models/reservedTime.model.dart';
import 'package:digital_consulting_platform/models/toprated_model.dart';
import 'package:digital_consulting_platform/models/vocational_model.dart';

import 'package:digital_consulting_platform/pages/main_page/main_page_service.dart';
import 'package:get/get.dart';

import '../../models/expertmainpage.dart';

class MainPageController extends GetxController{


  //var searchname=''.obs;
  Rx<List<Expert>> SearchList = Rx<List<Expert>> ([]) ;

  // List<Favlist>  expertsListFav = [] ;
  List<Top10>  expertsListtop = [] ;
  List<BusinessElement> expertsListbusiness = [] ;
  List<FamilyElement> expertsListfamily = [] ;
  List<PsychologicalElement> expertsListpsychological = [] ;
  List<VocationalElement> expertsListvocational = [] ;
  List<MedicalElement> expertsListmedical = [] ;
  List<Expert> expertsList = [] ;
  MainPageService _service = MainPageService();
  var loading = true.obs;
  Rx<List<Expert>> findExperts =Rx<List<Expert>> ([]);
  var search = true.obs;
  var selectedIndex =0.obs;

  var ChickrateStatus = false;
  var newrate ;
  var ChickFAVStatus= false;




  @override
  void onInit() {

    super.onInit();
    findExperts.value = expertsList;
  }

  @override
  void onReady() async {
    expertsList = await _service.getExperts(UserInformation.user_token );

    medicallist();
    vocationallist();
    psychologicallist();
    familylist();
    businesslist();
    toplist();

    loading(false);
    super.onReady();
  }

  void medicallist() async {
  expertsListmedical = await _service.medical(UserInformation.user_token );
 // loading(false);
}
  void vocationallist() async {
    expertsListvocational = await _service.vocational(UserInformation.user_token );
    // loading(false);
  }
  void psychologicallist() async {
    expertsListpsychological = await _service.psychological(UserInformation.user_token );
    // loading(false);
  }
  void familylist() async {
    expertsListfamily = await _service.family(UserInformation.user_token );
    // loading(false);
  }
  void businesslist() async {
    expertsListbusiness = await _service.business(UserInformation.user_token );
    // loading(false);
  }
  void toplist() async {
    expertsListtop = await _service.top(UserInformation.user_token );
    // loading(false);
  }


  void searchlist(String searchname) async {
    search(false);
   // List<Expert>  results =expertsList;
    if (searchname.isEmpty){
      SearchList.value   = expertsList;
    }
    else{
    SearchList.value = await _service.getExpertsSearch(searchname );}
    // loading(false);
  }
  Future<void> controllerChickrate(String id) async {
    print(id);
    print(UserInformation.user_id);
    ChickrateStatus  = await _service.checkisrated( UserInformation.user_id,id );

    newrate = _service.newrate;

  }

  Future<void> controllerChickfav(String id) async {
    print(id);
    print(UserInformation.user_id);
    ChickFAVStatus  = await _service.checkfavourite( UserInformation.user_id,id );


  }


  // void filterExperts (String expertname) async{
  // search(false);
  //   List<Expert>  results =expertsList;
  //   if (expertname.isEmpty){
  //     results = expertsList;
  //   }
  //   else{
  //     results = expertsList.where((element) => element.name.toString().toLowerCase()
  //   .contains(expertname.toLowerCase())).toList();
  //   }
  //   findExperts.value =results  ;
  // }

  void changeIndex (int index){
  selectedIndex.value = index;
  }


}