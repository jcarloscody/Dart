import 'package:basic/pages/pageViews/one_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _page = 1;

  pageStatus(int p) {
    setState(() {
      _page = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("jsoue"),
              accountEmail: Text("sldmsl@dsd.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("J"),
              ),
            ),
            ListTile(
              title: Text("login"),
              trailing: Icon(Icons.accessible_forward_sharp),
              onTap: () {
                _pageController.jumpToPage(0);
                pageStatus(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("login"),
              trailing: Icon(Icons.accessible_forward_sharp),
              onTap: () {
                _pageController.jumpToPage(1);
                pageStatus(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("login"),
              trailing: Icon(Icons.accessible_forward_sharp),
              onTap: () {
                _pageController.jumpToPage(2);
                pageStatus(2);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          const OnePage(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: (page) => {
          _pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceOut,
          ),
          pageStatus(page)
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            label: "sharp",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            label: "sharp",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp),
            label: "sharp",
          )
        ],
      ),
    );
  }
}
