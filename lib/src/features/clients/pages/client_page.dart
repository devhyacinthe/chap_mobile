import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientPage extends ConsumerStatefulWidget {
  const ClientPage({super.key});

  @override
  ConsumerState<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends ConsumerState<ClientPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Clients")));
  }
}
