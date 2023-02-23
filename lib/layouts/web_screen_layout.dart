import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widgets/contact_list.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ContactsList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgroundImage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
