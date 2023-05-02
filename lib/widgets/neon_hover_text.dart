import 'package:flutter/material.dart';

class NeonHoverText extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double fontSize;
  final FontWeight fontWeight;

  const NeonHoverText({super.key, 
    required this.text,
    required this.onPressed,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
  });

  @override
  NeonHoverTextState createState() => NeonHoverTextState();
}

class NeonHoverTextState extends State<NeonHoverText> {
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
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: _hovering
              ? const Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Color(0xFF00FFFF),
                  ),
                )
              : const Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Colors.transparent,
                  ),
                ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            decoration: TextDecoration.none,
            shadows: _hovering
                ? [
                    const Shadow(
                      blurRadius: 10,
                      color: Color(0xFF00FFFF),
                      offset: Offset(0, 0),
                    ),
                    const Shadow(
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
