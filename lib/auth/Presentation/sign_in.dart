import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_river/auth/Presentation/sign_in_with_email.dart';

import 'components/social_buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.07,
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  "images/auth2.svg",
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                'Create an account!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SocialButtons(
                imageSrc: "images/facebook.png",
                title: "Continue with Facebook",
                onPressed: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SocialButtons(
                  title: "Continue with Google",
                  imageSrc: "images/google.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SocialButtons(
                  title: "Continue with Apple",
                  imageSrc: "images/apple.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Text('OR'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SocialButtons(
                  title: "Sign up with Email",
                  imageSrc: "images/mail.jpeg",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInWithEmail()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
