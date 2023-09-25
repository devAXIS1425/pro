import 'package:flutter/material.dart';


class DescriptionView extends StatelessWidget {
  String? text;
  String? image;
   DescriptionView({super.key,required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 155,
          margin: const EdgeInsets.symmetric(horizontal: 21),
          decoration:  BoxDecoration(
            image: DecorationImage(image: AssetImage(image!),fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.circular(12))
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 20),
          child: Text(text!),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
