import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final List<dynamic> numbers = [7, 12, 23, 32, 34, "?", " "];
  final int yyyy = 2024;
  final int mm = 8;
  final int dd = 31;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          '일기쓰기',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'PretendardBold',
            color: Colors.black,
          ),
        ),
        toolbarHeight: 130,
        backgroundColor: Color(0xFFF3F4F6),
        elevation: 0,
        centerTitle: false,
      ),
      body: Container(
        color: Color(0xFFF3F4F6),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: numbers.asMap().entries.map((entry) {
                int index = entry.key;
                dynamic number = entry.value;
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
                          number == " " || number == null ? "" : (number == "?" ? '?' : '$number'),
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
            SizedBox(height: 8),
            Text(
              '"?"에 번호를 입력해주세요.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'PretendardMedium',
                color: Color(0xFF242424),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$yyyy년 $mm월 $dd일 수요일',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'PretendardSemiBold',
                      color: Color(0xFF454FAF),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '제목을 입력해주세요.',
                      hintStyle: TextStyle(
                        fontSize: 22,
                        fontFamily: 'PretendardBold',
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: Color(0xFFDADADA),
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: '내용을 입력해주세요.',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: 'PretendardLight',
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF454FAF),
                  padding: EdgeInsets.symmetric(horizontal: 115, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  '작성 완료',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'PretendardSemiBold',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
