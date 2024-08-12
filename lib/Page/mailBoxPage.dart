import 'package:flutter/material.dart';

class MailPage extends StatefulWidget {
  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
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
          '우편함',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'PretendardBold',  // PretendardBold 폰트 사용
            color: Colors.black,
          ),
        ),
        toolbarHeight: 130,
        backgroundColor: Color(0xFFF3F4F6),
        elevation: 0,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          // ListView를 Stack의 첫 번째 자식으로 추가하여 스크롤이 가능하게 함
          Positioned.fill(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '당이 땡기네',
                              style: TextStyle(
                                fontFamily: 'PretendardSemiBold',  // PretendardSemiBold 폰트 사용
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '상점 구매 보상',
                              style: TextStyle(
                                fontFamily: 'PretendardLight',  // PretendardLight 폰트 사용
                                fontSize: 13,
                                color: Color(0xFF979797),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5159BC),
                            padding: EdgeInsets.zero,
                            minimumSize: Size(69, 31),  // 버튼 크기 설정
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),  // 둥글기 설정
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            '받기',
                            style: TextStyle(
                              fontFamily: 'PyeongChangPeaceLight',  // PyeongChangPeaceLight 폰트 사용
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // 일괄 보상받기 버튼을 Stack의 두 번째 자식으로 추가하여 항상 하단에 고정됨
          Positioned(
            bottom: 32,  // 버튼을 화면 하단에서 32dp 위로 이동시킴
            left: 16,
            right: 16,
            child: Container(
              height: 55,  // 버튼 높이를 5픽셀 더 늘림
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), // 둥글기 설정
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5159BC),
                  padding: EdgeInsets.zero,
                  minimumSize: Size(double.infinity, 55),  // 버튼 높이 55으로 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 둥글기 10으로 설정
                  ),
                ),
                onPressed: () {},
                child: Text(
                  '일괄 보상받기',
                  style: TextStyle(
                    fontFamily: 'PyeongChangPeaceLight',  // PyeongChangPeaceLight 폰트 사용
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
