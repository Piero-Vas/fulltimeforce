import 'package:pokemon/pokemon/domain/entities/pokemon.dart';

abstract class PokemonRepositorie {
  Future<Pokemon> getPokemonById(String id);
}
