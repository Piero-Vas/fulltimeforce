import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon/pokemon/presentation/bloc/pokemon_event.dart';
import 'package:pokemon/pokemon/presentation/bloc/pokemon_state.dart';
import 'package:pokemon/pokemon/presentation/widgets/card_pokemon.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  // late Future<Pokemon> pokemonFuture;

  final TextEditingController pokemonIdController = TextEditingController();

  Future<void> getPokemon() async {
    final id = pokemonIdController.text.trim().toLowerCase();
    if (id.isNotEmpty) {
      context.read<PokemonBloc>().add(SearchPokemonById(id));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, ingrese un ID o nombre válido')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Pokemon'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: pokemonIdController,
                      decoration: InputDecoration(
                        labelText: 'ID o nombre del Pokemon',
                        border: OutlineInputBorder(),
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(onPressed: getPokemon, child: Text('Buscar'))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.errorMessage != null &&
                    state.errorMessage != '') {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                } else if (state.pokemon != null) {
                  final pokemon = state.pokemon!;
                  return DetailPokemon(pokemon: pokemon);
                } else {
                  return const Center(child: Text('No data found'));
                }
              },
            )
          ],
        ),
      )),
    );
  }
}





//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Buscar Pokemon'),
//       ),
//       body: FutureBuilder<Pokemon>(
//         future: pokemonFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final pokemon = snapshot.data!;
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Pokemon ID: ${pokemon.id}'),
//                   Text('Pokemon Name: ${pokemon.name}'),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.network(pokemon.frontDefaultSprite),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return const Center(child: Text('No data found'));
//           }
//         },
//       ),
//     );
//   }
