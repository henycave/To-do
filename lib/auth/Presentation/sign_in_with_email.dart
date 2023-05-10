import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_river/Application/auth_services.dart';
import 'package:to_do_river/auth/Presentation/home.dart';

import '../Domain/person.dart';

class SignInWithEmail extends ConsumerStatefulWidget {
  const SignInWithEmail({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInWithEmail> createState() => _SignInWithEmailState();
}

String email = "";
String password = "";

class _SignInWithEmailState extends ConsumerState<SignInWithEmail> {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authServiceProvider.notifier).isLoading;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "images/auth_svg.svg",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Sign in using your email!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              TextFormField(
                onChanged: (text) {
                  email = text;
                },
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                onChanged: (text) {
                  password = text;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              MaterialButton(
                onPressed: () {
                  Person person = Person(email: email, password: password);
                  ref.read(authServiceProvider.notifier).setIsLoading = true;
                  ref.read(authServiceProvider.notifier).createUser(person);
                  ref.read(authServiceProvider.notifier).setIsLoading = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
                },
                color: const Color(0xff6C63FF),
                elevation: 10,
                child: isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
