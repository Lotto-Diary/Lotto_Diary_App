import 'package:flutter/material.dart';

class MyDiaryPage extends StatefulWidget {
  @override
  _MyDiaryPageState createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
  final List<dynamic> numbers = [7, 12, 23, 32, 34, " ", " "];
  final int yyyy = 2024;
  final int dd = 7;

  int? _selectedDate; // 초기값을 null로 설정

  void _selectDate(int date) {
    setState(() {
      // 현재 선택된 날짜가 동일하면 선택 해제, 아니면 새로운 날짜 선택
      _selectedDate = _selectedDate == date ? null : date;
    });
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            number == "?" || number == " " ? "" : '$number',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PyeongChangPeaceLight',
                            ),
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
              SizedBox(height: 16),
              Text(
                '$yyyy.$dd',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'PretendardLight',
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
                      CalendarWidget(
                        selectedDate: _selectedDate,
                        onDateSelected: _selectDate,
                      ),
                      SizedBox(height: 16),
                      // DiaryEntry가 선택된 날짜가 없거나 선택된 날짜가 아닌 경우에는 표시하지 않음
                      if (_selectedDate != null)
                        DiaryEntry(date: _selectedDate!),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final int? selectedDate;
  final void Function(int) onDateSelected;

  CalendarWidget({required this.selectedDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SUN', style: TextStyle(color: Colors.grey, fontFamily: 'PretendardMedium')),
              Text('MON', style: TextStyle(color: Colors.grey, fontFamily: 'PretendardMedium')),
              Text('TUE', style: TextStyle(color: Colors.grey, fontFamily: 'PretendardMedium')),
              Text('WED', style: TextStyle(color: Colors.grey, fontFamily: 'PretendardMedium')),
              Text('THU', style: TextStyle(color: Colors.grey, fontFamily: 'PretendardMedium')),
              Text('FRI', style: TextStyle(color: Colors.grey, fontFamily: 'PretendardMedium')),
              Text('SAT', style: TextStyle(color: Colors.grey, fontFamily: 'PretendardMedium')),
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
              int date = index + 1;
              bool isSelected = date == selectedDate;
              return GestureDetector(
                onTap: () => onDateSelected(date),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Color(0xFFD0D4E8) : Colors.transparent,
                    border: isSelected ? Border.all(color: Color(0xFF454FAF), width: 2) : null,
                  ),
                  child: Center(
                    child: Text(
                      '$date',
                      style: TextStyle(
                        color: isSelected ? Color(0xFF454FAF) : Color(0xFF898989),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PyeongChangPeaceLight',
                      ),
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
  final int date;

  DiaryEntry({required this.date});

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
            '2024년 8월 ${date}일 ${_getDayOfWeek(date)}요일',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF454FAF),
              fontFamily: 'PretendardSemiBold',
            ),
          ),
          SizedBox(height: 12),
          Text(
            '로또일기디자인입니다.',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF242424),
              fontFamily: 'PretendardBold',
            ),
          ),
          // 실선 추가
          Divider(
            color: Colors.grey,
            thickness: 1,
            height: 28,
          ),
          Text(
            '디자인재미있어하지만힘들어하지만재밋어흐베베베베ㅔ베ㅔㅓ라러아렁라어ㅏ어랑ㄹ알아러알아러알알ㅇ라어',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF242424),
              fontFamily: 'PretendardMedium',
            ),
          ),
        ],
      ),
    );
  }

  String _getDayOfWeek(int date) {
    DateTime dateTime = DateTime(2024, 8, date);
    return ['일', '월', '화', '수', '목', '금', '토'][dateTime.weekday % 7];
  }
}

void main() => runApp(MaterialApp(
  home: MyDiaryPage(),
));
