import 'package:flutter/material.dart';
import 'package:leaveapp/constants/global_variables.dart';
import 'package:leaveapp/screens/home/home.dart';
import 'package:leaveapp/screens/leaveBalance/leave_balance.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    LeaveBalanceScreen(),
    const Center(child: Text('data 2')),
    const Center(child: Text('data 3')),
    const Center(child: Text('data 4')),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              padding: const EdgeInsets.only(
                  top: 8), // Add some top padding for spacing
              child: const ImageIcon(
                AssetImage('assets/icons/home.png'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              padding: const EdgeInsets.only(
                  top: 8), // Add some top padding for spacing
              child: const ImageIcon(
                AssetImage('assets/icons/calendar.png'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              padding: const EdgeInsets.only(
                  bottom: 38), // Add some top padding for spacing
              child: const ImageIcon(
                AssetImage('assets/icons/groups.png'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              padding: const EdgeInsets.only(
                  top: 8), // Add some top padding for spacing
              child: const ImageIcon(
                AssetImage('assets/icons/shelf.png'),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              padding: const EdgeInsets.only(
                  top: 8), // Add some top padding for spacing
              child: const ImageIcon(
                AssetImage('assets/icons/bell.png'),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
