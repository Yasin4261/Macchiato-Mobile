import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:qr_flutter/qr_flutter.dart';
import '../viewmodels/notification_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
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

  // QR kodunu tam ekran göstermek için dialog
  void _showFullScreenQr(String data) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Dialog dışına tıklanınca kapat
            },
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Çarpı butonuna basınca kapat
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: QrImageView(
                          data: data,
                          version: QrVersions.auto,
                          size: MediaQuery.of(context).size.width * 0.9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Kullanıcıya özel QR kod verisi
    String userId = 'user123'; // Örnek kullanıcı ID'si

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
                backgroundImage: AssetImage(
                    'assets/profile/profile_photo.png'), // Doğru dosya yolu
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _showFullScreenQr(userId),
                  child: Container(
                    color: Colors.white,
                    child: QrImageView(
                      data: userId,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 24,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.circle,
                            size: 24,
                          ),
                          Icon(
                            Icons.circle,
                            size: 24,
                          ),
                          Icon(
                            Icons.circle,
                            size: 24,
                          ),
                          Icon(
                            Icons.circle,
                            size: 24,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 24,
                            color: Colors.red,
                          ),
                          Text('Hediye Kahve : 5',
                              style: TextStyle(fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                ),
                // Diğer içerikler buraya eklenebilir
                const SizedBox(height: 800), // Uzun bir içerik için örnek
                const Text(
                  'Sayfa kaydırılabilir.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
