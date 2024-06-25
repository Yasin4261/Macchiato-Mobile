import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato/viewmodels/notification_viewmodel.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Uygulama başladığında bildirimleri server'dan alma
    getNotificationsFromServer();
  }

  // Server'dan bildirimleri alma yöntemi
  void getNotificationsFromServer() async {
    // Simulated server call
    await Future.delayed(const Duration(seconds: 2));

    // Server'dan gelen bildirim sayısı örneği
    int newNotifications = 10;

    // Modeli güncelle
    Provider.of<NotificationViewModel>(context, listen: false)
        .setNotificationCount(newNotifications);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          Consumer<NotificationViewModel>(
            builder: (context, notificationModel, child) {
              return notificationModel.notificationCount > 0
                  ? badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 0, end: 3),
                      badgeContent: Text(
                        notificationModel.notificationCount > 99
                            ? '99+'
                            : '${notificationModel.notificationCount}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          // Bildirimler sayfasına yönlendirme kodu buraya
                          Navigator.pushNamed(context, '/notifications');
                        },
                      ),
                    )
                  : IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        // Bildirimler sayfasına yönlendirme kodu buraya
                        Navigator.pushNamed(context, '/notifications');
                      },
                    );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Kullanıcı Adı'),
              accountEmail: Text('kullanici@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_photo.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                // Ayarlar sayfasına yönlendirme kodu buraya
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                // Profil sayfasına yönlendirme kodu buraya
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Siparişler'),
              onTap: () {
                // Siparişler sayfasına yönlendirme kodu buraya
                Navigator.pushNamed(context, '/orders');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
