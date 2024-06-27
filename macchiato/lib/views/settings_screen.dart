import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato/notifiers/theme_notifier.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ThemeNotifier>(
              builder: (context, themeNotifier, child) {
                return SwitchListTile(
                  title: const Text('Dark Theme'),
                  value: themeNotifier.isDarkTheme,
                  onChanged: (value) {
                    themeNotifier.toggleTheme();
                  },
                );
              },
            ),
            const SizedBox(height: 16.0),
            const ListTile(
              title: Text('Ayar 1'),
              subtitle: Text('Ayar açıklaması 1'),
            ),
            const ListTile(
              title: Text('Ayar 2'),
              subtitle: Text('Ayar açıklaması 2'),
            ),
            // Diğer ayarlar buraya eklenebilir
          ],
        ),
      ),
    );
  }
}
