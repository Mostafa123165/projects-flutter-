abstract class  MainState{}

class NewsInitialState extends MainState {}

class NewBottomNavState extends MainState {}

class NewLoadingState extends MainState {}

class NewsGetBusinessSuccessState extends MainState {}

class NewsGetBusinessErrorState extends MainState {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewLoadingSportsState extends MainState {}

class NewsGetSportsSuccessState extends MainState {}

class NewsGetSportsErrorState extends MainState {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewLoadingScienceState extends MainState {}

class NewsGetScienceSuccessState extends MainState {}

class NewsGetScienceErrorState extends MainState {
  final String error;
  NewsGetScienceErrorState(this.error);
}
class NewLoadingSearshState extends MainState {}

class NewsGetSearshSuccessState extends MainState {}

class NewsGetSearshErrorState extends MainState {
  final String error;
  NewsGetSearshErrorState(this.error);
}
