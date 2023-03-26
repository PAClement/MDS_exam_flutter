import '../models/model_trame.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/PreferencesRepository.dart';

class TrameCubit extends Cubit<List<ModelTrame>>{

  final PreferencesRepository preferencesRepository;

  TrameCubit(this.preferencesRepository) : super([]);

  Future<void> loadStopTrames() async{
    emit(await preferencesRepository.loadStopTrames());
  }

  void addStopTrames(ModelTrame modelTrame){
    emit([...state, modelTrame]);
    preferencesRepository.saveStopTrames(state);
  }
}