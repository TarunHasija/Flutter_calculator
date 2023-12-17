import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Buttonn extends StatefulWidget {
  final String text;
  final Color btncolor;
  Color tcolor = Colors.white;
  final Function(String) onPressed;

  Buttonn({
    Key? key,
    required this.text,
    required this.btncolor,
    required this.tcolor,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<Buttonn> createState() => _ButtonState();
}

class _ButtonState extends State<Buttonn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: ElevatedButton(
          onPressed: () => widget.onPressed(widget.text),
          style: ElevatedButton.styleFrom(
            primary: widget.btncolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(22),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.tcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
