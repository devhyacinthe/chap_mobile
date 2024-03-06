import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SalePage extends ConsumerStatefulWidget {
  const SalePage({super.key});

  @override
  ConsumerState<SalePage> createState() => _SalePageState();
}

class _SalePageState extends ConsumerState<SalePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Sales")));
  }
}
