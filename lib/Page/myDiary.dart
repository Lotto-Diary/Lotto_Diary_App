import 'package:flutter/material.dart';

class MyDiaryPage extends StatefulWidget {
  @override
  _MyDiaryPageState createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F4F6),
        elevation: 0,
        toolbarHeight: 0, 
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFF2B720),
                        child: Text('7', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Color(0xFF4072AC),
                        child: Text('12', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Color(0xFFDE4C0E),
                        child: Text('23', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Color(0xFF9195A4),
                        child: Text('32', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Color(0xFF9195A4),
                        child: Text('34', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Color(0xFFB0B0B0),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Color(0xFFF2B720),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '2024.07',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PretendardMedium',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFF3F4F6), 
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          CalendarWidget(),
                          SizedBox(height: 16),
                          DiaryEntry(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SUN', style: TextStyle(color: Colors.grey)),
              Text('MON', style: TextStyle(color: Colors.grey)),
              Text('TUE', style: TextStyle(color: Colors.grey)),
              Text('WED', style: TextStyle(color: Colors.grey)),
              Text('THU', style: TextStyle(color: Colors.grey)),
              Text('FRI', style: TextStyle(color: Colors.grey)),
              Text('SAT', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 8),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 7,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            physics: NeverScrollableScrollPhysics(), 
            children: List.generate(31, (index) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 30 ? Colors.blueGrey[100] : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: index == 30 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class DiaryEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2024년 8월 31일 수요일',
            style: TextStyle(
              fontSize: 14, // Adjusted to 14 for better readability
              color: Color(0xFF454FAF), // Fixed color specification
            ),
          ),
          SizedBox(height: 12),
          Text(
            '로또일기디자인입니다.',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF242424), // Fixed color specification
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '디자인재미있어하지만힘들어하지만재밋어흐베베베베ㅔ베ㅔㅓ라러아렁라어ㅏ어랑ㄹ알아러알아러알알ㅇ라어',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF242424), // Fixed color specification
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: MyDiaryPage(),
    ));
