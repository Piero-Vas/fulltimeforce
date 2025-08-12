class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final String frontDefaultSprite;
  final String type;
  final String stat;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.frontDefaultSprite,
    required this.type,
    required this.stat,
  });
}

// class Stats {
//   final int baseStat;
//   final int effort;
//   final Stat stat;

//   Stats({
//     required this.baseStat,
//     required this.effort,
//     required this.stat,
//   });
// }

// class Stat {
//   final String name;
//   final String url;

//   Stat({
//     required this.name,
//     required this.url,
//   });
// }

// class Types {
//   final int slot;
//   final Type type;

//   Types({
//     required this.slot,
//     required this.type,
//   });
// }

// class Type {
//   final String name;
//   final String url;

//   Type({
//     required this.name,
//     required this.url,
//   });
// }
