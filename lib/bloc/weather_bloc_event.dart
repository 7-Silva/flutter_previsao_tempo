// Esta parte do código pertence ao arquivo 'weather_bloc_bloc.dart'
part of 'weather_bloc_bloc.dart';

// Definição de uma classe selada (sealed class) chamada WeatherBlocEvent, que estende Equatable
sealed class WeatherBlocEvent extends Equatable {
  // Construtor da classe abstrata WeatherBlocEvent
  const WeatherBlocEvent();

  // Implementação do método que retorna a lista de propriedades (necessário para Equatable)
  @override
  List<Object> get props => [];
}

// Definição de uma classe concreta FetchWeather que estende WeatherBlocEvent
class FetchWeather extends WeatherBlocEvent {
  // Propriedade que armazena a posição (dados de localização) para a busca do clima
  final Position position;
  
  // Construtor da classe FetchWeather que recebe a posição como parâmetro
  const FetchWeather(this.position);

  // Implementação do método que retorna a lista de propriedades (necessário para Equatable)
  @override
  List<Object> get props => [position];
}
