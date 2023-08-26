// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:whatsapp_clone/barrel/export.dart';

class CustomButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: tabColor,
        minimumSize: const Size(
          double.infinity,
          50,
        ),
      ),
    );
  }
}
