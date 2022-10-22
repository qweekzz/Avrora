import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counterBloc extends Bloc<counterEvents, int> {
  counterBloc() : super(0) {
    //функция on<наш класс> (опять наш класс event, Emitter<state из Bloc> (там логика))
    on<counterIncEvent>((counterIncEvent event, Emitter<int> emit) {
      emit(state + 1);
    });
  }
}

//для обеденние калссов, так как в bloc можно передать только 1 класс <>
abstract class counterEvents {}

class counterIncEvent extends counterEvents {}
