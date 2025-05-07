import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  //Controller untuk input field username dan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Membuat isi konten di tenga
          children: [
            //Menggunakan icon schedule sebagai logo aplikasi sementara, karena belum ada logo
            const Icon(
              Icons.schedule,
              size: 100,
              color: Colors.blueAccent,
            ),

            //Membuat nama aplikasi yang digabungkan dengan icon schedule sebagai logo aplikasi
            Text(
              style: GoogleFonts.bebasNeue(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
              ),
              'AGENDAIN'
            ),

            //Space
            const SizedBox(height: 48),

            //Input field username
            TextField(
              controller: _usernameController, //Controller untuk input
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Pengguna', //Label dari input
              ),
            ),

            //Space
            const SizedBox(height: 12),

            //Input field password
            TextField(
              controller: _passwordController, //Controller untuk input
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Kata Sandi', //Label dari input
              ),
              obscureText: true, //Menyembunyikan password
            ),

            //Space
            const SizedBox(height: 24),

            //Button login yang masih belum ada validasi
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                onPressed: () {
                  //Saat ditekan, button akan mengarahkan ke homepage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  'Masuk'
                ),
              ),
            ),

            //Space
            const SizedBox(height: 12),

            //Button daftar yang masih belum berfungsi
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, //Onpressed masih kosong
                child: const Text(
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold
                  ),
                  'Daftar'
                ),
              ),
            ),    
          ],
        )
      ),
    );
  }
}