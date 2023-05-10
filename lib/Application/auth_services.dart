import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_river/auth/Data/user_repository.dart';
import 'package:to_do_river/auth/Domain/person.dart';

final authServiceProvider = ChangeNotifierProvider<AuthServiceProvider>((ref) {
  return AuthServiceProvider();
});

class AuthServiceProvider extends ChangeNotifier {
  final UserRepository userRepository = UserRepository();
  UserCredential? _userCredential;
  bool _isLoading = false;

  UserCredential get userCredential => _userCredential!;
  set setUserCredential(UserCredential user){
    _userCredential = user;
    notifyListeners();
  }


  bool get isLoading => _isLoading;
  set setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> signInUserEmail(Person person) async {
    setIsLoading = true;
    final user = await userRepository.signInUserWithEmail(
        email: person.email, password: person.password);
    if (user == null) {
      return;
    } else {
      setUserCredential = user;
    }
    setIsLoading = false;
    notifyListeners();
  }

  Future<void> createUser(Person person) async {
    setIsLoading = true;
    final user = await userRepository.createUser(
        email: person.email, password: person.password);
    if (user == null) {
      return;
    } else {
      _userCredential  = user;
    }
    setIsLoading = false;
    notifyListeners();
  }

  Future<void> logOutUser(Person person) async {
    setIsLoading = true;
    await userRepository.logOutUser();
    setIsLoading = false;
    notifyListeners();
  }
}
