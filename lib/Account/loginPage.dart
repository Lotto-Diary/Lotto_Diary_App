import 'package:flutter/material.dart';
import 'signupPage.dart';  // SignUpPage를 사용하기 위해 필요한 임포트

void main() => runApp(MaterialApp(home: LoginPage()));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  bool _isObscured = true;

  void _scrollToField(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        final offset = box?.localToGlobal(Offset.zero);
        if (offset != null) {
          _scrollController.animateTo(
            _scrollController.offset + offset.dy - 100,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  final GlobalKey _idFieldKey = GlobalKey();
  final GlobalKey _passwordFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  color: Color(0xFFF3F4F6),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // 상단 정렬
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 260), // 상단 여백을 늘려서 폼을 아래로 이동
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          '로그인',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'PretendardBold',
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          '아이디를 입력하세요.',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'PretendardMedium',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            key: _idFieldKey,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF454FAF)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF454FAF)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF454FAF)),
                              ),
                            ),
                            onTap: () => _scrollToField(_idFieldKey),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '아이디를 입력하세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          '비밀번호를 입력하세요.',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'PretendardMedium',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            key: _passwordFieldKey,
                            obscureText: _isObscured,
                            obscuringCharacter: '•',
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF454FAF)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF454FAF)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF454FAF)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xFF454FAF),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(
                              color: _isObscured ? Color(0xFF454FAF) : Colors.black,
                            ),
                            onTap: () => _scrollToField(_passwordFieldKey),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '비밀번호를 입력하세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('처리 중입니다.')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF454FAF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 115, vertical: 15),
                          ),
                          child: Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'PretendardSemiBold',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16), // 로그인 버튼과 텍스트 사이 간격 조정
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(
                            '아직 회원가입 하지 않았다면?',
                            style: TextStyle(
                              color: Color(0xFF565656),
                              fontSize: 16,
                              fontFamily: 'PretendardLight',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      Center(
                        child: Text(
                          '©LD',
                          style: TextStyle(
                            color: Color(0xFF808080),
                            fontFamily: 'PretendardLight',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
