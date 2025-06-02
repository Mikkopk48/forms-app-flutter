import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const FlutterLogo(size: 100),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
              onPressed: () {},
              label: const Text('Guardar'),
              icon: const Icon(Icons.save),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
