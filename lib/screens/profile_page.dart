import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';

import '../models/guest.dart';
import '../widget_items/drawer_menu.dart';

class ProfilePage extends StatefulWidget {
  final Guest guest;
  static const Color labelThemeColor = Colors.green;
  static Color valueThemeColor = Colors.green.shade400;

  const ProfilePage({super.key, required this.guest});

  static bool isPasswordHidden = true;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Profile Page'),
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(widget.guest.imagePath!),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  const Text(
                    'First Name:',
                    style: TextStyle(
                      color: ProfilePage.labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.guest.firstName!,
                    style: TextStyle(
                      fontSize: 25,
                      color: ProfilePage.valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'Last Name:',
                    style: TextStyle(
                      color: ProfilePage.labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.guest.lastName!,
                    style: TextStyle(
                      fontSize: 25,
                      color: ProfilePage.valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'Email:',
                    style: TextStyle(
                      color: ProfilePage.labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.guest.email!,
                    style: TextStyle(
                      fontSize: 20,
                      color: ProfilePage.valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'Phone:',
                    style: TextStyle(
                      color: ProfilePage.labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.guest.phone!,
                    style: TextStyle(
                      fontSize: 20,
                      color: ProfilePage.valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text(
                    'Password:',
                    style: TextStyle(
                      color: ProfilePage.labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    ProfilePage.isPasswordHidden
                        ? '*' * widget.guest.password!.length
                        : widget.guest.password!,
                    style: TextStyle(
                      fontSize: 20,
                      color: ProfilePage.valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton.filled(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        ProfilePage.isPasswordHidden = !ProfilePage.isPasswordHidden;
                      });
                    },
                    icon: Icon(
                      ProfilePage.isPasswordHidden? Icons.visibility:Icons.visibility_off,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ProfilePage.labelThemeColor,
                  padding: const EdgeInsets.all(15.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReservationScreen()),
                  );
                },
                child: const Text('View Reservation History'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
