import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../usermodel/user_model.dart';

class UserController extends GetxController {
  RxBool isloading = false.obs;

 Rx<UserModel?> userData = Rx<UserModel?>(null);

  Future<void> fetchUserData() async {

    try {
      var dio = Dio();
      var response = await dio.get('https://dummyjson.com/users',
        // options: Options(method: 'GET')
      );

      if (response.statusCode == 200) {
        print(response.data);
        userData.value = UserModel.fromMap(data: response.data);
      } else {
        print('Error: ${response.statusMessage}');
      }
    } catch (e) {
      print('Exception caught: $e');
    } finally {
      isloading.value = false; // Set loading to false after completion
    }
  }
    // var dio = Dio();
    // var response = await dio.get(
    //   'https://dummyjson.com/users',
    //   // options: Options(
    //   //   method: 'GET',
    //   // ),
    // );
    //
    // if (response.statusCode == 200) {
    //   print(response.data);
    //   userData.value = UserModel.fromMap(data: response.data);
    // }
    // else {
    //   print(response.statusMessage);
    // }

//     try {
//       print("start");
//       String baseurl = "https://dummyjson.com/users";
//
//       // String baseurl = "https://jsonplaceholder.typicode.com/users";
//
//       http.Response res = await http.get(Uri.parse(baseurl));
//       print(res.statusCode);
//       debugger();
//       if (res.statusCode == 200) {
//         String data = res.body;
// print(data);
//         var decodedData = jsonDecode(data);
//         print(decodedData);
//         userData.value = UserModel.fromMap(data: decodedData);
//         // UserModel userModel = UserModel.fromMap(data: decodedData);
//         print("end");
//
//         // return userModel;
//       } else {
//         print("Api call failed:${res.statusCode}");
//       }
//     } on Exception catch (e) {
//       print(e.toString());
//     } finally {
//
//     }
  }

