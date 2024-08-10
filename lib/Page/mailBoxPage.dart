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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                children: [
                  Expanded(
                    child: Container(
                      height: 50,  // 흰색 Container와 동일한 높이로 설정
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0), // 흰색 Container와 동일한 둥글기 설정
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5159BC), 
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // 둥글기 8로 설정
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '일괄 보상받기',
                          style: TextStyle(
                            fontFamily: 'PyeongChangPeace',  // 폰트 변경
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,  
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
                                  fontFamily: 'PretendardSemiBold',
                                  fontSize: 16,
                                  color: Colors.black,  
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '상점 구매 보상',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
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
                                fontFamily: 'PyeongChangPeace',  // 폰트 변경
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
          ],
        ),
      ),
    );
  }
}
