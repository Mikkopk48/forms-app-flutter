import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presention/blocs/cubit_register/register_cubit.dart';
import 'package:forms_app/presention/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
            // errorMessage: username.displayError.toString(),
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
            obscureText: true,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            label: const Text('Guardar'),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
