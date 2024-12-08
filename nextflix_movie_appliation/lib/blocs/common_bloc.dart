// Event
abstract class DataEvent {}

class LoadDataEvent extends DataEvent {}

// State
abstract class DataState {}

class DataInitialState extends DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  final List<String> data;
  DataLoadedState(this.data);
}

class DataErrorState extends DataState {
  final String message;
  DataErrorState(this.message);
}
