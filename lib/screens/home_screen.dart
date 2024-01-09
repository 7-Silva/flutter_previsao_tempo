import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:previsao_tempo/bloc/weather_bloc_bloc.dart';
import 'package:previsao_tempo/widgets/getWeatherIcon.dart';
import 'package:previsao_tempo/widgets/saudacao.dart';
import 'package:previsao_tempo/widgets/sunriseSunsetInfo.dart';
import 'package:previsao_tempo/widgets/temperatureInfo.dart';
import 'package:previsao_tempo/widgets/windDegreeInfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Elementos decorativos de fundo
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF673AB7),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Colors.blue),
                ),
              ),
              // Aplicação de desfoque ao fundo
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              // Bloco de construção da interface com base no estado do bloco
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSucess) {
                    return buildWeatherScreen(state);
                  } else {
                    // Se o estado não for um sucesso, exiba um container vazio
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para construir a interface da tela com base no estado do clima
  Widget buildWeatherScreen(WeatherBlocSucess state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Localização
          Text(
            '📍${state.weather.areaName}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 8),
          //Saudação
         getSaudacao(state.weather.date!.hour),
          // Ícone do clima centralizado
          Center(
            child: getWeatherIcon(state.weather.weatherConditionCode!),
          ),
          // Temperatura atual
          Center(
            child: Text(
              '${state.weather.temperature!.celsius!.round()}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Condição climática
          Center(
            child: Text(
              state.weather.weatherMain!.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 5),
          // Data e hora
          Center(
            child: Text(
              DateFormat('EEEE, dd - MMMM HH:mm').format(state.weather.date!),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Informações do nascer e pôr do sol
          buildSunriseSunsetInfo(state.weather),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          // Informações de temperatura máxima e mínima
          buildTemperatureInfo(state.weather),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          buildWindDegreeInfo(state.weather),
        ],
      ),
    );
  }
}
