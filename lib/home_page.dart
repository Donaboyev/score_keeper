import 'package:flutter/material.dart';
import 'package:score_keeper_app/counter_item.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3F3F3F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF212121),
        title: const Text('Score keeper'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 0,
                child: Text('Reset'),
              ),
            ],
            onSelected: (value) {
              if (value == 0) {
                setState(() {
                  _redScore = 0;
                });
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
                ),
              ),
              Expanded(
                child: CounterItem(
                  count: 0,
                  onAdd: () {},
                  onSubtract: () {},
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CounterItem(
                  count: 0,
                  onAdd: () {},
                  onSubtract: () {},
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: CounterItem(
                  count: 0,
                  onAdd: () {},
                  onSubtract: () {},
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
