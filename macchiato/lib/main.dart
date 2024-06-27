import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/login_screen.dart';
import 'package:macchiato/views/home_screen.dart';
import 'package:macchiato/views/settings_screen.dart';
import 'package:macchiato/views/profile_screen.dart';
import 'package:macchiato/views/orders_screen.dart';
import 'package:macchiato/views/notifications_screen.dart';
import 'package:macchiato/viewmodels/notification_viewmodel.dart';
import 'package:macchiato/notifiers/theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationViewModel()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Macchiato',
            theme: ThemeData(
              brightness: themeNotifier.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
              // Diğer tema ayarları buraya eklenebilir
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const LoginScreen(),
              '/home': (context) => const HomeScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/orders': (context) => const OrdersScreen(),
              '/notifications': (context) => const NotificationsScreen(),
            },
          );
        },
      ),
    );
  }
}
