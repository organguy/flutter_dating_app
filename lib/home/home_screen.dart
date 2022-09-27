import 'package:dating_app/models/user_model.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          UserCard(user: User.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 60
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  color: Theme.of(context).colorScheme.secondary,
                  hasGradient: false,
                  icon: Icons.clear_rounded,
                ),
                const ChoiceButton(
                  width: 80,
                  height: 80,
                  size: 30,
                  color: Colors.white,
                  hasGradient: true,
                  icon: Icons.favorite,
                ),
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  color: Theme.of(context).primaryColor,
                  hasGradient: false,
                  icon: Icons.watch_later,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {

  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;

  const ChoiceButton({
    Key? key,
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required this.hasGradient,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,

        gradient: hasGradient ? LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.secondary,
            ]
        ) : const LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(3, 3)
          )
        ]
      ),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}




