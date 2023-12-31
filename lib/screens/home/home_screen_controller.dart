import 'package:flutter/cupertino.dart';

class HomeScreenController with ChangeNotifier {
  int _counter = 0;
  double total = 0.00;
  int quantidade = 0;
  double taxaEntrega = 7.00;

  late int melancia = 0;
  late int limao = 0;
  late int selectedIndex = 0;
  int get counter => _counter;
  double rating = 0.0;
  String comment = '';
  String formaPag = '';
  String formEnt = '';

  // Lista de bancas
  List<String> bancas = [];

  // Função para adicionar bancas à lista
  void addBanca(String banca) {
    bancas.add(banca);
    notifyListeners();
  }

  // Função para verificar se a lista de bancas não está vazia
  bool hasBancas() {
    return bancas.isNotEmpty;
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void incrementTotal(double valor) {
    total += valor;
    notifyListeners();
  }

  setRating(double value) {
    rating = value;
    notifyListeners();
  }

  setComment(String value) {
    comment = value;
    notifyListeners();
  }

  setFormPag(String value) {
    formaPag = value;
    notifyListeners();
  }

  setFormEnt(String value) {
    formEnt = value;
    notifyListeners();
  }
}
