import 'package:flutter/material.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import 'navigation_list_item.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          )
        ],
      ),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  top: Sizes.dimen_6.h,
                  bottom: Sizes.dimen_16.h,
                  left: Sizes.dimen_24.w,
                  right: Sizes.dimen_24.w,
                ),
                child: Text(
                  'Weather App',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                )),
            NavigationListItem(
                title: 'Search',
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                  Navigator.of(context).pushReplacementNamed(RouteList.home);
                }),
            NavigationListItem(
                title: 'Favorite',
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                  Navigator.of(context).pushNamed(RouteList.favorite);
                }),
            NavigationListItem(
                title: 'Notification',
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                  Navigator.of(context).pushNamed(RouteList.noti);
                }),
          ],
        ),
      ),
    );
  }
}
