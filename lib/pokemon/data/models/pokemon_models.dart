import 'package:pokemon/pokemon/domain/entities/pokemon.dart';

class PokemonResponse {
  PokemonResponse({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  final int? id;
  final String? name;
  final int? baseExperience;
  final int? height;
  final bool? isDefault;
  final int? order;
  final int? weight;
  final Sprites? sprites;
  final List<StatElement> stats;
  final List<Type> types;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      id: json["id"],
      name: json["name"],
      baseExperience: json["base_experience"],
      height: json["height"],
      isDefault: json["is_default"],
      order: json["order"],
      weight: json["weight"],
      sprites:
          json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
      stats: json["stats"] == null
          ? []
          : List<StatElement>.from(
              json["stats"]!.map((x) => StatElement.fromJson(x))),
      types: json["types"] == null
          ? []
          : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "base_experience": baseExperience,
        "height": height,
        "is_default": isDefault,
        "order": order,
        "weight": weight,
        "sprites": sprites?.toJson(),
        "stats": stats.map((x) => x?.toJson()).toList(),
        "types": types.map((x) => x?.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $baseExperience, $height, $isDefault, $order, $weight, $sprites, $stats, $types, ";
  }

  Pokemon toEntity() {
    return Pokemon(
      id: id ?? 0,
      name: name ?? '',
      baseExperience: baseExperience ?? 0,
      height: height ?? 0,
      isDefault: isDefault ?? false,
      order: order ?? 0,
      weight: weight ?? 0,
      frontDefaultSprite: sprites?.frontDefault ?? '',
      type: types.isNotEmpty ? types[0].type?.name ?? '' : '',
      stat: stats.isNotEmpty ? stats[0].stat?.name ?? '' : '',
    );
  }
}

class Sprites {
  Sprites({
    required this.frontDefault,
  });

  final String? frontDefault;

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json["front_default"],
    );
  }

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };

  @override
  String toString() {
    return "$frontDefault, ";
  }
}

class StatElement {
  StatElement({
    required this.stat,
  });

  final TypeClass? stat;

  factory StatElement.fromJson(Map<String, dynamic> json) {
    return StatElement(
      stat: json["stat"] == null ? null : TypeClass.fromJson(json["stat"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "stat": stat?.toJson(),
      };

  @override
  String toString() {
    return "$stat, ";
  }
}

class TypeClass {
  TypeClass({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory TypeClass.fromJson(Map<String, dynamic> json) {
    return TypeClass(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  @override
  String toString() {
    return "$name, $url, ";
  }
}

class Type {
  Type({
    required this.type,
  });

  final TypeClass? type;

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      type: json["type"] == null ? null : TypeClass.fromJson(json["type"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type?.toJson(),
      };

  @override
  String toString() {
    return "$type, ";
  }
}
