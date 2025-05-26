import 'package:flutter/material.dart';
import 'package:front_end/modules/home/presenter/view/home_clients_view.dart';
import 'package:front_end/modules/home/presenter/view/home_highlights_view.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;

  final _pages = [const HomeClientsView(), const HomeHighlightsView()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Clients'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Highlights'),
        ],
      ),
    );
  }
}
