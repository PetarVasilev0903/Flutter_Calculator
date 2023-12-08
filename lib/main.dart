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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<String> number = [];
  String opperand = '';
  bool opIsDone = false;
  double num1 = 0;
  double num2 = 0;
  double result = 0;

  void _add() {
    if ((number.contains('-') &&
            number.contains('+') &&
            number.contains('*') &&
            number.contains('/')) &&
        number.length == 1) {
      number.clear();
    } else if (num1 == 0 && number.isNotEmpty) {
      num1 = int.parse(number.join()) as double;
      number.clear();
    }
    opperand = '+';
  }

  void _subtract() {
    if ((number.contains('+') &&
            number.contains('*') &&
            number.contains('/')) &&
        number.length == 1) {
      number.clear();
    } else if (num1 == 0 && number.isNotEmpty) {
      num1 = int.parse(number.join()) as double;
      number.clear();
    }
    opperand = '-';
  }

  void _multiplication() {
    if ((number.contains('-') &&
            number.contains('+') &&
            number.contains('*') &&
            number.contains('/')) &&
        number.length == 1) {
      number.clear();
    } else if (num1 == 0 && number.isNotEmpty) {
      num1 = int.parse(number.join()) as double;
      number.clear();
    }
    opperand = '*';
  }

  void _division() {
    if ((number.contains('-') &&
            number.contains('+') &&
            number.contains('*') &&
            number.contains('/')) &&
        number.length == 1) {
      number.clear();
    } else if (num1 == 0 && number.isNotEmpty) {
      num1 = int.parse(number.join()) as double;
      number.clear();
    }
    opperand = '/';
  }

  void _equals() {
    num2 = int.parse(number.join()) as double;

    if (opperand == '+') {
      result = num1 + num2;
    } else if (opperand == '-') {
      result = num1 - num2;
    } else if (opperand == '/') {
      result = num1 / num2;
    } else if (opperand == '*') {
      result = num1 * num2;
    }

    opperand = '';
    number.clear();
    num1 = result;
    num2 = 0;
    opIsDone = true;
    setState(() {
      result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('1');
                    });
                  },
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('2');
                    });
                  },
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('3');
                    });
                  },
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (number.isNotEmpty) {
                        _add();
                      } else if (opIsDone) {
                        _add();
                      }
                    });
                  },
                  child: const Text('+'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('4');
                    });
                  },
                  child: const Text('4'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('5');
                    });
                  },
                  child: const Text('5'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('6');
                    });
                  },
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (number.isNotEmpty) {
                        _subtract();
                      } else if (opIsDone) {
                        _subtract();
                      } else {
                        number.add('-');
                      }
                    });
                  },
                  child: const Text('-'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('7');
                    });
                  },
                  child: const Text('7'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('8');
                    });
                  },
                  child: const Text('8'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number.add('9');
                    });
                  },
                  child: const Text('9'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (number.isNotEmpty) {
                        _multiplication();
                      } else if (opIsDone) {
                        _multiplication();
                      }
                    });
                  },
                  child: const Text('*'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (number.isNotEmpty) {
                      number.removeLast();
                      setState(() {});
                    }
                  },
                  onLongPress: () {
                    num1 = 0;
                    num2 = 0;
                    number.clear();
                    opperand = '';
                    opIsDone = false;
                    setState(() {});
                  },
                  child: const Text('C'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (number.isNotEmpty) {
                      setState(() {
                        number.add('0');
                      });
                    }
                  },
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (number.isNotEmpty) {
                        _equals();
                      }
                    });
                  },
                  child: const Text('='),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (number.isNotEmpty) {
                        _division();
                      } else if (opIsDone) {
                        _division();
                      }
                    });
                  },
                  child: const Text('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'RESULT:',
                ),
                Text(
                  (_display()),
                ),
                Text(
                  (opperand),
                ),
                Text(
                  (_displayResult()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _displayResult() {
    return number.join('').toString();
  }

  String _display() {
    if (num1 == 0 && !opIsDone) {
      return '';
    }
    return num1.toString();
  }
}
