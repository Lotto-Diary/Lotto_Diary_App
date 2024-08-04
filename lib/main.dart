import 'package:flutter/material.dart';
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
        appBar: AppBar(
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
                child: IconButton(
                  icon: Icon(Icons.notifications, size: 35, color: Color(0xFF454FAF)),
                  onPressed: () {
                    print('Notification icon tapped');
                  },
                ),
              ),
            ],
          ),
          toolbarHeight: 130,
          backgroundColor: Color(0xFFF3F4F6),
          elevation: 0,
          centerTitle: false,
        ),
        body: _selectedIndex == 0 ? HomePage() : Center(child: Text('Other Pages')),
        bottomNavigationBar: BottomBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<int> numbers = [7, 12, 23, 32, 34, 36, 8];
    int mygrade = 1;
    int thistime = 2024;
    int myday = 3;

    return Container(
      color: Color(0xFFF3F4F6),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView(
        children: [
          Transform.translate(
            offset: Offset(10, 0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$thistime회',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'PretendardSemiBold',
                      color: Color(0xFF454FAF),
                    ),
                  ),
                  TextSpan(
                    text: ' 당첨번호',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'PretendardSemiBold',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: numbers.asMap().entries.map((entry) {
              int index = entry.key;
              int number = entry.value;
              Color circleColor;

              if (index == 0 || index == numbers.length - 1) {
                circleColor = Color(0xFFF2B720);
              } else if (index == 1) {
                circleColor = Color(0xFF4072AC);
              } else if (index == 2) {
                circleColor = Color(0xFFDE4C0E);
              } else {
                circleColor = Color(0xFF9195A4);
              }

              return Padding(
                padding: index == numbers.length - 2
                    ? EdgeInsets.symmetric(horizontal: 2.0)
                    : EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: circleColor,
                      child: Text(
                        '$number',
                        style: TextStyle(color: Colors.white, fontFamily: 'PyeongChangPeaceLight'),
                      ),
                    ),
                    if (index == numbers.length - 2)
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Icon(Icons.add, size: 40, color: Color(0xFF9195A4)),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 28),
          Transform.translate(
            offset: Offset(15, 0),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '축하합니다! ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'PretendardLight',
                      ),
                    ),
                    TextSpan(
                      text: '$mygrade등',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF454FAF),
                        fontFamily: 'PretendardLight',
                      ),
                    ),
                    TextSpan(
                      text: '에 당첨되었어요.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'PretendardLight',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
          Transform.translate(
            offset: Offset(10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '이번 주에 이만큼 작성했어요.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'PretendardSemiBold',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '$myday일',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'PretendardLight',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: index == 6
                        ? Color(0xFFF6BCFC)
                        : index < 3
                        ? Color(0xFF454FAF)
                        : Color(0xFFB4B4B4),
                    child: Text(
                      ['월', '화', '수', '목', '금', '토', '일'][index],
                      style: TextStyle(color: Colors.white, fontFamily: 'PyeongChangPeaceLight'),
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 28),
          Align(
            alignment: Alignment.centerRight,
            child: Transform.translate(
              offset: Offset(20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 2,
                        color: Color(0xFF454FAF),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '일기 씀',
                        style: TextStyle(color: Colors.black, fontFamily: 'PretendardLight'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 2,
                        color: Color(0xFFB4B4B4),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '일기 쓰지 않음',
                        style: TextStyle(color: Colors.black, fontFamily: 'PretendardLight'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 2,
                        color: Color(0xFFF6BCFC),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '오늘',
                        style: TextStyle(color: Colors.black, fontFamily: 'PretendardLight'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 28),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF454FAF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 115, vertical: 15),
              ),
              child: Text(
                '일기 쓰러 가기',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'PretendardSemiBold',
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Center(
            child: Text(
              '©LD',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'PretendardLight',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
