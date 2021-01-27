import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final int secondary;
  ActionButton(this.text, this.onTap, {this.secondary = 1});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        color: secondary != 1 ? Colors.grey[100] : Colors.green,
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: getColorText(),
          ),
        ),
      ),
    );
  }

  Color getColorText() {
    switch (secondary) {
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}