import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../theme/theme.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  bool isEmailVerified = false; // Replace with actual user data
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'lib/assets/avatar.png'), // Replace with actual avatar image
              ),
              const SizedBox(height: 20),
              // Email
              const Text(
                'ruxlin81@mail.ru', // Replace with actual user email
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Email Verification Button (if not verified)
              if (!isEmailVerified)
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Письмо с подтверждением отправлено!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        DoDidDoneTheme.lightTheme.colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Подтвердите почту'),
                ),
              const SizedBox(height: 20),
              // Logout Button
              ElevatedButton(
                onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Выйти'),
              ),
            ],
          ),
        );
  }
}

