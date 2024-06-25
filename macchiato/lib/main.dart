import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/login_screen.dart';
import 'package:macchiato/views/home_screen.dart';
import 'package:macchiato/views/settings_screen.dart';
import 'package:macchiato/views/profile_screen.dart';
import 'package:macchiato/views/orders_screen.dart';
import 'package:macchiato/views/notifications_screen.dart';
import 'package:macchiato/viewmodels/notification_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Macchiato',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
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
        // home: const LoginScreen(),
      ),
    );
  }
}
