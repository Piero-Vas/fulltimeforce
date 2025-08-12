import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/pokemon/data/models/pokemon_models.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonResponse> getPokemon(String id);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<PokemonResponse> getPokemon(String id) async {
    final response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final pokemonResponse =
          PokemonResponse.fromJson(json.decode(response.body));
      return pokemonResponse;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
