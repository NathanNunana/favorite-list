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
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(child: BlocBuilder<FavoriteListCubit, List<FavoriteList>>(
          builder: (context, items) {
        if (items.isEmpty) {
          return buildLoadingPage();
        }
        return buildLoadedListItems(items, context);
      })),
    );
  }

  Widget buildLoadingPage() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListItems(items, context) {
    var size = MediaQuery.of(context).size;
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 5,),
        // const Divider(
        //       color: Colors.black,
        //     ),
        itemCount: items.length,
        itemBuilder: (context, index) => Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: size.height / 5,
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(items[index].avatar),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.black87, Colors.transparent])),
                  ),
                ),
                Positioned.fill(
                  // top: 0,
                  bottom: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              items[index].desc,
                              style: const TextStyle(color: Colors.white54),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ));
  }
}
