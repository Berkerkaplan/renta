import 'package:flutter/material.dart';

class CustomBottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomBottomButton({
    super.key, required this.onTap, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: ,
      margin: EdgeInsets.all(30),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(text),
        onPressed: onTap,
          //Navigator.push(context, MaterialPageRoute(builder: (_) => onTap));
          // Form kaydetme ve sayfa geçişi mantığı buraya eklenecek.

      ),
    );
  }
}