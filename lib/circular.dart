// import 'package:custom_circular_indicator/indicator.dart';
import 'package:custom_circular_indicator/indicator.dart';
import 'package:flutter/material.dart';

class CircularIndicatorWithMultiplevalue extends StatefulWidget {
  const CircularIndicatorWithMultiplevalue({
    super.key,
    
  });
  @override
  State<CircularIndicatorWithMultiplevalue> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CircularIndicatorWithMultiplevalue>
    with SingleTickerProviderStateMixin {
  final maxprogess = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('demo'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 4,
          child: CustomPaint(
            painter: CircleProgress(
              icons: [
                Icons.abc,
                Icons.abc,
                Icons.abc,
                Icons.abc,
                Icons.abc,
                Icons.abc
              ],
              strokeWidth: 25,
              progressValues: [
                50,
                16.5,
                16.5,
                16.5
              ], //Here Take value by 100 refrence Means Sum Should be 100
              gap: 21, //Progress Value and Gap Sum Should be 140
              progressColors: [
                Colors.indigo.shade200,
                Colors.indigo.shade300,
                Colors.indigo.shade400,
                Colors.indigo.shade500,
              ], iconColor: Colors.black, iconsize: 24,
            ),
            child: const Center(
              child: Text(
                'Content',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
