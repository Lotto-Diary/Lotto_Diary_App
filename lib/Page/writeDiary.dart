import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    backgroundColor: Colors.grey[400],
                    child: Text('?', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Color(0xFFF2B720),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
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
                      '2024년 8월 31일 수요일',
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
                  onPressed: () {
                  },
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
      ),
    );
  }
}
