import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = List.generate(10, (i) => i + 1);

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Text('Historias', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => CircleAvatar(
              radius: 36,
              child: Text('S${i + 1}'),
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemCount: 8,
          ),
        ),
        const SizedBox(height: 16),
        ...posts.map(
          (post) => Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Publicación #$post', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    alignment: Alignment.center,
                    child: const Text('Foto / Video'),
                  ),
                  const SizedBox(height: 8),
                  const Text('Contenido positivo para la comunidad 🙏✨'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: const [
                      Chip(label: Text('Like ❤️')),
                      Chip(label: Text('Comentar 💬')),
                      Chip(label: Text('Compartir ↗')),
                      Chip(label: Text('Reaccionar 🔥')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
