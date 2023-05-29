import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/city_params.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/check_if_city_favorite.dart';
import '../../../domain/usecases/delete_favorite_city.dart';
import '../../../domain/usecases/get_favourite_cities.dart';
import '../../../domain/usecases/save_city.dart';

part 'favourite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final SaveCity saveCity;
  final GetFavoriteCities getFavoriteCities;
  final DeleteFavoriteCity deleteFavoriteCity;
  final CheckIfCityFavorite checkIfCityFavorite;
  FavoriteCubit({
    required this.saveCity,
    required this.getFavoriteCities,
    required this.deleteFavoriteCity,
    required this.checkIfCityFavorite,
  }) : super(FavouriteInitial());

  void loadFavoriteCities() async {
    final Either<AppError, List<String>> response =
        await getFavoriteCities(NoParams());
    emit(response.fold(
        (l) => FavouriteCitiesError(), (r) => FavouriteCitiesLoaded(r)));
  }

  void toggleFavouriteCity(
      {required String cityName, required bool isFavourite}) async {
    if (isFavourite) {
      await deleteFavoriteCity(CityParams(cityName));
    } else {
      await saveCity(CityParams(cityName));
    }
    final response = await checkIfCityFavorite(CityParams(cityName));

    print(response);
    emit(response.fold(
        (l) => FavouriteCitiesError(), (r) => IsFavouriteCity(r)));
  }

  void checkIfFavouriteCity(String cityName) async {
    final response = await checkIfCityFavorite(CityParams(cityName));
    emit(response.fold(
        (l) => FavouriteCitiesError(), (r) => IsFavouriteCity(r)));
  }

  void deleteFavCity(String cityName) async {
    await deleteFavoriteCity(CityParams(cityName));
    loadFavoriteCities();
  }
}
