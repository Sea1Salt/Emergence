import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyAppaa());
}

class MyAppaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SideBar(),
    );
  }
}

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Side Menu Example'),
      ),
      endDrawer: Drawer(
        // Use endDrawer instead of drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 press
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 press
              },
            ),
            // Add more list tiles for additional menu items
          ],
        ),
      ),
      body: Center(
        child: Text('Main Content'),
      ),
    );
  }
}

void sidebar(BuildContext context) {
    endDrawer: Drawer(
    // Use endDrawer instead of drawer
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Handle item 1 press
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Handle item 2 press
          },
        ),
        // Add more list tiles for additional menu items
      ],
    ),
  );
}
