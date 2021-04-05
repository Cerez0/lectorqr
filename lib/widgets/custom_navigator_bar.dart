import 'package:codigosqr/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.map),
        ),

        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.directions),
        ),
      ]
    );
  }
}