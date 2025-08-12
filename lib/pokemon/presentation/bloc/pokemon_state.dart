import 'package:equatable/equatable.dart';
import 'package:pokemon/pokemon/domain/entities/pokemon.dart';

class PokemonState extends Equatable {
  final Pokemon? pokemon;
  final bool isLoading;
  final String? errorMessage;

  const PokemonState({this.pokemon, this.isLoading = false, this.errorMessage});

  PokemonState copyWith({
    Pokemon? pokemon,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PokemonState(
      pokemon: pokemon ?? this.pokemon,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [pokemon, isLoading, errorMessage];
}
