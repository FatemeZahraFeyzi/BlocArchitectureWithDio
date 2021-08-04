import 'package:dio_example/data/provider/user_api_client.dart';
import 'package:dio_example/data/repository/user_repository.dart';
import 'package:dio_example/logic/bloc/user_bloc.dart';
import 'package:dio_example/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository(apiClient: ApiClient());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(userRepository: userRepository),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
