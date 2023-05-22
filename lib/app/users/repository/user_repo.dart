
import 'package:codixel/app/general/constants.dart';
import 'package:codixel/app/users/models/user.dart';
import 'package:dio/dio.dart' as dio;

class UserRepo {
  Future<User> getUserData()async{

      try{
        
        dio.Response response = await dio.Dio().get(Constants.url);

        if(response.statusCode == 200){
          User user = User.fromJson(response.data);

          return user;
        }else {
          throw "Response error in user model";
        }

      }catch(e){
        print("user model error $e");
        rethrow;
      }
  }
}