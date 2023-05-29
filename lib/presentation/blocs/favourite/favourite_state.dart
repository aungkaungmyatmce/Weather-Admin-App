part of 'favourite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavouriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavouriteCitiesLoaded extends FavoriteState {
  final List<String> cities;

  FavouriteCitiesLoaded(this.cities);

  @override
  // TODO: implement props
  List<Object?> get props => [cities];
}

class FavouriteCitiesError extends FavoriteState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class IsFavouriteCity extends FavoriteState {
  final bool isCityFavourite;

  IsFavouriteCity(this.isCityFavourite);
  @override
  List<Object?> get props => [isCityFavourite];
}
