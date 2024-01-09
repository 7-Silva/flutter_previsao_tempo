import 'package:flutter/material.dart';

// Função para obter o ícone do clima com base no código fornecido.
Widget getWeatherIcon(int code) {
    if (code > 200 && code <= 300) {
      return Image.asset('assets/1.png',
        scale: 2.5,);
    } else if (code >= 300 && code < 400) {
      return Image.asset('assets/2.png',
        scale: 2.5,);
    } else if (code >= 500 && code < 600) {
      return Image.asset('assets/3.png',
        scale: 2.5,);
    } else if (code >= 600 && code < 700) {
      return Image.asset('assets/4.png',
        scale: 2.5,);
    } else if (code >= 700 && code < 800) {
      return Image.asset('assets/5.png',
        scale: 2.5,);
    } else if (code == 800) {
      return Image.asset('assets/6.png',
        scale: 2.5,);
    } else if (code >= 800 && code < 804) {
      return Image.asset(
        'assets/7.png',
        scale: 2.5,
      );
    } else {
      return Image.asset(
        'assets/7.png',
        scale: 2.5,
      );
    }
  }