import 'package:flutter/material.dart';
import 'package:flutter_chatapp/widgets/chat_list.dart';
import 'package:flutter_chatapp/widgets/contact_list.dart';
import 'package:flutter_chatapp/widgets/web_chat_appbar.dart';
import 'package:flutter_chatapp/widgets/web_profile_bar.dart';
import 'package:flutter_chatapp/widgets/web_search_bar.dart';

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
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactsList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgroundImage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                WebChatAppBar(),
                Expanded(child: ChatList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
