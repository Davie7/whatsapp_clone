import 'package:whatsapp_clone/barrel/export.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Center(
        child: CircularProgressIndicator(
          color: tabColor,
        ),
      ),
    );
  }
}
