import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TweenAnimationBuilder(
                tween: IntTween(begin: 0, end: 100),
                duration: Duration(seconds: 2),
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style: TextStyle(fontSize: 50, color: Colors.blue),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Twean<T> {
  T begin;
  T end;
  Twean({required this.begin, required this.end});
}
