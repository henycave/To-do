import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  final String imageSrc;
  final Function onPressed;
  final String title;

  const SocialButtons(
      {Key? key,
        required this.title,
        required this.imageSrc,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        onPressed();
      },
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageSrc,
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
