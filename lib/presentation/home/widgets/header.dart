import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_headingtext(context), _notifications(context)],
      ),
    );
  }

  Widget _headingtext(BuildContext context) {
    return const Text(
      'What are you \ncooking today?',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        letterSpacing: 1,
        height: 1,
      ),
    );
  }

  Widget _notifications(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }
}
