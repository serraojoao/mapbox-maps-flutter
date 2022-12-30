import 'package:flutter/material.dart';
import 'package:mapbox_maps_example/page1.dart';
import 'package:mapbox_maps_example/point_annotations.dart';

class BottomNavBar2 extends StatefulWidget {
  const BottomNavBar2({Key? key}) : super(key: key);

  @override
  State<BottomNavBar2> createState() => _BottomNavBar2State();
}

class _BottomNavBar2State extends State<BottomNavBar2> {
  int _currentIndex = 0;
  final Key keyOne = PageStorageKey("IndexTabWidget");
  final PageController controller = PageController();
  final List<Widget> _buildScreens = [Page1(), PointAnnotationPage()];

  void onTabTapped(int index) {
    controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),

        /// Wrapping the tabs with PageView
        controller: controller,
        children: _buildScreens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;

            /// Switching bottom tabs
          });
        },
      ),
      // body: _buildScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTabTapped,
        key: keyOne,
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.map), label: 'Point annotations'
              // title: Container(height: 0.0),
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_rounded), label: 'Point annotations'
              // title: Container(height: 0.0),
              ),
        ],
      ),
    );
  }
}
