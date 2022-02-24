import 'package:favoritelist/data/favorite_list_repository.dart';
import 'package:favoritelist/data/models/favorite_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListCubit extends Cubit<List<FavoriteList>>{
  final _favoriteListRepository = FavoriteListRepository();
  FavoriteListCubit() : super([]);

  Future<void> fetchList() async{
    emit(await _favoriteListRepository.fetchList());
  }
}