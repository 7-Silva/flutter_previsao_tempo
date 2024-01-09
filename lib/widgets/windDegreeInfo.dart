 import 'package:flutter/material.dart';
import 'package:previsao_tempo/widgets/buildInfoItem.dart';

 // Função para construir informações de nascer e pôr do sol
  Widget buildWindDegreeInfo(dynamic weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildInfoItem('assets/15.png', 'Wind speed',
            '${weather.windSpeed!.toString()} km/h',
            scale: 2),
        buildInfoItem(
            'assets/17.png', 'Humidity', '${weather.humidity.toString()} %',
            scale: 2),
      ],
    );
  }