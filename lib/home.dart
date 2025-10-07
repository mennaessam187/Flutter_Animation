import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController redc;
  late AnimationController greenc;
  late Animation<AlignmentGeometry> alignmentred;
  late Animation<AlignmentGeometry> alignmentGreen;

  @override
  void initState() {
    super.initState();

    redc = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(seconds: 2),
    );
    greenc = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(seconds: 2),
    );
    alignmentred = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(redc);
    alignmentGreen = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(greenc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Course")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  AlignTransition(
                    alignment: alignmentred,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  AlignTransition(
                    alignment: alignmentGreen,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    redc.forward();
                    greenc.forward();
                  },
                  child: Text("forward"),
                ),
                ElevatedButton(
                  onPressed: () {
                    redc.reverse();
                    greenc.reverse();
                  },
                  child: Text("reverse"),
                ),
                ElevatedButton(
                  onPressed: () {
                    redc.stop();
                    greenc.stop();
                  },
                  child: Text("stop"),
                ),
                ElevatedButton(
                  onPressed: () {
                    redc.repeat(reverse: true);
                    greenc.repeat(reverse: true);
                  },
                  child: Text("repeat reverse=true"),
                ),
                ElevatedButton(
                  onPressed: () {
                    redc.repeat(reverse: false);
                    greenc.repeat(reverse: false);
                  },
                  child: Text("repeat reverse=false"),
                ),
                ElevatedButton(
                  onPressed: () {
                    redc.reset();
                    greenc.reset();
                  },
                  child: Text("reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
