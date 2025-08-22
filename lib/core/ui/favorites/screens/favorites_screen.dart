import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  static const String screenName = 'FavoritesScreen';
  static const String path = '/$screenName';
  const FavoritesScreen({super.key});

  @override
  ConsumerState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
