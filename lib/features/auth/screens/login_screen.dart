import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone/barrel/export.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country selectedCountry) {
          setState(() {
            country = selectedCountry;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('WhatsApp will need to verify your phone number.'),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextButton(
                onPressed: pickCountry,
                child: const Text('Pick country'),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Row(
                children: [
                  if (country != null) Text('+ ${country!.phoneCode}'),
                  SizedBox(width: size.width * 0.05),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(hintText: 'phone number'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.6),
              SizedBox(
                width: 90,
                child: CustomButton(
                  text: 'NEXT',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
