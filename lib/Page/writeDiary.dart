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
          '일기 쓰기',
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
        child: Center(
          child: Text('일기 쓰기 페이지'),
        ),
      ),
    );
  }
}
