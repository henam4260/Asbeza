import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_grocery_app/views/cart.dart';


import 'package:my_grocery_app/views/homePage.dart';
import 'package:my_grocery_app/views/profile.dart';

import 'bloc/item bloc/item_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Asbeza',
        
        routes: {
          '/':(context) => const homePage(),
          '/profile': (context) => const Profilepage(),
          '/cart': (context) => const Cart(),
        },
      ),
    );
  }
}
