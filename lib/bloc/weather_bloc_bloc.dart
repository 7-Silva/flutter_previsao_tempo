// Importação das bibliotecas necessárias
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:previsao_tempo/data/my_data.dart';
import 'package:weather/weather.dart';

// Partes do bloco de eventos e estados (separadas para facilitar a organização do código)
part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

// Definição da classe WeatherBlocBloc, que estende Bloc e usa os eventos e estados definidos
class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  // Construtor da classe WeatherBlocBloc, que define o estado inicial do bloco
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    // Configuração do manipulador de eventos 'FetchWeather'
    on<FetchWeather>((event, emit) async {
      // Emitir o estado de carregamento enquanto aguarda os dados
      emit(WeatherBlocLoading());
      try {
        // Criação de uma instância da fábrica de clima com uma chave de API e idioma definido como português do Brasil
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.PORTUGUESE_BRAZIL);

        // Obtenção dos dados meteorológicos atuais com base na localização fornecida
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        
        // Impressão dos dados meteorológicos no console (útil para depuração)
        print(weather);

        // Emitir o estado de sucesso com os dados meteorológicos obtidos
        emit(WeatherBlocSucess(weather));
      } catch (e) {
        // Se ocorrer uma exceção, emitir o estado de falha
        emit(WeatherBlocFailure());
      }
    });
  }
}
