import 'package:whatsapp_clone/barrel/export.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreeen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            const Text(
              ' Welcome to Whatsapp',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height / 11),
            Image.asset(
              'assets/bg.png',
              height: size.height*0.4, //340
              width: size.width*4,  //340
              color: tabColor,
            ),
            SizedBox(height: size.height / 11),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the terms of service',
                style: TextStyle(
                  color: greyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: 'AGREE AND CONTINUE',
                onPressed: ()=> navigateToLoginScreeen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
