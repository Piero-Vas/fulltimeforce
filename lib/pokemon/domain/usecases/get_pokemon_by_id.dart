import 'package:pokemon/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/pokemon/domain/repositories/pokemon_repositorie.dart';

class GetPokemonById {
  final PokemonRepositorie repository;

  GetPokemonById(this.repository);

  Future<Pokemon> getPokemonById(String id) {
    return repository.getPokemonById(id);
  }
}
