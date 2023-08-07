import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerceassim/shared/constants/app_text_constants.dart';
import 'package:ecommerceassim/shared/core/models/cidade_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/dialogs/default_alert_dialog.dart';
import '../../shared/constants/style_constants.dart';
import '../../shared/core/models/bairro_model.dart';
import '../../shared/core/user_storage.dart';
import '../screens_index.dart';
import '../signin/sign_in_repository.dart';

class SignUpRepository {
  final Dio _dio = Dio();
  BairroModel bairroModel = BairroModel();
  CidadeModel cidadeModel = CidadeModel();
  UserStorage userStorage = UserStorage();
  SignInRepository signInRepository = SignInRepository();
  Future<bool> signUp(
      String name,
      String email,
      String password,
      String apelido,
      String telefone,
      String cpf,
      String rua,
      String numero,
      String cep,
      String cidade,
      String estado,
      String pais,
      int bairro,
      BuildContext context) async {
    try {
      //Efetua a chamada da API para o cadastro do produtor
      Response response = await _dio.post('$kBaseURL/consumidores',
          options: Options(headers: {
            'Content-Type': 'application/json',
            // "Accept": "application/json",
          }),
          data: {
            "name": name,
            "email": email,
            "password": password,
            "apelido": apelido,
            "telefone": telefone,
            "cpf": cpf,
            "rua": rua,
            "bairro_id": bairro,
            "numero": numero,
            "cep": cep,
            "cidade": cidade,
            "estado": estado,
            "país": pais,
          });
      if (response.statusCode == 201) {
        //print(response.data);
        //Caso o cadastro do consumidor dê certo, ele pega o email do produtor e faz o login para pegar o token,
        // depois ele faz o cadastro da banca
        String emailConsumidor = response.data["usuário"]["email"];
        // ignore: unused_local_variable
        int idConsumidor = response.data["usuário"]["papel_id"];
        //log('idConsumidor: $idConsumidor');
        try {
          Response login = await _dio.post(
            '$kBaseURL/login',
            data: {
              'email': emailConsumidor,
              'password': password,
            },
          );

          if (login.statusCode == 200) {
            String userToken = login.data['user']['token'].toString();
            userStorage.saveUserCredentials(
                nome: login.data['user']['nome'],
                email: login.data['user']['email'],
                token: userToken,
                id: login.data['user']['id'].toString(),
                papel: login.data['user']['papel_id'].toString(),
                papelId: login.data['user']['papel_id'].toString());
            // ignore: use_build_context_synchronously
            showDialog(
                context: context,
                builder: (context) => DefaultAlertDialog(
                      title: 'Sucesso',
                      body: 'Cadastro realizado com sucesso',
                      cancelText: 'Ok',
                      confirmText: 'Ok',
                      onConfirm: () =>
                          Navigator.pushReplacementNamed(context, Screens.home),
                      confirmColor: kSuccessColor,
                      cancelColor: kErrorColor,
                    ));
            return true;
          }
        } catch (e) {
          log('Erro no login ${e.toString()}');
          return false;
        }
        return false;
      } else {
        log('error dentro do request do cadastro do consumidor ${response.statusMessage}');
        return false;
      }
    } catch (e) {
      log('Erro na chamada do cadastro do consumidor ${e.toString()}');
      showDialog(
          context: context,
          builder: (context) => DefaultAlertDialogOneButton(
                title: 'Erro',
                body: 'Ocorreu um erro, verifique os campos e tente novamente',
                onConfirm: () {
                  //navigator
                },
                confirmText: 'Ok',
                buttonColor: kErrorColor,
              ));
      return false;
    }
  }

  Future<List<BairroModel>> getbairros() async {
    List<dynamic> all;
    List<BairroModel> bairros = [];

    try {
      Response response = await _dio.get('$kBaseURL/bairros');
      if (response.statusCode == 200) {
        all = response.data['bairros'];
        if (all.isNotEmpty) {
          for (int i = 0; i < all.length; i++) {
            bairroModel = BairroModel(id: all[i]['id'], nome: all[i]['nome']);
            bairros.add(bairroModel);
          }
          return bairros;
        } else {
          return [];
        }
      } else {
        print('erro');
        return [];
      }
    } on DioError catch (e) {
      log(e.toString());
      return [];
    }
  }

  /*Future<List<CidadeModel>> getCidades() async {
    List<dynamic> all;
    List<CidadeModel> cidades = [];

    try {
      Response response = await _dio.get('$kBaseURL/cidades');
      if (response.statusCode == 200) {
        all = response.data['cidades'];
        if (all.isNotEmpty) {
          for (int i = 0; i < all.length; i++) {
            cidadeModel = CidadeModel(id: all[i]['id'], nome: all[i]['nome']);
            cidades.add(cidadeModel);
          }
          return cidades;
        } else {
          return [];
        }
      } else {
        print('erro');
        return [];
      }
    } on DioError catch (e) {
      log(e.toString());
      return [];
    }
  }*/
}
