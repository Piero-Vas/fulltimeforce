import 'package:flutter/material.dart';
import 'package:pokemon/pokemon/domain/entities/pokemon.dart';

class DetailPokemon extends StatelessWidget {
  const DetailPokemon({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          extDetail('Id Pokemon', pokemon.id.toString()),
          extDetail('Pokemon Name', pokemon.name),
          extDetail('Altura', pokemon.height.toString()),
          extDetail('Base Experience', pokemon.baseExperience.toString()),
          extDetail(
              'Stats', pokemon.stats.map((stat) => stat.stat.name).join(', ')),
          extDetail(
              'Type', pokemon.types.map((type) => type.type.name).join(', ')),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(pokemon.frontDefaultSprite != ''
                  ? pokemon.frontDefaultSprite
                  : 'https://via.placeholder.com/150'), // image default
            ),
          )
        ],
      ),
    );
  }
}

Widget extDetail(String parametro, String value) {
  return Row(
    children: [
      Expanded(
        child: RichText(
          text: TextSpan(
            text: '$parametro: ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
