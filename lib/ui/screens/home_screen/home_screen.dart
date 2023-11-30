import 'package:bloc_api/ui/screens/home_screen/bloc/home_bloc.dart';
import 'package:bloc_api/ui/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeFetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeLoadedState:
              var successState = state as HomeLoadedState;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: successState.postsList.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          var item = successState.postsList[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: item);
                            },
                            child: PostCard(
                              // image: item.image ?? '',
                              // imageText: "${item.price} AED",
                              // rating: item.rating?.rate?.toDouble() ?? 0.0,
                              productName: item.title ?? '',
                              productDesc: item.body ?? '',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            case HomeErrorState:
              return const Center(
                child: Text("Error occurred"),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
