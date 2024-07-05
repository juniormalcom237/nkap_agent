import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nkap_agent/api/api_services.dart';
import 'package:nkap_agent/models/transaction.dart';
import 'package:nkap_agent/models/users.dart';
import 'package:nkap_agent/screens/home.dart';
import 'package:nkap_agent/widgets/snackbar.dart';

class MyController extends GetxController {
  var isLoading = false.obs;

  var localDB = GetStorage();

  var apiClient = ApiClient();
  Future<void> login(String telephone, String password) async {
    isLoading.value = true;
    var response = await apiClient.login(telephone, password);
    print('user ${response.user}');
    isLoading.value = false;
    // if (response["status"] == true) {
    //   localDB.write("authToken", response['access_token']);
    //   localDB.write("userData", response['data']);
    //   // localDB.write(, value)
    //
    // } else {
    //
    // }

    if (response.user != null) {
      var currentUser = await apiClient.getCurrentUserInfo();
      if (currentUser != null) {
        localDB.write("userData", currentUser);
        Get.offAll(() => HomePage());
        MySnackbar.mySnackbar("", "Connected Successfully");
      } else {
        MySnackbar.mySnackbar("", "invalid credentials");
      }
    } else {
      MySnackbar.mySnackbar("", "invalid credentials");
    }
  }

  Future<void> registration(
      String name, String telephone, String password) async {
    isLoading.value = true;
    var response = await apiClient.registration(name, telephone, password);
    if (response.user != null) {
      isLoading.value = false;
      MySnackbar.mySnackbar("", "Account created successfully");
    } else {
      isLoading.value = false;
      MySnackbar.mySnackbar("", "Please verify your connexion");
    }
  }

  Future<List<Users>> getContributors() async {
    var response = await apiClient.getContributors();

    if (response != null) {
      // localDB.write("contributors", response['data']);
      final endData = response as List;

      // final jsondata = response['data'] as List;
      List<Users> user =
          endData.map((dynamic item) => Users.fromJson(item)).toList();
      return user;
    } else {
      throw "no data";
    }
  }

  Future<List<Transaction>> getTransaction(String id) async {
    var response = await apiClient.getTransaction(id);
    if (response != null) {
      final jsondata = response as List;
      print(json);
      List<Transaction> transaction =
          jsondata.map((dynamic item) => Transaction.fromJson(item)).toList();
      return transaction;
    } else {
      throw "no data";
    }
  }

  Future<void> createCollect(
      String amount, String collectorId, String clientId) async {
    isLoading.value = true;
    var response = await apiClient.createCollect(amount, collectorId, clientId);
    print(response);
    if (response != null) {
      isLoading.value = false;
      Get.back();
      MySnackbar.mySnackbar("", "Collect added Successfully");
    } else {
      isLoading.value = false;
      MySnackbar.mySnackbar("", "Please verify your connection");
    }
  }
}
