import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendain', //Judul aplikasi
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(), //Membuat font menjadi universal
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: LoginPage(), //Membuat LoginPage sebagai halaman awal
    );
  }
}