import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(
        title: 'Гос номер',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String? govAutoNum;
  List<String> splited = [];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(
              top: mediaQuery.size.height * 0.02,
              left: mediaQuery.size.width * 0.03,
              right: mediaQuery.size.width * 0.03,
            ),
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 10,
                        style: TextStyle(
                            fontSize: mediaQuery.size.width * 0.04,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            hintText: 'Введите гос номер',
                            hintStyle: TextStyle(
                                fontSize: mediaQuery.size.width * 0.04,
                                fontWeight: FontWeight.bold)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введи гос номер';
                          } else if (!RegExp(
                                  r'^[0-9]{2}[K]{1}[G]{1}[0-9]{3}[A-Z]{3}')
                              .hasMatch(value)) {
                            return 'Введите корректный номер';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            govAutoNum = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Поехали',
                            style: TextStyle(
                              fontFamily: 'Fe-Font',
                              fontSize: mediaQuery.size.width * 0.05,
                              color: Colors.purpleAccent,
                            ),
                          ),
                          MaterialButton(
                              color: Colors.deepPurple,
                              minWidth: mediaQuery.size.width * 0.15,
                              height: mediaQuery.size.width * 0.07,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  splited = govAutoNum!.split('');
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      'Молодьэс',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ));
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NumPage(govNumList: splited),
                                        ));
                                  });
                                }
                              })
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class NumPage extends StatelessWidget {
  final List<String> govNumList;
  const NumPage({super.key, required this.govNumList});

  @override
  Widget build(BuildContext context) {
    var govNumReg = govNumList[0] + govNumList[1];
    var govReg = govNumList[2] + govNumList[3];
    var govAutoNum = govNumList[4] + govNumList[5] + govNumList[6];
    var govAutoReg = govNumList[7] + govNumList[8] + govNumList[9];
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios_new),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 50.0,
                  minWidth: 50.0,
                  maxHeight: 50.0,
                  maxWidth: 50.0,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    right: BorderSide.none,
                    top: BorderSide(width: 5),
                    bottom: BorderSide(width: 5),
                    left: BorderSide(width: 5),
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text(
                          govNumReg,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Fe-Font',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 3,
                              ),
                              width: 17,
                              height: 12,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/kgflag.jpg'),
                                fit: BoxFit.cover,
                              )),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              govReg,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                fontFamily: 'Fe-Font',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 50.0,
                  minWidth: 50.0,
                  maxHeight: 50.0,
                  maxWidth: 150.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          govAutoNum,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            fontFamily: 'Fe-Font',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          govAutoReg,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            fontFamily: 'Fe-Font',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

/*class NumPage extends StatelessWidget {
  final List<String> govNumList;
  const NumPage({super.key, required this.govNumList});

  @override
  Widget build(BuildContext context) {
    var govNumReg = govNumList[0] + govNumList[1];
    var govReg = govNumList[2] + govNumList[3];
    var govAutoNum = govNumList[4] + govNumList[5] + govNumList[6];
    var govAutoReg = govNumList[7] + govNumList[8] + govNumList[9];
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios_new),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: mediaQuery.size.width * 0.03,
              right: mediaQuery.size.width * 0.03,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(width: mediaQuery.size.width * 0.008),
                      top: BorderSide(width: mediaQuery.size.width * 0.008),
                      bottom: BorderSide(width: mediaQuery.size.width * 0.008),
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              govNumReg,
                              style: TextStyle(
                                  fontFamily: 'Fe-Font',
                                  fontSize: mediaQuery.size.height * 0.029,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: mediaQuery.size.height * 0.017),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: mediaQuery.size.width * 0.04,
                              height: mediaQuery.size.height * 0.015,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/kgflag.jpg'),
                                fit: BoxFit.cover,
                              )),
                            ),
                            SizedBox(
                              width: mediaQuery.size.width * 0.005,
                            ),
                            Container(
                              width: mediaQuery.size.width * 0.04,
                              height: mediaQuery.size.height * 0.015,
                              child: Text(
                                govReg,
                                style: TextStyle(
                                  fontFamily: 'Fe-Font',
                                  fontSize: mediaQuery.size.height * 0.013,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: mediaQuery.size.width * 0.008,
                              color: Colors.black)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: mediaQuery.size.height * 0.02,
                                  left: mediaQuery.size.height * 0.01,
                                  right: mediaQuery.size.height * 0.002),
                              child: Text(
                                govAutoNum,
                                style: TextStyle(
                                    fontFamily: 'Fe-Font',
                                    fontSize: mediaQuery.size.height * 0.048,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: mediaQuery.size.height * 0.007,
                              ),
                              child: Text(
                                govAutoReg,
                                style: TextStyle(
                                    fontFamily: 'Fe-Font',
                                    fontSize: mediaQuery.size.height * 0.039,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]))
                ],
              ),
            ),
          ),
        ));
  }
}
*/
