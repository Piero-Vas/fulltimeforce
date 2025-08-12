import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/pokemon/data/datasources/pokemon_remote_data.dart';
import 'package:pokemon/pokemon/data/repositories/pokemon_repositories_impl.dart';
import 'package:pokemon/pokemon/domain/usecases/get_pokemon_by_id.dart';
import 'package:pokemon/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon/pokemon/presentation/screens/pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final dataSource = PokemonRemoteDataSourceImpl(client: http.Client());
  late final repository = PokemonRespositoryImpl(remoteDataSource: dataSource);
  late final getPokemonById = GetPokemonById(repository);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc(getPokemonById: getPokemonById),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const PokemonPage(),
        },
      ),
    );
  }
}
