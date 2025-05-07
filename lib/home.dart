import 'package:flutter/material.dart';
import 'jadwal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0; //Index untuk bottom navigation bar

  //Daftar halaman yang ditampilkan di bottom navigation
  final List<Widget> pages = [
    const HomeTab(), //Tab Home
    const ExploreTab(), //Tab Explore
    const ProfileTab(), //Tab Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex], //Menampilkan halaman sesuai index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index), //Handler saat item di-tap
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        //Daftar item bottom navigation
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

//Tab Home
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          'Home'
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          //Widget SearchBar
          SearchBar(
            controller: SearchController(), //Controller untuk search
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0), //Padding horizontal
            ),
            leading: Icon(Icons.search),
            hintText: 'Search...',
            elevation: WidgetStatePropertyAll(0), //Mematikan shadow
            //Styling border
            side: WidgetStateProperty.resolveWith((states) {
              final isFocused = states.contains(WidgetState.focused);
              return BorderSide(
                color: isFocused ? Colors.blue : Colors.white, //Warna border jika fokus/ditekan biru, jika tidak putih
                width: isFocused ? 3.0 : 1.0, //Lebar border jika fokus/ditekan 3, jika tidak 1
              );
            }),
          ),
          //Space
          const SizedBox(height: 20),

          //Card Jadwal Kuliah
          Card(
            elevation: 3, //Shadow
            child: InkWell( //Memberi efek saat di-tap
              borderRadius: BorderRadius.circular(12), //Radius border agar terlihat curvy
              splashColor: Colors.blue[100], //Warna splash effect
              onTap: () { //Handler saat di-tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JadwalPage()),
                );
              },
              child: ListTile(
                leading: const Icon(Icons.calendar_month),
                title: Text('Jadwal Kuliah'),
                subtitle: const Text('Lihat semua jadwal'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          ),

          //Card To-do masih belum aktif/dummy hanya untuk preview dengan bentuk
          //sama seperti Card Jadwal Kuliah.
          Card(
            elevation: 3,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              splashColor: Colors.blue[100],
              onTap: () {}, //Handler kosong
              child: ListTile(
                leading: const Icon(Icons.checklist),
                title: const Text('To-do'),
                subtitle: const Text('Work in Progress'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          ),
        ],
      ),
      
      //Button tambah jadwal
      floatingActionButton: FloatingActionButton(
        //Membuat bentuk button menjadi bulat
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Add',
        onPressed: () {}, //Handler kosong
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

//Tab Explore masih kosong/belum ada konten
class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          'Explore'
          ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WIP hehe',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

//Tab Profile masih kosong/belum ada konten
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key}); // Constructor dengan key opsional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // Warna background appbar
        title: const Text( // Judul appbar
          style: TextStyle(
            fontWeight: FontWeight.bold, // Teks tebal
            color: Colors.white // Warna teks putih
          ),
          'Profile'
          ),
        centerTitle: true, // Judul di tengah
      ),
      body: const Center( // Konten di tengah
        child: Text(
          'WIP hehe', // Teks placeholder
          style: TextStyle(fontSize: 16), // Ukuran font
        ),
      ),
    );
  }
}