import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextflix_movie_appliation/blocs/common_bloc.dart';
import 'package:nextflix_movie_appliation/services/api_service.dart';

// BLoC
class DataBloc extends Bloc<DataEvent, DataState> {
  final ApiService apiService;

  DataBloc(this.apiService) : super(DataInitialState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(DataLoadingState());
      try {
        final data = await apiService.fetchData();
        emit(DataLoadedState(data));
      } catch (e) {
        emit(DataErrorState('Failed to load data'));
      }
    });
  }
}
