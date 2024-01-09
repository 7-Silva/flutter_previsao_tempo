import 'package:flutter/material.dart';
import 'package:previsao_tempo/widgets/buildInfoItem.dart';

// Função para construir informações de temperatura máxima e mínima
Widget buildTemperatureInfo(weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildInfoItem('assets/13.png', 'Temp max',
            '${weather.tempMax!.celsius!.round()} °C'),
        buildInfoItem('assets/14.png', 'Temp min',
            '${weather.tempMin!.celsius!.round()} °C'),
      ],
    );
  }