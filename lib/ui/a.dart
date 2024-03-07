import 'package:flutter/material.dart';


class CodeBlockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(200),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontFamily: 'monospace', fontSize: 14, color: Colors.black),
          children: [
            TextSpan(text: 'void main() {\n'),
            TextSpan(text: '  print(\'Hello, World!\');\n'),
            TextSpan(text: '}\n'),
          ],
        ),
      ),
    );
  }
}