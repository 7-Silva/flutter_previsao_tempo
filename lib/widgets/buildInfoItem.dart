import 'package:flutter/material.dart';

// Função auxiliar para construir itens de informação
  Widget buildInfoItem(String iconPath, String label, String value,
      {double scale = 8.0}) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          scale: scale,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }