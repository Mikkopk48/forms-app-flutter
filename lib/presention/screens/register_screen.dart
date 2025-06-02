import 'package:flutter/material.dart';
import 'package:forms_app/presention/widgets/widgets.dart';

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
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlutterLogo(size: 100),
            _RegisterForm(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormField(),
          const SizedBox(height: 20),
          const CustomTextFormField(),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {},
            label: const Text('Guardar'),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
