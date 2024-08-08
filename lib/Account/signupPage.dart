import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: SignUpPage()));

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  final GlobalKey _phoneFieldKey = GlobalKey();
  final GlobalKey _idFieldKey = GlobalKey();
  final GlobalKey _passwordFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'PretendardBold',
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '서비스에서 사용할 정보를 알려주세요.',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PretendardMedium',
                                color: Color(0xFF565656),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '전화 번호를 알려주세요.',
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
                                key: _phoneFieldKey,
                                keyboardType: TextInputType.phone,
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
                                  hintText: '010-1234-5678',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'PretendardLight',
                                  ),
                                ),
                                onTap: () => _scrollToField(_phoneFieldKey),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '전화 번호를 입력하세요.';
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
                              '사용할 아이디를 입력하세요.',
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
                                  hintText: 'ex) Lottodiary',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'PretendardLight',
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
                              '사용할 비밀번호를 입력하세요.',
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
                                '가입하기',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'PretendardSemiBold',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Center(
                            child: Text(
                              '©LD',
                              style: TextStyle(
                                color: Color(0xFF808080),
                                fontFamily: 'PretendardLight',
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
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
