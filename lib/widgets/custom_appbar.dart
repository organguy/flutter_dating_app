
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  CustomAppBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'DISCOVER',
              style: Theme.of(context).textTheme.headline2,
            ),
          )
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.message, color: Theme.of(context).primaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Theme.of(context).primaryColor,))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}