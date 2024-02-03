import 'package:flutter/material.dart';
import 'package:google_bottom_nav_bar/pages/Dashboardpage.dart';
import 'package:google_bottom_nav_bar/pages/favoritepage.dart';
import 'package:google_bottom_nav_bar/pages/personpage.dart';
import 'package:google_bottom_nav_bar/pages/searchpage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> pages = [
    const DashboardPage(),
    const FavoritePage(),
    const SearchPage(),
    const PersonPage()
  ];
  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentPage = const DashboardPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: pageStorageBucket,
        child: currentPage,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            //rippleColor: Colors.grey.shade800,
            //hoverColor: Colors.grey.shade700,
            //haptic: true,
            selectedIndex: currentTab,
            onTabChange: (index) {
              setState(() {
                currentTab = index;
              });
            },
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromRGBO(97, 192, 219, 1),
            backgroundColor: Colors.white,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Dashboard',
                onPressed: () {
                  setState(() {
                    currentPage = const DashboardPage();
                    currentTab = 0;
                  });
                },
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorite',
                onPressed: (){
                  setState(() {
                    currentPage = const FavoritePage();
                    currentTab = 1;
                  });
                },
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                onPressed: (){
                  setState(() {
                    currentPage = const SearchPage();
                    currentTab = 2;
                  });
                },
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Person',
                onPressed: (){
                  setState(() {
                    currentPage = const PersonPage();
                    currentTab = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
