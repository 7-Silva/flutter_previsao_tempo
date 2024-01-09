 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:previsao_tempo/widgets/buildInfoItem.dart';

// Função para construir informações de nascer e pôr do sol
Widget buildSunriseSunsetInfo(dynamic weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildInfoItem('assets/11.png', 'Sunrise',
            DateFormat('HH:mm').format(weather.sunrise!)),
        buildInfoItem('assets/12.png', 'Sunset',
            DateFormat('HH:mm').format(weather.sunset!)),
      ],
    );
  }