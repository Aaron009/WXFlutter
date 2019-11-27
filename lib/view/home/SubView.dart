import 'package:flutter/material.dart';

class SubView extends StatefulWidget {
  final String title;

  SubView({this.title});

  @override
  _SubViewState createState() => _SubViewState();
}

class _SubViewState extends State<SubView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.title),
    );
  }
}
