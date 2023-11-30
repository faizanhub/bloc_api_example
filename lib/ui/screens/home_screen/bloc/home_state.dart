part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<PostModel> postsList;

  HomeLoadedState({required this.postsList});

}


class HomeErrorState extends HomeState {}
