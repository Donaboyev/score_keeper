import 'package:flutter/material.dart';

class CounterItem extends StatelessWidget {
  final int count;
  final Function() onAdd;
  final Function() onSubtract;
  final Function() onLongTap;
  final Function() onTapCancel;
  final Color color;

  const CounterItem({
    super.key,
    required this.count,
    required this.onAdd,
    required this.onSubtract,
    required this.onLongTap,
    required this.onTapCancel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(width: 40),
        Container(
          alignment: Alignment.center,
          width: 160,
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            '$count',
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 50),
          ),
        ),
        const SizedBox(height: 45),
        GestureDetector(
          onTap: onAdd,
          onLongPress: onLongTap,
          onLongPressEnd: (details) {
            onTapCancel();
          },
          child: Container(
            alignment: Alignment.center,
            width: 160,
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color),
            child: const Text(
              '+',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 50),
            ),
          ),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: onSubtract,
          child: Container(
            alignment: Alignment.center,
            width: 160,
            height: 70,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color),
            child: const Text(
              '-',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 50),
            ),
          ),
        )
      ],
    );
  }
}
