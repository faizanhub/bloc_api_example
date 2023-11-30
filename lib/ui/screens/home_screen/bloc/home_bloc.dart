import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_api/core/models/post_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<HomeFetchPostEvent>(homeFetchPostEvent);
  }

  FutureOr<void> homeFetchPostEvent(HomeFetchPostEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);

        List<PostModel> postsList = decodedResponse.map((item) => PostModel.fromJson(item)).toList();

        print(decodedResponse);
        emit(HomeLoadedState(postsList: postsList));
      } else {
        emit(HomeErrorState());
      }
    } catch (e) {
      print(e);
      emit(HomeErrorState());
    }
  }
}
