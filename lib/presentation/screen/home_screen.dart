import 'package:dio_example/logic/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            final userState = context.watch<UserBloc>().state;
            if (userState is UserEmpty) {
              context.read<UserBloc>().add(FetchUser());
            }
            if (userState is UserError) {
              return Center(
                child: Text('failed to fetch user'),
              );
            }
            if (userState is UserLoaded) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network((userState.user.data!.avatar)!),
                  SizedBox(height: 8.0),
                  Text(
                    "${userState.user.data!.firstName} ${userState.user.data!.lastName}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "${userState.user.data!.email}",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
