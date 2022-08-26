import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_exam/user_model.dart';
import 'package:flutter_exam/api_service.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Userlist'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
