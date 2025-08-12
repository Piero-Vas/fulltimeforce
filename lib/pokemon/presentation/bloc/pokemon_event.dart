import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class SearchPokemonById extends PokemonEvent {
  final String id;

  SearchPokemonById(this.id);

  @override
  List<Object?> get props => [id];
}
