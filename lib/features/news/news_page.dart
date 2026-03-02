import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Campamento de verano', 'Inscripciones abiertas para jóvenes 13-18.'),
      ('Concierto juvenil', 'Noche de alabanza este sábado 7 PM.'),
      ('Ayuda comunitaria', 'Salida misionera este domingo por la mañana.'),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Noticias', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            Chip(label: Text('Todas')),
            Chip(label: Text('Club')),
            Chip(label: Text('Iglesia')),
            Chip(label: Text('Eventos')),
            Chip(label: Text('Campamentos')),
          ],
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Card(
            child: ListTile(
              leading: const Icon(Icons.article_outlined),
              title: Text(item.$1),
              subtitle: Text(item.$2),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(item.$1),
                    content: Text('${item.$2}\n\nContenido completo de noticia (MVP).'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
