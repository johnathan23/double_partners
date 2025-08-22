import 'dart:math' as math;

import 'package:double_partners/config/theme/app_colors.dart';
import 'package:double_partners/core/ui/users/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteNotFound extends StatefulWidget {
  static const String screenName = 'route-not-found';
  static const String path = '/$screenName';

  const RouteNotFound({super.key});

  @override
  State<RouteNotFound> createState() => _RouteNotFoundState();
}

class _RouteNotFoundState extends State<RouteNotFound> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    const bg = kGrey03;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (context, _) {
            final t = _ctrl.value; // 0..1
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _WavesPainter(
                      phase: t * 2 * math.pi,
                      color1: kBlue.withOpacity(0.25),
                      color2: kBlue02.withOpacity(0.20),
                      color3: kBlue03.withOpacity(0.16),
                    ),
                  ),
                ),
                // Halo radial que "late"
                Positioned.fill(child: Center(child: _PulsingHalo(progress: t))),
                // Contenido principal
                Positioned.fill(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _GradientNumber404(
                              progress: t,
                              textStyle: (theme.displayLarge ?? const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)).copyWith(
                                fontSize: 120,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Ruta no encontrada',
                              textAlign: TextAlign.center,
                              style: (theme.headlineMedium ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)).copyWith(
                                color: kWhite,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'No pudimos encontrar la página que buscas.',
                              textAlign: TextAlign.center,
                              style: (theme.bodyLarge ?? const TextStyle(fontSize: 16)).copyWith(color: kWhite03),
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: [
                                // Botón principal
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kBlue03,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                    elevation: 4,
                                  ),
                                  onPressed: () {
                                    context.pushReplacementNamed(UsersScreen.screenName);
                                  },
                                  icon: const Icon(Icons.home_rounded),
                                  label: const Text('Ir al inicio'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _GradientNumber404 extends StatelessWidget {
  const _GradientNumber404({required this.progress, required this.textStyle});

  final double progress;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final colors = [kBlue03, kBlue, kBlue02, kYellow.withOpacity(0.9), kBlue03];
    final dx = (progress * 240) - 120; // -120..+120

    return ShaderMask(
      shaderCallback: (rect) {
        final gradient = LinearGradient(
          begin: Alignment(-1.0 + dx / rect.width, -0.2),
          end: Alignment(1.0 + dx / rect.width, 0.2),
          colors: colors,
          stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        );
        return gradient.createShader(rect);
      },
      blendMode: BlendMode.srcIn,
      child: Text('404', style: textStyle.copyWith(color: Colors.white)),
    );
  }
}

class _PulsingHalo extends StatelessWidget {
  const _PulsingHalo({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    final scale = 0.92 + math.sin(progress * 2 * math.pi) * 0.08;

    return Transform.scale(
      scale: scale,
      child: Container(
        width: 360,
        height: 360,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // Anillo con degradé y blur sutil
          boxShadow: [BoxShadow(color: kBlue03, blurRadius: 80, spreadRadius: 2)],
          gradient: RadialGradient(colors: [kBlue02, Colors.transparent], stops: [0.0, 1.0]),
        ),
      ),
    );
  }
}

class _WavesPainter extends CustomPainter {
  _WavesPainter({required this.phase, required this.color1, required this.color2, required this.color3});

  final double phase;
  final Color color1, color2, color3;

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = kGrey02;
    canvas.drawRect(Offset.zero & size, bgPaint);

    _drawWave(
      canvas,
      size,
      amplitude: 16,
      wavelength: size.width * 1.2,
      verticalShift: size.height * 0.28,
      color: color1,
      thickness: 3,
      speedFactor: 1.0,
    );
    _drawWave(
      canvas,
      size,
      amplitude: 22,
      wavelength: size.width * 1.1,
      verticalShift: size.height * 0.36,
      color: color2,
      thickness: 2.5,
      speedFactor: 1.6,
    );
    _drawWave(
      canvas,
      size,
      amplitude: 28,
      wavelength: size.width * 0.9,
      verticalShift: size.height * 0.44,
      color: color3,
      thickness: 2,
      speedFactor: 2.2,
    );
  }

  void _drawWave(
    Canvas canvas,
    Size size, {
    required double amplitude,
    required double wavelength,
    required double verticalShift,
    required Color color,
    required double thickness,
    required double speedFactor,
  }) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = thickness;

    final path = Path();
    path.moveTo(0, verticalShift);
    for (double x = 0; x <= size.width; x += 4) {
      final y = verticalShift + math.sin((x / wavelength * 2 * math.pi) + phase * speedFactor) * amplitude;
      path.lineTo(x, y);
    }
    final fill =
        Path.from(path)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();

    canvas.drawPath(path, paint);

    final rect = Offset(0, verticalShift) & Size(size.width, size.height);
    final shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [color.withOpacity(0.14), Colors.transparent],
    ).createShader(rect);
    final fillPaint = Paint()..shader = shader;
    canvas.drawPath(fill, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _WavesPainter oldDelegate) {
    return oldDelegate.phase != phase || oldDelegate.color1 != color1 || oldDelegate.color2 != color2 || oldDelegate.color3 != color3;
  }
}
