import 'package:flutter/material.dart';

class NeonHoverText extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double fontSize;
  final FontWeight fontWeight;

  NeonHoverText({
    required this.text,
    required this.onPressed,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
  });

  @override
  _NeonHoverTextState createState() => _NeonHoverTextState();
}

class _NeonHoverTextState extends State<NeonHoverText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      onHover: (value) {
        setState(() {
          _hovering = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: _hovering
              ? Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Color(0xFF00FFFF),
                  ),
                )
              : Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Colors.transparent,
                  ),
                ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            decoration: TextDecoration.none,
            shadows: _hovering
                ? [
                    Shadow(
                      blurRadius: 10,
                      color: Color(0xFF00FFFF),
                      offset: Offset(0, 0),
                    ),
                    Shadow(
                      blurRadius: 30,
                      color: Color(0xFF00FFFF),
                      offset: Offset(0, 0),
                    ),
                  ]
                : [],
          ),
        ),
      ),
    );
  }
}
