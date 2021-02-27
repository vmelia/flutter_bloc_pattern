import 'package:flutter/material.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Page'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1"),
            RaisedButton(
              child: Text('Increment'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Decrement'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
