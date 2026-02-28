import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.name, required this.club, required this.city});

  final String name;
  final String club;
  final String city;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CircleAvatar(
          radius: 44,
          child: Text(name.isNotEmpty ? name[0].toUpperCase() : '?'),
        ),
        const SizedBox(height: 12),
        Center(child: Text(name, style: Theme.of(context).textTheme.headlineSmall)),
        const SizedBox(height: 4),
        Center(child: Text('$club • $city')),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const Icon(Icons.shield_outlined),
            title: const Text('Control parental (opcional)'),
            subtitle: const Text('Próximamente: límites de chat y horarios.'),
            trailing: Switch(value: false, onChanged: (_) {}),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.battery_saver),
            title: const Text('Modo ahorro de batería'),
            subtitle: const Text('Reduce refrescos y calidad de multimedia.'),
            trailing: Switch(value: true, onChanged: (_) {}),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.report_gmailerrorred),
            title: const Text('Reportar contenido de emergencia'),
            subtitle: const Text('Acceso rápido para reportes de seguridad.'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
