import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/auth.dart';
import 'package:flutter_hotel_reservation_system/api/providers/hotel_provider.dart';
import 'package:flutter_hotel_reservation_system/api/providers/user_provider.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/screens/login_page.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu_items.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/dashboard.dart';
import '../screens/profile_page.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  // Guest guest = await guestCreate();

  // Guest guest = Guest(
  //     imagePath: 'img/ava.jpg',
  //     firstName: 'Zarshedjon',
  //     lastName: 'Nasimov',
  //     birthDate: '2004-06-29',
  //     phone: '998944709937',
  //     gender: 'Male',
  //     password: 'strong_password',
  //     email: 'zarshed@gmail.com'
  // );

  @override
  Widget build(BuildContext context) {
    final Guest guest = Provider.of<UserProvider>(context).user;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.green, // Set app color to green
            ),
            child: UserAccountsDrawerHeader(
              accountName: Text(
                guest.firstName!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                guest.email!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(guest.imagePath!),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          const DrawerItem(
            itemName: 'Dashboard',
            iconName: Icons.home_rounded,
            routeToPage: DashboardPage(),
          ),
          DrawerItem(
            itemName: 'Profile',
            iconName: Icons.person_rounded,
            routeToPage: ProfilePage(
              guest: guest,
            ),
          ),
          const DrawerItem(
            itemName: 'Reservations',
            iconName: Icons.list_alt_rounded,
            routeToPage: ReservationScreen(),
          ),
          const DrawerItem(
            itemName: 'Help',
            iconName: Icons.help_rounded,
            routeToPage: DashboardPage(),
          ),
          // DrawerItem(
          //   itemName: 'Log Out',
          //   iconName: Icons.exit_to_app_rounded,
          //   routeToPage: LoginPage(),
          // ),
          ListTile(
            title: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.green[500],
                fontWeight: FontWeight.w800,
                fontSize: 16.0,
              ),
            ),
            leading: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.green,
              size: 30.0,
            ),
            onTap: () async {
              await AuthService.logout();
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.remove('userToken');
              Provider.of<UserProvider>(context, listen: false).removeUser();
              Provider.of<HotelProvider>(context, listen: false).clean();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
