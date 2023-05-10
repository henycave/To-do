import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Application/auth_services.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  String? name;

  @override
  Widget build(BuildContext context) {
    name = ref.read(authServiceProvider).userCredential.user!.email;
    return Scaffold(
      body: Center(
        child: Text(
          name!
        ),
      ),
    );
  }
}
