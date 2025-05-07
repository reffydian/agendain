import 'package:flutter/material.dart';

class TambahJadwalPage extends StatefulWidget {
  const TambahJadwalPage({super.key});

  @override
  State<TambahJadwalPage> createState() => _TambahJadwalPageState();
}

class _TambahJadwalPageState extends State<TambahJadwalPage> {
  //Controller untuk input field
  final TextEditingController mataKuliahController = TextEditingController();
  final TextEditingController jamController = TextEditingController();
  final TextEditingController ruangController = TextEditingController();

  String selectedHari = 'Senin'; //Nilai default dropdown hari

  //Daftar pilihan hari
  final List<String> hariList = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
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
          'Tambah Jadwal Kuliah'
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            //Input field Mata Kuliah
            TextField(
              controller: mataKuliahController,
              decoration: const InputDecoration(
                labelText: 'Mata Kuliah',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            //Dropdown pilihan Hari
            DropdownButtonFormField<String>(
              value: selectedHari,
              //Konversi list ke dropdown items
              items: hariList.map((hari) {
                return DropdownMenuItem(
                  value: hari,
                  child: Text(hari), //Teks yang ditampilkan
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedHari = value!; //Update nilai selectedHari
                });
              },
              decoration: const InputDecoration(
                labelText: 'Hari',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            //Input field Jam
            TextField(
              controller: jamController,
              decoration: const InputDecoration(
                labelText: 'Jam',
                hintText: 'Contoh: 08:00 - 10:00',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            //Input field Ruang
            TextField(
              controller: ruangController,
              decoration: const InputDecoration(
                labelText: 'Ruang',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            //Buttton Simpan
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent
                ),
                //Saat ditekan akan mengarahkan kehalaman sebelumnya
                //Belum ada penyimpanan data
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  'Simpan'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}