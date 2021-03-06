import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String message;
  final Function onTap;
  ErrorText({this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}
