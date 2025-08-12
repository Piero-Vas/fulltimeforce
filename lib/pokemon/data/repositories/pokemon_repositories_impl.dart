import 'package:pokemon/pokemon/data/datasources/pokemon_remote_data.dart';
import 'package:pokemon/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/pokemon/domain/repositories/pokemon_repositorie.dart';

class PokemonRespositoryImpl implements PokemonRepositorie {
  PokemonRespositoryImpl({required this.remoteDataSource});

  final PokemonRemoteDataSource remoteDataSource;

  @override
  Future<Pokemon> getPokemonById(String id) async {
    final pokemonResponse = await remoteDataSource.getPokemon(id);
    return pokemonResponse.toEntity();
  }
}
