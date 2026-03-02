import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/register_page.dart';
import 'features/feed/feed_page.dart';
import 'features/news/news_page.dart';
import 'features/profile/profile_page.dart';
import 'features/radio/radio_page.dart';

class RmeApp extends StatefulWidget {
  const RmeApp({super.key});

  @override
  State<RmeApp> createState() => _RmeAppState();
}

class _RmeAppState extends State<RmeApp> {
  String? _name;
  String? _club;
  String? _city;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RME Comunidad',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: _name == null
          ? RegisterPage(
              onCompleted: (name, club, city) {
                setState(() {
                  _name = name;
                  _club = club;
                  _city = city;
                });
              },
            )
          : HomePage(
              userName: _name!,
              userClub: _club ?? '',
              userCity: _city ?? '',
            ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.userName,
    required this.userClub,
    required this.userCity,
  });

  final String userName;
  final String userClub;
  final String userCity;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const FeedPage(),
      const RadioPage(),
      const NewsPage(),
      ProfilePage(
        name: widget.userName,
        club: widget.userClub,
        city: widget.userCity,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('RME Comunidad'),
      ),
      body: pages[_index],
      floatingActionButton: _index == 0
          ? FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo_outlined),
              label: const Text('Subir'),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Feed'),
          NavigationDestination(icon: Icon(Icons.podcasts_outlined), label: 'Radio'),
          NavigationDestination(icon: Icon(Icons.newspaper_outlined), label: 'Noticias'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }
}
