import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressDetailScreen extends ConsumerStatefulWidget {
  static const String screenName = 'AddressDetailScreen';
  static const String path = '/$screenName';
  const AddressDetailScreen({super.key});

  @override
  ConsumerState createState() => _AddressDetailScreenState();
}

class _AddressDetailScreenState extends ConsumerState<AddressDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
