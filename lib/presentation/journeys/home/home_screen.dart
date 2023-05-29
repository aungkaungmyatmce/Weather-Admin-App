import 'package:flutter/material.dart';
import '../../../common/constants/route_constants.dart';
import '../detail/weather_detail_argument.dart';
import '../drawer/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  String? inputStr;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        drawer: const NavDrawer(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Input a City Name',
                  ),
                  onChanged: (value) {
                    inputStr = value;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Search'),
                  onPressed: () {
                    controller.clear();
                    Navigator.of(context).pushNamed(RouteList.detail,
                        arguments: WeatherDetailArguments(inputStr!));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
