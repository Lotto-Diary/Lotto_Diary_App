import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F4F6),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  '비밀번호 변경',
                  style: TextStyle(fontWeight: FontWeight.w600), 
                ),
                subtitle: Text('비밀번호를 변경해보세요.'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                },
              ),
              ListTile(
                title: Text(
                  '상점 기록 조회',
                  style: TextStyle(fontWeight: FontWeight.w600), 
                ),
                subtitle: Text('상점에서 산 물건들의 기록을 조회해보세요.'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {

                },
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '보유코인 ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '13',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF454FAF), 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildItem('당이 땡기네', '사탕 기프티콘', '3코인', Icons.cake),
              _buildItem('하루 보호권', '하루는 일기 안써도 돼요', '7코인', Icons.shield),
              _buildItem('문화생활', '문화 상품권 5000원권', '20코인', Icons.card_giftcard),
              _buildItem('문화생활', '문화 상품권 1만원권', '40코인', Icons.card_giftcard),
              _buildItem('올리브영', '올리브영 기프티콘 5000원권', '20코인', Icons.local_mall),
              _buildItem('올리브영', '올리브영 기프티콘 1만원권', '40코인', Icons.local_mall),
              SizedBox(height: 32),
              Center(child: Text('©LD')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String subtitle, String coin, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  coin,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
            },
            child: Text(
              '구매하기',
              style: TextStyle(color: Color(0xFF454FAF)), 
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}
