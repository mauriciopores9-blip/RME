import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onCompleted});

  final void Function(String name, String club, String city) onCompleted;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _clubCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _clubCtrl.dispose();
    _cityCtrl.dispose();
    super.dispose();
  }

  void _continue() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    widget.onCompleted(_nameCtrl.text.trim(), _clubCtrl.text.trim(), _cityCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Bienvenido a RME Comunidad',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Registro inicial del MVP (correo/Google/teléfono se conectará en Firebase Auth).',
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: const InputDecoration(labelText: 'Nombre'),
                      validator: (value) =>
                          (value == null || value.trim().isEmpty) ? 'Ingresa tu nombre' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _clubCtrl,
                      decoration: const InputDecoration(labelText: 'Club'),
                      validator: (value) =>
                          (value == null || value.trim().isEmpty) ? 'Ingresa tu club' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _cityCtrl,
                      decoration: const InputDecoration(labelText: 'Ciudad'),
                      validator: (value) =>
                          (value == null || value.trim().isEmpty) ? 'Ingresa tu ciudad' : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _continue,
                      child: const Text('Entrar al feed'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
