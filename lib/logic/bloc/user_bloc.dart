import 'package:dio_example/data/model/user.dart';
import 'package:dio_example/data/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserEmpty());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUser) {
      yield UserLoading();
      try {
        final User user = await userRepository.fetchUser(id: "2");
        yield UserLoaded(user: user);
      } catch (_) {
        yield UserError();
      }
    }
  }
}
