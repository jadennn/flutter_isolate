import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestWidgetState();
  }
}

class TestWidgetState extends State<TestWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
            FlatButton(
                onPressed: () async {
                  _count = countEven(1000000000);
                  _count = await asyncCountEven(1000000000);
                  _count = await compute(countEven, 1000000000);
                  setState(() {});
                },
                child: Text(
                  _count.toString(),
                )),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }

  static int countEven(int num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  static Future<int> asyncCountEven(int num) async{
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }
}
