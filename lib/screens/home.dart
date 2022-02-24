import 'package:favoritelist/cubit/favorite_list_cubit.dart';
import 'package:favoritelist/data/models/favorite_list.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite List"),
      ),
      body: SafeArea(
          child: BlocBuilder<FavoriteListCubit, List<FavoriteList>>(
             builder: (context, items) {
        if(items.isEmpty){
          return buildLoadingPage();
        }
        return buildLoadedListItems(items);
      })),
    );
  }

  Widget buildLoadingPage() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListItems(items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(items[index].name),
            ));
  }
}
