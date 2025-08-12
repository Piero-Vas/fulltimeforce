import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/pokemon/domain/usecases/get_pokemon_by_id.dart';
import 'package:pokemon/pokemon/presentation/bloc/pokemon_event.dart';
import 'package:pokemon/pokemon/presentation/bloc/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonById getPokemonById;

  PokemonBloc({required this.getPokemonById}) : super(const PokemonState()) {
    on<SearchPokemonById>(_onSearchPokemonById);
  }

  Future<void> _onSearchPokemonById(
      SearchPokemonById event, Emitter<PokemonState> emit) async {
    if (event.id.isEmpty) {
      emit(state.copyWith(errorMessage: 'ID no puede estar vacío'));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final pokemon = await getPokemonById.getPokemonById(event.id);
      emit(state.copyWith(pokemon: pokemon, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Pokemon no encontrado', pokemon: null));
    }
  }
}
