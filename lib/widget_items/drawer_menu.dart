import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/api/auth.dart';
import 'package:flutter_hotel_reservation_system/api/user.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/screens/login_page.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu_items.dart';
import '../screens/dashboard.dart';
import '../screens/profile_page.dart';


class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

  Future<Guest> guestCreate() async {
    var json = await UserAPI.getUserData();
    Guest guest = Guest.fromJson(json);
    return guest;
  }

  // Guest guest = await guestCreate();

  Guest guest = Guest(
      imagePath: 'img/ava.jpg',
      firstName: 'Zarshedjon',
      lastName: 'Nasimov',
      birthDate: '2004-06-29',
      phone: '998944709937',
      gender: 'Male',
      password: 'strong_password',
      email: 'zarshed@gmail.com'
  );


  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.green, // Set app color to green
            ),
            child: const UserAccountsDrawerHeader(
              accountName: Text(
                'Alan Walker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                'sample@example.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('img/ava.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          DrawerItem(
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
          DrawerItem(
            itemName: 'Reservations',
            iconName: Icons.list_alt_rounded,
            routeToPage: ReservationScreen(),
          ),
          DrawerItem(
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
            leading: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.green,
              size: 30.0,
            ),
            onTap: () async {
              await AuthService.logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
