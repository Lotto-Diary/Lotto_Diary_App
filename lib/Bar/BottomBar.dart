import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  BottomBar({required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + 34,
      child: BottomNavigationBar(
        backgroundColor: Color(0xffF3F4F6),
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color(0xff454FAF),
        selectedLabelStyle: TextStyle(
          fontFamily: 'PretendardLight',
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'PretendardLight',
          fontSize: 14,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '일기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}
