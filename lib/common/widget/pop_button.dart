import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 50,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: const Color.fromARGB(111, 0, 0, 0),
        child: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}
