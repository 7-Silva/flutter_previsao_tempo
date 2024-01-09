// Esta parte do código pertence ao arquivo 'weather_bloc_bloc.dart'
part of 'weather_bloc_bloc.dart';

// Definição de uma classe selada (sealed class) chamada WeatherBlocState, que estende Equatable
sealed class WeatherBlocState extends Equatable {
  // Construtor da classe abstrata WeatherBlocState
  const WeatherBlocState();
  
  // Implementação do método que retorna a lista de propriedades (necessário para Equatable)
  @override
  List<Object> get props => [];
}

// Definição de uma classe concreta WeatherBlocInitial que estende WeatherBlocState
final class WeatherBlocInitial extends WeatherBlocState {}

// Definição de uma classe concreta WeatherBlocLoading que estende WeatherBlocState
final class WeatherBlocLoading extends WeatherBlocState {}

// Definição de uma classe concreta WeatherBlocFailure que estende WeatherBlocState
final class WeatherBlocFailure extends WeatherBlocState {}

// Definição de uma classe concreta WeatherBlocSucess que estende WeatherBlocState
final class WeatherBlocSucess extends WeatherBlocState {
  // Propriedade que armazena os dados meteorológicos bem-sucedidos
  final Weather weather;

  // Construtor para a classe WeatherBlocSucess que recebe dados meteorológicos como parâmetro
  const WeatherBlocSucess(this.weather);

  // Implementação do método que retorna a lista de propriedades (necessário para Equatable)
  @override
  List<Object> get props => [weather];
}
