class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final String frontDefaultSprite;
  final List<Types> types;
  final List<Stats> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.frontDefaultSprite,
    required this.types,
    required this.stats,
  });
}

class Stats {
  final int baseStat;
  final int effort;
  final Stat stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}

class Stat {
  final String name;
  final String url;

  Stat({
    required this.name,
    required this.url,
  });
}

class Types {
  final int slot;
  final TypeEntitie type;

  Types({
    required this.slot,
    required this.type,
  });
}

class TypeEntitie {
  final String name;
  final String url;

  TypeEntitie({
    required this.name,
    required this.url,
  });
}
