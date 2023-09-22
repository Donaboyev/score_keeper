import 'dart:async';

import 'package:flutter/material.dart';

import 'counter_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _redScore = 0;
  int _blueScore = 0;
  int _greenScore = 0;
  int _purpleScore = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F3F3F),
        title: const Text('Score keeper'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 0,
                child: Text(
                  'All Reset',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text(
                  'Red Reset',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text(
                  'Blue Reset',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text(
                  'Green Reset',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text(
                  'Purple reset',
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
            onSelected: (value) {
              switch (value) {
                case 0:
                  setState(() {
                    _purpleScore = 0;
                    _greenScore = 0;
                    _blueScore = 0;
                    _redScore = 0;
                  });
                  break;
                case 1:
                  setState(() {
                    _redScore = 0;
                  });
                  break;
                case 2:
                  setState(() {
                    _blueScore = 0;
                  });
                  break;
                case 3:
                  setState(() {
                    _greenScore = 0;
                  });
                  break;
                case 4:
                  setState(() {
                    _purpleScore = 0;
                  });
                  break;
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: CounterItem(
                  count: _redScore,
                  onAdd: () {
                    setState(() {
                      _redScore++;
                    });
                  },
                  onSubtract: () {
                    if (_redScore <= 0) {
                      return;
                    }
                    setState(() {
                      _redScore--;
                    });
                  },
                  color: Colors.red,
                  onLongTap: () {
                    debugPrint('===> on long tap is working');
                    _timer = Timer.periodic(
                      const Duration(milliseconds: 250),
                      (timer) {
                        setState(() {
                          _redScore++;
                        });
                      },
                    );
                  },
                  onTapCancel: () {
                    _timer?.cancel();
                  },
                ),
              ),
              Expanded(
                child: CounterItem(
                  count: _blueScore,
                  onAdd: () {
                    setState(() {
                      _blueScore++;
                    });
                  },
                  onSubtract: () {
                    if (_blueScore <= 0) {
                      return;
                    }
                    setState(() {
                      _blueScore--;
                    });
                  },
                  color: Colors.blue,
                  onLongTap: () {},
                  onTapCancel: () {},
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CounterItem(
                  count: _greenScore,
                  onAdd: () {
                    setState(() {
                      _greenScore++;
                    });
                  },
                  onSubtract: () {
                    if (_greenScore <= 0) {
                      return;
                    }
                    setState(() {
                      _greenScore--;
                    });
                  },
                  color: Colors.green,
                  onLongTap: () {},
                  onTapCancel: () {},
                ),
              ),
              Expanded(
                child: CounterItem(
                  count: _purpleScore,
                  onAdd: () {
                    setState(() {
                      _purpleScore++;
                    });
                  },
                  onSubtract: () {
                    if (_purpleScore <= 0) {
                      return;
                    }
                    setState(() {
                      _purpleScore--;
                    });
                  },
                  color: Colors.purple,
                  onLongTap: () {},
                  onTapCancel: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
