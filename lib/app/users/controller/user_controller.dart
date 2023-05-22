
import 'package:codixel/app/users/repository/user_repo.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController with StateMixin<User>{
    final UserRepo userRepo = UserRepo();


  @override
  void onInit() {
  
    super.onInit();
  }

  @override
  void onReady() {
     getUser();
    super.onReady();
  }

    void getUser()async{
      try {
        change(null, status: RxStatus.loading());
      await userRepo.getUserData().then((value) {
        change(value, status: RxStatus.success());
        
      }).catchError((onError){
        change(onError, status: RxStatus.error());
      });
      } catch (exception) {
        change(null, status: RxStatus.error(exception.toString()));
      }
    }
}