import 'package:api/model/cart_model.dart';
import 'package:api/profile.dart';
import 'package:api/service/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  List<Auth>? userAuth = [];
  getPhotos() {
    GetApiServices().getAuthInfo().then((value) {
      setState(() {
        userAuth = value!;
      });
    });
  }

  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider Example"),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Email",
              ),
              controller: EmailController,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Password",
              ),
              controller: PasswordController,
            ),
            TextButton(
              onPressed: () {
                for (var i = 0; i < userAuth!.length; i++) {
                  if (userAuth![i].email == EmailController.text &&
                      userAuth![i].password == PasswordController.text) {
                    print("Email and Password is correct");

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  } else {
                    print("Email and Password is incorrect");
                  }
                }
              },
              child: const Text("Login"),
            ),
          ],
        ));
  }
}
