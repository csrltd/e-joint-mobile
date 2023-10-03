import 'package:e_joint_mobile/screens/account.dart';
import 'package:e_joint_mobile/screens/dish_list.dart';
import 'package:e_joint_mobile/screens/home.dart';
import 'package:e_joint_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomNavIcon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            iconData: (Icons.home),
            iconColor: Colors.white,
            label: 'Home',
          ),
          CustomNavIcon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MenuPage();
              }));
            },
            iconData: Icons.menu_book_rounded,
            iconColor: Colors.white,
            label: "Menu",
          ),
          CustomNavIcon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const DishListPage();
              }));
            },
            iconData: Icons.restaurant_menu_rounded,
            iconColor: Colors.white,
            label: "Cart",
          ),
          CustomNavIcon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AccountPage();
                }));
              },
              iconData: Icons.account_box_rounded,
              iconColor: Colors.white,
              label: 'Account')
        ],
      ),
    );
  }
}

class CustomNavIcon extends StatelessWidget {
  const CustomNavIcon({
    required this.iconData,
    required this.iconColor,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final Color iconColor;
  final IconData iconData;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              size: 32,
            ),
            color: iconColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}
