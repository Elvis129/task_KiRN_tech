import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyPercentageIndicator(),
        ),
      ),
    );
  }
}

class MyPercentageIndicator extends StatefulWidget {
  const MyPercentageIndicator({
    super.key,
  });

  @override
  State<MyPercentageIndicator> createState() => _MyPercentageIndicatorState();
}

class _MyPercentageIndicatorState extends State<MyPercentageIndicator> {
  double value1 = 59;
  double value2 = 25;
  double value3 = 16;

  final TextEditingController textBody = TextEditingController();
  final TextEditingController textMind = TextEditingController();
  final TextEditingController textSpirit = TextEditingController();

  void newValue(dynamic textBody, dynamic textMind, dynamic textSpirit) {
    setState(() {
      value1 = double.parse(textBody.text);
      value2 = double.parse(textMind.text);
      value3 = double.parse(textSpirit.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    int v1 = value1 * 100 ~/ (value1 + value2 + value3);
    int v2 = value2 * 100 ~/ (value1 + value2 + value3);
    int v3 = value3 * 100 ~/ (value1 + value2 + value3);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.black),
          height: 150,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Healyh balance',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Last week',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            newValue(textBody, textMind, textSpirit);
                          },
                          icon: const Icon(
                            Icons.swap_horiz,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
              Container(
                // width: 310,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(50, 50, 50, 50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Body $v1 %',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.purple),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Mind $v2 %',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Spirit $v3 %',
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      // color: Colors.grey,
                      width: 400,
                      height: 10,
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                            ),
                            // color: Colors.green,
                            width: value1 * 400 / (value1 + value2 + value3),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            color: Colors.purple,
                            width: value2 * 400 / (value1 + value2 + value3),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),

                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                            ),
                            // color: Colors.red,
                            width: value3 * 400 / (value1 + value2 + value3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Body', style: TextStyle(fontSize: 20)),
            Text('Mind', style: TextStyle(fontSize: 20)),
            Text('Spirit', style: TextStyle(fontSize: 20)),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 40,
                height: 20,
                child: TextField(
                  controller: textBody,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 40,
                height: 20,
                child: TextField(
                  controller: textMind,
                  keyboardType: TextInputType.number,

                  // maxLength: 20,
                ),
              ),
              SizedBox(
                width: 40,
                height: 20,
                child: TextField(
                  controller: textSpirit,
                  keyboardType: TextInputType.number,

                  // maxLength: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
