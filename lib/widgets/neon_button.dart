import 'package:flutter/material.dart';

class NeonButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  NeonButton({required this.label, required this.onPressed});

  @override
  _NeonButtonState createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: Colors.blue.withOpacity(0.4),
      end: Colors.blue.withOpacity(0.1),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hovering = true;
        });
        _controller.forward();
      },
      onExit: (event) {
        setState(() {
          _hovering = false;
        });
        _controller.reverse();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              color: _hovering ? Colors.blue : Colors.transparent,
              boxShadow: _hovering
                  ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.6),
                        blurRadius: 20,
                        spreadRadius: -10,
                        offset: Offset(0, 10),
                      ),
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: -10,
                        offset: Offset(0, 10),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: _hovering ? Colors.black : Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.4),
                      width: 4,
                    ),
                    boxShadow: _hovering
                        ? [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: -10,
                              offset: Offset(0, 10),
                            ),
                          ]
                        : null,
                    color: _animation.value,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
