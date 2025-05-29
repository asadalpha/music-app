import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/views/home_page.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0; // Tracks the currently selected tab index

  // List of widgets to display for each tab
  static const List<Widget> _widgetOptions = <Widget>[
    MusicProductionHomePage(),
    Text(
      'News Page',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    Text(
      'TrackBox Page',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    Text(
      'Projects Page',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];

  // Function to handle item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(2.0), // Height of the app bar

        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD91A60), Color(0xFFF06292)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Color(
              0xFFD91A60,
            ), // Darker app bar to match nav bar
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(
          _selectedIndex,
        ), // Display the selected page content
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFF18171C),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                activeIcon: Icon(Icons.article),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.music_note_outlined),
                activeIcon: Icon(Icons.music_note),
                label: 'TrackBox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder_open_outlined),
                activeIcon: Icon(Icons.folder),
                label: 'Projects',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[600],
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
