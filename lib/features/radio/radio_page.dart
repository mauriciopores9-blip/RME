import 'package:flutter/material.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Radio en vivo', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Programa actual: Juventud con Propósito'),
                const SizedBox(height: 6),
                const Text('Estado: EN VIVO 🎙'),
                const SizedBox(height: 14),
                Row(
                  children: [
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.pause),
                      label: const Text('Pausa'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Si el stream no está disponible, mostrar mensaje amigable y botón de reintento.',
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reintentar conexión'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Chat en vivo (MVP visual)'),
                SizedBox(height: 8),
                Text('• Ana: ¡Bendiciones! 🙏'),
                Text('• Luis: Excelente mensaje 🔥'),
                Text('• Sara: Saludos desde Huellas de Shadday ✨'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
