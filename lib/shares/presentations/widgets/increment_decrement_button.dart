import 'package:flutter/material.dart';

class IncrementDecrementButton extends StatefulWidget {
  const IncrementDecrementButton({
    super.key,
     this.initialValue,
    required this.onChanged,
    required this.maxValue,
  });
  final Function(int) onChanged;
  final int? initialValue;
  final int maxValue;
  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  int _counter = 1;
  @override
  void initState() {
    if (widget.initialValue != null) {
      _counter = widget.initialValue!;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (_counter > 1) {
              _counter--;
              widget.onChanged(_counter);
              setState(() {});
            }
          },
          icon: Icon(Icons.remove, size: 22),
        ),
        Text(
          '$_counter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            if (_counter>=widget.maxValue){
              return;
            }
            _counter++;
            widget.onChanged(_counter);
            setState(() {});
          },
          icon: Icon(Icons.add, size: 22),
        ),
      ],
    );
  }
}
