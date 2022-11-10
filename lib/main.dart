import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.black26,
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'start'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String tmpNumber = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _counterArea(),
            _buttonArea(),
          ],
        ),
      ),
    );
  }

  _counterArea() {
    return Flexible(
      flex: 2,
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text('$tmpNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                  )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.white10,
            ),
          ),
        ],
      ),
    );
  }

  _buttonArea() {
    return Flexible(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _calculatorButton(
                'AC',
                Colors.grey,
                Colors.black,
                () {
                  print('clear');
                  clearNumber();
                },
              ),
              _calculatorButton('＋/−', Colors.grey, Colors.black, (() {})),
              _calculatorButton('%', Colors.grey, Colors.black, (() {})),
              _calculatorButton('割', Colors.orange, Colors.white, (() {})),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _calculatorButton(
                '7',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('7'),
              ),
              _calculatorButton(
                '8',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('8'),
              ),
              _calculatorButton(
                '9',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('9'),
              ),
              _calculatorButton('X', Colors.orange, Colors.white, (() {})),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _calculatorButton(
                '4',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('4'),
              ),
              _calculatorButton(
                '5',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('5'),
              ),
              _calculatorButton(
                '6',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('6'),
              ),
              _calculatorButton('−', Colors.orange, Colors.white, () {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _calculatorButton(
                '1',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('1'),
              ),
              _calculatorButton(
                '2',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('2'),
              ),
              _calculatorButton(
                '3',
                Color.fromARGB(255, 67, 62, 62),
                Colors.white,
                () => tapNumber('3'),
              ),
              _calculatorButton('＋', Colors.orange, Colors.white, () {}),
            ],
          ),
          TextButton(
            onPressed: () {
              print('clear');
              clearNumber();
            },
            child: Text('clear'),
          )
        ],
      ),
    );
  }

  _calculatorButton(
    String text,
    Color color,
    Color fontColor,
    VoidCallback onTap,
  ) {
    final diameter = MediaQuery.of(context).size.width * 0.18;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: fontColor),
          ),
        ),
      ),
    );
  }

  void tapNumber(String number) {
    setState(
      () {
        if (tmpNumber == '0') {
          tmpNumber = '';
        }
        tmpNumber += number;
      },
    );
  }

  void clearNumber() {
    setState(() {
      tmpNumber = '0';
    });
  }
}
