// Função para obter o ícone do clima com base no código fornecido.
import 'package:flutter/material.dart';

Widget getSaudacao(int code) {
    if (code >= 6 && code <12 ) {
      return const Text(
            'Good Morning',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          );
    }else if (code >= 12 && code < 18) {
     return const Text(
            'Good Afternoon',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          );
    } else {
     return const Text(
            'Good Night',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          );
    }
  }