import 'package:flutter/material.dart';
import 'package:flutter_application_3/licence_plate.dart';

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
  late LicencePlate plate;

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
                          } else if (!isValidRegion(value[0] + value[1])) {
                            return 'Регион не верен';
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
                      MaterialButton(
                          child: const Text(
                            'Поехали',
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              plate = LicencePlate(
                                region:
                                    getRegion(govAutoNum![0] + govAutoNum![1]),
                                stateCode: govAutoNum![2] + govAutoNum![3],
                                number: govAutoNum![4] +
                                    govAutoNum![5] +
                                    govAutoNum![6],
                                serialNumber: govAutoNum![7] +
                                    govAutoNum![8] +
                                    govAutoNum![9],
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NumPage(plate: plate),
                                  ));
                            }
                          })
                    ],
                  ))
            ],
          ),
        ));
  }
}

class NumPage extends StatelessWidget {
  final LicencePlate plate;
  const NumPage({super.key, required this.plate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plate.getRegionTitle()),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(5)),
          child: Container(
            margin: const EdgeInsets.all(2),
            width: 300,
            height: 61,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  width: 80.79,
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(width: 1.5))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plate.getRegionString(),
                            style: const TextStyle(
                                fontSize: 28,
                                fontFamily: 'Fe-Font',
                                fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              plate.getCountryFlagImageAsset(),
                              height: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              plate.stateCode,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Fe-Font',
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 216.21,
                  height: 61,
                  color: Colors.transparent,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          plate.number,
                          style: const TextStyle(
                              fontSize: 42,
                              fontFamily: 'Fe-Font',
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(plate.serialNumber,
                            style: const TextStyle(
                                fontSize: 34,
                                fontFamily: 'Fe-Font',
                                fontWeight: FontWeight.w100)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
