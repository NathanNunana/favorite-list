import 'package:favoritelist/cubit/favorite_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// local imports 
import './screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<FavoriteListCubit>(
        create: (_)=> FavoriteListCubit()..fetchList(),
        child: const HomePage(),
      ),
    );
  }
}
