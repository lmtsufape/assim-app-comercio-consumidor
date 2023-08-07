import 'dart:developer';

import 'package:ecommerceassim/screens/signup/sign_up_repository.dart';
import 'package:ecommerceassim/shared/core/models/bairro_model.dart';
import 'package:ecommerceassim/shared/core/models/cidade_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../shared/constants/app_enums.dart';

enum SignUpStatus {
  done,
  error,
  loading,
  idle,
}

class SignUpController extends GetxController {
  double strength = 0;
  int _infoIndex = 0;
  int bairroId = 0;
  int cidadeId = 0;
  bool? signupSuccess;
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Z].*");
  String displayText = 'Digite sua Senha';
  String? errorMessage;

  List<BairroModel> bairros = [];
  List<CidadeModel> cidades = [];
  ScreenState screenState = ScreenState.idle;

  SignUpRepository signUpRepository = SignUpRepository();

  MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  MaskTextInputFormatter cepFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();
  final TextEditingController _foneController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _paisController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get bairroController => _bairroController;
  TextEditingController get cpfController => _cpfController;
  TextEditingController get apelidoController => _apelidoController;
  TextEditingController get foneController => _foneController;
  TextEditingController get ruaController => _ruaController;
  TextEditingController get cepController => _cepController;
  TextEditingController get cidadeController => _cidadeController;
  TextEditingController get numeroController => _numeroController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  TextEditingController get estadoController => _estadoController;
  TextEditingController get paisController => _paisController;

  int get infoIndex => _infoIndex;
  bool? get signupSucess => signupSuccess;

  void loadBairros() async {
    bairros = await signUpRepository.getbairros();
  }

  //void loadCidades() async {
  //  cidades = await signUpRepository.getCidades();
  //}

  void next() {
    _infoIndex++;
    update();
  }

  void back() {
    _infoIndex--;
    update();
  }

  checkPasswordStrength(String password) {
    password = password.trim();
    if (password.isEmpty) {
      strength = 0;
      displayText = 'Digite sua Senha';
    } else if (password.length <= 6) {
      strength = 1 / 4;
      displayText = 'Senha muito fraca';
    } else if (password.length <= 8) {
      strength = 2 / 4;
      displayText = 'Senha fraca';
    } else if (numReg.hasMatch(password) && letterReg.hasMatch(password)) {
      strength = 1;
      displayText = 'Senha muito forte';
    } else {
      strength = 3 / 4;
      displayText = 'Senha forte';
    }

    update();
  }

  void signUp(BuildContext context) async {
    signupSuccess = await signUpRepository.signUp(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _apelidoController.text,
        _foneController.text,
        _cpfController.text,
        _ruaController.text,
        _numeroController.text,
        _cepController.text,
        _cidadeController.text,
        _paisController.text,
        _estadoController.text,
        bairroId,
        context);
    update();

    //log("criaaaa ${signupSuccess.toString()}");
  }

  bool validateEmptyFields() {
    if (_nameController.text.isEmpty ||
        _apelidoController.text.isEmpty ||
        _cpfController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _foneController.text.isEmpty ||
        _cepController.text.isEmpty ||
        _ruaController.text.isEmpty ||
        _cidadeController.text.isEmpty ||
        _numeroController.text.isEmpty ||
        _paisController.text.isEmpty ||
        _estadoController.text.isEmpty ||
        bairroId.toString().isEmpty) {
      log('Error, o user não preencheu todos os campos, retornando falso');
      return false;
    }

    return true;
  }

  bool validateEmail() {
    if (_emailController.text.contains('@') &&
        _emailController.text.contains('.com')) {
      return true;
    }
    log('Error no cadastro de email, retornando falso');
    return false;
  }

  bool validateNumber() {
    if (_numeroController.text.length <= 4 &&
        _numeroController.text.contains(RegExp(r'[0-9]'))) {
      return true;
    }
    log('Error no cadastro de número, retornando falso');
    return false;
  }

  @override
  void onInit() {
    loadBairros();
    // loadCidades();
    super.onInit();
  }
}
