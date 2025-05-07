import 'package:flutter/material.dart';
import 'tambah_jadwal.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        //Icon arrow_back, untuk kembali ke halaman sebelumnya
        leading: IconButton(
          //Saat ditekan akan mengarahkan kehalaman sebelumnya
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            color: Colors.white,
            Icons.arrow_back
          )
        ),
        backgroundColor: Colors.blueAccent,
        title: const Text(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          'Daftar Jadwal Kuliah'
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        //Daftar jadwal
        children: const [
          JadwalCard(
            mataKuliah: 'Pemrograman Mobile',
            hari: 'Senin',
            jam: '08:00 - 10:00',
          ),
          JadwalCard(
            mataKuliah: 'Keamanan Siber',
            hari: 'Selasa',
            jam: '10:00 - 12:00',
          ),
          JadwalCard(
            mataKuliah: 'Basis Data',
            hari: 'Rabu',
            jam: '13:00 - 15:00',
          ),
        ],
      ),

      //Button untuk menambah jadwal
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Add',
        //Saat ditekan akan mengarahkan ke halaman Tambah Jadwal
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahJadwalPage()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

//Class untuk menampilkan item jadwal
class JadwalCard extends StatelessWidget {
  final String mataKuliah;
  final String hari;
  final String jam;

  const JadwalCard({
    super.key,
    required this.mataKuliah,
    required this.hari,
    required this.jam,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const Icon(Icons.book, color: Colors.blue),
        title: Text(
          mataKuliah, 
          style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        subtitle: Text('$hari | $jam'),
      ),
    );
  }
}