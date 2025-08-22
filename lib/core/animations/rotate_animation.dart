import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class RotateAnimation extends StatefulWidget {
  final Widget child;
  final Duration? duration;

  const RotateAnimation({super.key, required this.child, this.duration});

  @override
  State<RotateAnimation> createState() => _RotatingPlanetState();
}

class _RotatingPlanetState extends State<RotateAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration ?? k20sec)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _controller, child: widget.child);
  }
}
