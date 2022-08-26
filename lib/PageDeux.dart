import 'dart:async';
import 'package:flutter/material.dart';

class PageDeux extends StatefulWidget {
  const PageDeux({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PageDeuxState();
}

class _PageDeuxState extends State<PageDeux> {
  final bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageDeux'),
      ),
      // body: _isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     : UserList(user: _user),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
