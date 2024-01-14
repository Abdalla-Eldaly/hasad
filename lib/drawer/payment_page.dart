import 'package:flutter/material.dart';
import 'menu_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Payment Page"),
        leading: const MenuWidget(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.payment,
              size: 50,
            ),
            Text(
              "Payment",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RateUsPage extends StatelessWidget {
  const RateUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("RateUs Page"),
        leading: const MenuWidget(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.star_rate_outlined,
              size: 50,
            ),
            Text(
              "RateUs",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.teal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Text("Help Page"),
        leading: const MenuWidget(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.help,
              size: 50,
            ),
            Text(
              "Help",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.indigo.shade900,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("About Page"),
        leading: const MenuWidget(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.info_outline,
              size: 50,
            ),
            Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Notifications Page"),
        leading: const MenuWidget(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.notification_add,
              size: 50,
            ),
            Text(
              "Notifications",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.pink,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PromosPage extends StatelessWidget {
  const PromosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Promos Page"),
        leading: const MenuWidget(),
      ),
      body: Center(
          child: ClipPath(
        clipper: ClipClipper(),
        child: Stack(
          //alignment: Alignment.topLeft,
          //fit: StackFit.passthrough,
          //clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.orange,
            ),
            CircleAvatar(
              backgroundColor: Colors.indigo.shade700,
              radius: 45,
              child: Icon(
                Icons.people,
                color: Colors.tealAccent.shade400,
                size: 50,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class ClipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width, 0, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
