import 'package:flutter/material.dart';
import 'Page/home.dart';
import 'Page/myPage.dart';
import 'Page/shop.dart';
import 'Page/myDiary.dart';
import 'Page/mailBoxPage.dart';
import 'Bar/BottomBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('Selected Index: $_selectedIndex');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: _buildAppBar(_selectedIndex),
        body: _buildBody(_selectedIndex),
        bottomNavigationBar: BottomBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  AppBar _buildAppBar(int index) {
    switch (index) {
      case 0:
        return AppBar(
          title: Row(
            children: [
              SizedBox(width: 16),
              Text(
                '홈',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PretendardBold',
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.notifications, size: 35, color: Color(0xFF454FAF)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MailPage()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          toolbarHeight: 130,
          backgroundColor: Color(0xFFF3F4F6),
          elevation: 0,
          centerTitle: false,
        );
      case 1:
        return AppBar(
          title: Row(
            children: [
              SizedBox(width: 16),
              Text(
                '일기',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PretendardBold',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          toolbarHeight: 130,
          backgroundColor: Color(0xFFF3F4F6),
          elevation: 0,
          centerTitle: false,
        );
      case 2:
        return AppBar(
          title: Row(
            children: [
              SizedBox(width: 16),
              Text(
                '상점',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PretendardBold',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          toolbarHeight: 130,
          backgroundColor: Color(0xFFF3F4F6),
          elevation: 0,
          centerTitle: false,
        );
      case 3:
        return AppBar(
          title: Row(
            children: [
              SizedBox(width: 16),
              Text(
                '마이페이지',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'PretendardBold',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          toolbarHeight: 130,
          backgroundColor: Color(0xFFF3F4F6),
          elevation: 0,
          centerTitle: false,
        );
      default:
        return AppBar(
          title: Row(
            children: [
              SizedBox(width: 16),
              Text('페이지를 찾을 수 없습니다.'),
            ],
          ),
          toolbarHeight: 130,
          backgroundColor: Color(0xFFF3F4F6),
          elevation: 0,
          centerTitle: false,
        );
    }
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return MyDiaryPage();
      case 2:
        return ShopPage();
      case 3:
        return MyPage();
      default:
        return Center(child: Text('페이지를 찾을 수 없습니다.'));
    }
  }
}
