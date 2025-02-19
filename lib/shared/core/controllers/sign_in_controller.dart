// sign_in_controller.dart
// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceassim/screens/screens_index.dart';
import 'package:ecommerceassim/shared/core/repositories/sign_in_repository.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceassim/shared/components/dialogs/default_alert_dialog.dart';
import 'package:ecommerceassim/shared/constants/style_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SignInStatus {
  done,
  error,
  loading,
  idle,
}

class SignInController with ChangeNotifier {
  final SignInRepository _repository = SignInRepository();
  String? email;
  String? password;
  String? _userName;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;
  String? get userName => _userName;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  var status = SignInStatus.idle;

  SignInController() {
    loadSavedEmail();
  }

  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
  }

  Future<void> loadSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('userEmail');
    if (savedEmail != null) {
      _emailController.text = savedEmail;
      notifyListeners();
    }
  }

  void signIn(BuildContext context) async {
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        throw Exception("Por favor, forneça seu email e senha.");
      }

      status = SignInStatus.loading;
      notifyListeners();

      var result = await _repository.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (result == 1) {
        await saveEmail(_emailController.text);
        status = SignInStatus.done;
        notifyListeners();
        Navigator.pushReplacementNamed(context, Screens.home);
      } 
      else if (result == 3) {
        status = SignInStatus.error;
        notifyListeners();
        showDialog(
          context: context,
          builder: (context) => DefaultAlertDialogOneButton(
            title: 'Acesso Negado',
            body: 'Este aplicativo é exclusivo para consumidores.',
            confirmText: 'Voltar',
            textColor: Colors.white,
            onConfirm: () => Navigator.pop(context),
            buttonColor: kErrorColor,
          )
        );
        setErrorMessage('Você não tem permissão para acessar este aplicativo.');
      } 
      else {
        status = SignInStatus.error;
        notifyListeners();
        showDialog(
          context: context,
          builder: (context) => DefaultAlertDialogOneButton(
            title: 'Erro',
            body: 'Credenciais inválidas, verifique seus dados',
            confirmText: 'Voltar',
            textColor: Colors.white,
            onConfirm: () => Navigator.pop(context),
            buttonColor: kErrorColor,
          )
        );
        setErrorMessage('Credenciais inválidas. Verifique seus dados.');
      }
    } catch (e) {
      status = SignInStatus.error;
      notifyListeners();
      if (e is Exception) {
        setErrorMessage('Por favor, forneça seu email e senha.');
      } else {
        setErrorMessage('Credenciais inválidas. Verifique seus dados.');
      }
    }
  }

  void logout(BuildContext context) {
    String? displayName = _userName ?? email?.split('@').first;

    email = null;
    password = null;
    _userName = null;
    _emailController.clear();
    _passwordController.clear();
    errorMessage = null;

    status = SignInStatus.idle;
    notifyListeners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Você foi desconectado.'),
      ),
    );
    Navigator.pushReplacementNamed(context, Screens.first,
        arguments: displayName);
  }

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      if (email.isEmpty) {
        throw Exception("Por favor, forneça seu email.");
      }

      status = SignInStatus.loading;
      notifyListeners();

      bool emailExists = await _repository.checkEmailExists(email);
      if (!emailExists) {
        throw Exception("O email fornecido não está registrado.");
      }

      await _repository.sendResetPasswordEmail(email);

      status = SignInStatus.done;
      notifyListeners();
      setErrorMessage("Email de redefinição de senha enviado com sucesso.");
    } catch (e) {
      status = SignInStatus.idle;
      notifyListeners();
      setErrorMessage(e is Exception
          ? e.toString().replaceAll('Exception: ', '')
          : 'Falha ao enviar email de redefinição de senha. Tente novamente mais tarde.');
      throw e;
    }
  }

  void setErrorMessage(String value) async {
    errorMessage = value;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    errorMessage = null;
    notifyListeners();
  }
}