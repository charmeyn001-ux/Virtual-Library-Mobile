import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vlib/Home/Inbox/inbox_page.dart';
import 'package:vlib/Home/Notification/notification_page.dart';
import 'package:vlib/SignIn/sign_in.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _pages => [_homeContent(), InboxPage(), NotificationPage()];

  Widget _homeContent() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 👇 PASTE YOUR ORIGINAL COLUMN CONTENT HERE
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 3, 33, 97),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Virtual Library',
                  style: TextStyle(
                    color: Color.fromARGB(221, 255, 255, 255),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  'Your reading journey starts here',
                  style: TextStyle(
                    color: Color.fromARGB(221, 255, 255, 255),
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 3, 33, 97),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: const Color.fromARGB(136, 0, 0, 0),
                          ),

                          hintText: 'Search for books, authors, genres...',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(135, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/borrowpage');
                        // Handle "Explore" button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 22, 163, 74),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 65,
                          vertical: 60,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_book, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            'Borrow',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/return');
                        // Handle "Explore" button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 234, 88, 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 65,
                          vertical: 60,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment_return, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            'Return',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/mybooks');
                        // Handle "Explore" button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 37, 99, 235),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 60,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.library_books, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'My Borrowed Books',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ), // 👉 you can paste the rest of your UI here later
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 34, 88),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 33, 97),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,

        actions: [
          IconButton(
            padding: EdgeInsets.all(20),
            icon: Icon(
              Icons.person,
              color: const Color.fromARGB(221, 248, 247, 247),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 3, 33, 97)),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: const Color.fromARGB(221, 248, 247, 247),
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text('Policies'),
              onTap: () {
                // Close the drawer
                Navigator.pushNamed(context, '/policies');
                // Handle Home tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log-out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
                // Handle Inbox tap
              },
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        backgroundColor: Color.fromARGB(255, 3, 33, 97),
        selectedItemColor: const Color.fromARGB(221, 248, 247, 247),
        unselectedItemColor: const Color.fromARGB(136, 248, 247, 247),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'inbox'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
        ],
      ),
    );
  }
}
