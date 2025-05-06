import 'package:bloc/bloc.dart';
import 'package:mostafa/presentation/home/tabs/SettingsTab/repo.dart';

import 'model.dart';

class UserCubit extends Cubit<UserEntity?> {
  final UserRepository userRepository;

  UserCubit({required this.userRepository}) : super(null);

  void fetchUser(String userId) async {
    UserEntity? user = await userRepository.getUser(userId);
    emit(user);
  }

  void saveUser(UserEntity user) async {
    await userRepository.saveUser(user);
    emit(user);
  }
}
