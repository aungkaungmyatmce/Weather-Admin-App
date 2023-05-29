import '../core/sqlite/db_helper.dart';

abstract class WeatherLocalDataSource {
  Future<void> saveCity(String cityName);
  Future<List<String>> getCities();
  Future<void> deleteCity(String cityName);
  Future<bool> checkIfCityFavourite(String cityName);
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  @override
  Future<bool> checkIfCityFavourite(String cityName) async {
    final dataList = await DBHelper.getData('cities');
    for (var data in dataList) {
      if (data['name'].toLowerCase().trim() == cityName.toLowerCase().trim()) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<void> deleteCity(String cityName) async {
    return await DBHelper.deleteItem(cityName);
  }

  @override
  Future<List<String>> getCities() async {
    final dataList = await DBHelper.getData('cities');

    List<String> cityList =
        dataList.map<String>((data) => data['name']).toList();
    return cityList;
  }

  @override
  Future<void> saveCity(String cityName) async {
    await DBHelper.insert('cities', {
      'name': cityName,
    });
  }
}
