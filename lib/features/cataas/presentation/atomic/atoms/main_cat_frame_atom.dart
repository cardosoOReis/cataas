import 'package:flutter/material.dart';

class MainCatFrameAtom extends StatelessWidget {
  final Widget child;

  const MainCatFrameAtom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 6,
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.white,
          ),
        ],
      ),
      child: child,
    );
  }
}
