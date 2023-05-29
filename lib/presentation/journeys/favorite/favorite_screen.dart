import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/constants/route_constants.dart';
import '../../../di/get_it.dart';
import '../../blocs/favourite/favourite_cubit.dart';
import '../detail/weather_detail_argument.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteCubit _favoriteCubit;

  @override
  void initState() {
    super.initState();
    _favoriteCubit = getItInstance<FavoriteCubit>();
    _favoriteCubit.loadFavoriteCities();
  }

  @override
  void dispose() {
    super.dispose();
    _favoriteCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Cities'),
        actions: [],
      ),
      body: BlocProvider.value(
          value: _favoriteCubit,
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavouriteCitiesLoaded) {
                if (state.cities.isEmpty) {
                  return Center(
                    child: Text(
                      'No favorite city',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.cities.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).pushNamed(RouteList.detail,
                          arguments:
                              WeatherDetailArguments(state.cities[index]));
                      _favoriteCubit.loadFavoriteCities();
                    },
                    child: ListTile(
                      title: Text(state.cities[index]),
                      trailing: IconButton(
                          onPressed: () {
                            _favoriteCubit.deleteFavCity(state.cities[index]);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white70,
                          )),
                    ),
                  ),
                );
              }
              return Container();
            },
          )),
    );
  }
}
