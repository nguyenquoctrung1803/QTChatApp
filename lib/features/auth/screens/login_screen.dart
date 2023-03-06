import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/common/widgets/custom_button.dart';
import 'package:flutter_chatapp/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? countrypick;
  void pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        setState(() {
          countrypick = country;
        });
      },
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('QTChatApp will need to verify your phone number'),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: pickCountry,
              child: const Text('Pick Country'),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                if (countrypick != null) Text('+${countrypick!.phoneCode}'),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * 0.65,
                  child: TextField(
                    controller: phoneController,
                    decoration:
                        const InputDecoration(hintText: 'Phone numbers'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.6,
            ),
            SizedBox(
              width: 90,
              child: CustomButton(
                onPressed: () {},
                text: 'NEXT',
              ),
            )
          ],
        ),
      ),
    );
  }
}
