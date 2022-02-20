import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(child: Text('Weather Plus')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                const Text('Dark theme'),
                Switch(
                  value: false,
                  onChanged: (newBool) {
                    //todo:
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                const Text('Celsius Scale'),
                Switch(
                  value: false,
                  onChanged: (newBool) {
                    //todo:
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
