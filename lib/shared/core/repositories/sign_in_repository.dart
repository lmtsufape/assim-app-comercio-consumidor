// sign_in_repository.dart
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/user_storage.dart';

class SignInRepository {
  final userStorage = UserStorage();
  String userId = "0";
  String userToken = "0";

  final _dio = Dio();

  Future<bool> checkEmailExists(String email) async {
    try {
      String? token = "401|SdE56cPwKTJSSAA5Rn4pc4LprbxYhrSiT28QPOLtdeaf5e31";
      print('Token used for checking email existence: $token');

      final response = await _dio.get(
        '$kBaseURL/users',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List users = response.data['users'];
        print('Users fetched: ${users.length}');
        for (var user in users) {
          print('Checking user email: ${user['email']}');
          if (user['email'] == email) {
            print('Email matched: ${user['email']}');
            return true;
          }
        }
        print('Email not found: $email');
        return false;
      } else {
        print('Failed to fetch users, status code: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error checking email existence: $error');
      return false;
    }
  }

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      String? token = await userStorage.getUserToken();
      print('Token used for sending reset password email: $token');

      final response = await _dio.post(
        '$kBaseURL/forgot-password',
        data: {'email': email},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send reset password email');
      }
    } catch (error) {
      print('Error sending reset password email: $error');
      throw Exception('Failed to send reset password email');
    }
  }

  Future<int> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$kBaseURL/sanctum/token',
        data: {'email': email, 'password': password, 'device_name': "PC"},
      );
      
      if (response.statusCode == 200) {
        if (await userStorage.userHasCredentials()) {
          await userStorage.clearUserCredentials();
        }
        
        userId = response.data['user']['id'].toString();
        userToken = response.data['token'].toString();
        
        await userStorage.saveUserCredentials(
          id: userId,
          nome: response.data['user']['name'].toString(),
          token: userToken,
          email: response.data['user']['email'].toString(),
        );

        try {
          Response userResponse = await _dio.get(
            '$kBaseURL/users/$userId',
            options: Options(headers: {"Authorization": "Bearer $userToken"})
          );
          
          if (userResponse.statusCode == 200) {
            List roles = userResponse.data['user']['roles'];
            if (roles.isNotEmpty) {
              int roleId = roles[0]['id'];
              print('Role ID: $roleId');
              
              // Verifica se é consumidor (role 5)
              if (roleId == 5) {
                return 1; // Sucesso - é consumidor
              } else {
                return 3; // Não autorizado - não é consumidor
              }
            }
          }
        } catch (e) {
          print(e);
          return 0;
        }
      }
    } catch (e) {
      print(e);
      return 0;
    }
    return 0;
  }
}