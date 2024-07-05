import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final Function onTap;

  const MenuItem({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 213, 213),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 248, 248, 248),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 10.0),
            Text(
              label,
              style: const TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
            ),
          ],
        ),
      ),
    );
  }
}