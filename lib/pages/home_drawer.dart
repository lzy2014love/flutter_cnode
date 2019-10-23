import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('accountName'),
                accountEmail: Text('accountEmail'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars0.githubusercontent.com/u/23011780?v=4&s=120'),
                  ),
                  onTap: () {
                    print(22);
                  },
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://b-gold-cdn.xitu.io/v3/static/img/flutter.851314d.png')),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('设置'),
                onTap: () {
                  print(1111);
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: const Text('关于'),
                onTap: () {
                  print(1111);
                },
              ),
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: const Text('登出'),
                onTap: () {
                  print(1111);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
