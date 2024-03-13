import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});
  @override
  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Colors.indigo,
      title: const Center(
        child: Text('my Own AppBar',style: TextStyle(
          fontSize: 35,color: Colors.cyan,
        )),
      ),
    );
  }
}