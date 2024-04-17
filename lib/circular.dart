import 'package:custom_circular_indicator/indicator.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends StatefulWidget {
  const CircularIndicator({
    super.key,
  });
  @override
  State<CircularIndicator> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CircularIndicator>
    with SingleTickerProviderStateMixin {
  final maxprogess = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('demo'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 4,
          child: CustomPaint(
            painter: CircleProgress(
              icons: [Icons.abc, Icons.abc, Icons.abc, Icons.abc, Icons.abc],
              strokeWidth: 25,
              progressValues: [
                20,
                20,
                20,
                20,
                20
              ], //Here Take value by 100 refrence Means Sum Should be 100
              gap: 20, //Progress Value and Gap Sum Should be 140
              progressColors: [
                Colors.green.shade100,
                Colors.green.shade200,
                Colors.green.shade300,
                Colors.green.shade400,
                Colors.green.shade500
              ],
            ),
            child: Center(
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
