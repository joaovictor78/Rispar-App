import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/entities/user_data_entity.dart';

class StartSimulationController {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool isValidEmail = false;
  bool isValidName = false;
  bool buttonEnabled = false;

  void startSimulation() {
    Modular.to.pushNamed("/simulation",
        arguments:
            UserDataEntity(nameTextController.text, emailTextController.text));
  }

  String? validateEmail(String? email) {
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? "");
    isValidEmail = isValid;
    if (isValidEmail && isValidName) buttonEnabled = true;
    if (!isValid && !buttonEnabled) {
      return "Formato de e-mail inválido";
    }
    return null;
  }

  String? validateFullName(String? fullName) {
    isValidName = fullName!.isNotEmpty;
    if (isValidEmail && isValidName) buttonEnabled = true;

    if (!isValidName && !buttonEnabled) {
      return "O nome não pode ser vazio";
    }

    return null;
  }
}
