import 'package:flutter/material.dart';
import 'package:travel_experience/screens/search.dart';
import '../theme.dart';
import 'home.dart';

class HomeTab extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [Home(), Search(), Search()];

    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: CustomTheme.lighterBlue,
            onTap: onTabTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: [
              bottomNavigationBar(
                icon: 'assets/images/home.png',
                activeIcon: 'assets/images/homeA.png',
                semanticLabel: 'This is the home Page',
                label: '',
              ),
              bottomNavigationBar(
                icon: 'assets/images/search.png',
                activeIcon: 'assets/images/searchA.png',
                semanticLabel: 'This is the Search Page ',
                label: '',
              ),
              bottomNavigationBar(
                icon: 'assets/images/user.png',
                activeIcon: 'assets/images/userA.png',
                semanticLabel: 'This is the User account Page',
                label: '',
              ),
            ],
          ),
        ));
  }

  BottomNavigationBarItem bottomNavigationBar({
    @required String icon,
    @required String semanticLabel,
    @required String label,
    String activeIcon,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        height: 20,
        semanticLabel: semanticLabel,
      ),
      activeIcon: Image.asset(
        activeIcon,
        height: 30,
        semanticLabel: semanticLabel,
      ),
      label: label,
    );
  }
}
