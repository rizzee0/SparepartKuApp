import 'package:flutter/material.dart';

void main() {
  runApp(const SparepartKuApp());
}

// MaterialApp mengatur tema, halaman awal, dan named routes aplikasi.
class SparepartKuApp extends StatelessWidget {
  const SparepartKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparepartKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
      routes: {
        '/layout': (context) => const LayoutPage(),
        '/katalog': (context) => const KatalogPage(),
        '/kategori': (context) => const KategoriPage(),
        '/form': (context) => const FormBarangPage(),
      },
    );
  }
}

// Widget Drawer dipakai bersama oleh beberapa halaman.
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  void bukaHalaman(BuildContext context, String route) {
    Navigator.pop(context); // Menutup drawer terlebih dahulu.
    if (route == '/') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.phone_android, color: Colors.white, size: 42),
                SizedBox(height: 8),
                Text(
                  'SparepartKu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Katalog sparepart HP',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () => bukaHalaman(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.view_agenda),
            title: const Text('Layout Widget'),
            onTap: () => bukaHalaman(context, '/layout'),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Katalog Sparepart'),
            onTap: () => bukaHalaman(context, '/katalog'),
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Kategori'),
            onTap: () => bukaHalaman(context, '/kategori'),
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Barang'),
            onTap: () => bukaHalaman(context, '/form'),
          ),
        ],
      ),
    );
  }
}

// HALAMAN 1: Beranda. Mendemonstrasikan Scaffold, AppBar, Drawer,
// Center, Container, Text, SizedBox, dan FloatingActionButton.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SparepartKu'), centerTitle: true),
      drawer: const MenuDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.phone_android,
                  size: 75,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang di SparepartKu',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Aplikasi sederhana untuk melihat katalog dan kategori sparepart HP.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/katalog'),
                  icon: const Icon(Icons.list),
                  label: const Text('Lihat Katalog'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/layout'),
                  icon: const Icon(Icons.widgets),
                  label: const Text('Pelajari Layout Widget'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah barang',
        onPressed: () => Navigator.pushNamed(context, '/form'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// HALAMAN 2: Contoh layout dengan Row, Column, Expanded, SizedBox,
// Container, Padding, dan Align.
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contoh Layout Widget')),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Widget Row dan Expanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('Expanded 1'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('Expanded 2'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Widget Column dan Align',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              height: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text('Teks di kanan bawah'),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Widget Center',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Konten berada di tengah',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HALAMAN 3: ListView menampilkan daftar sparepart.
class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  final List<Map<String, String>> barang = const [
    {'nama': 'LCD Android', 'kategori': 'Layar', 'harga': 'Rp150.000'},
    {'nama': 'Baterai HP', 'kategori': 'Daya', 'harga': 'Rp85.000'},
    {'nama': 'Kamera Belakang', 'kategori': 'Kamera', 'harga': 'Rp120.000'},
    {'nama': 'Flexibel Charger', 'kategori': 'Konektor', 'harga': 'Rp45.000'},
    {'nama': 'Speaker Buzzer', 'kategori': 'Audio', 'harga': 'Rp35.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Katalog Sparepart')),
      drawer: const MenuDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: barang.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = barang[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: const Icon(Icons.build, color: Colors.blue),
              ),
              title: Text(
                item['nama']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${item['kategori']} • ${item['harga']}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Kamu memilih ${item['nama']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// HALAMAN 4: GridView menampilkan kategori dalam bentuk kotak.
class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  final List<Map<String, dynamic>> kategori = const [
    {'nama': 'LCD', 'ikon': Icons.smartphone},
    {'nama': 'Baterai', 'ikon': Icons.battery_charging_full},
    {'nama': 'Kamera', 'ikon': Icons.camera_alt},
    {'nama': 'Audio', 'ikon': Icons.volume_up},
    {'nama': 'Konektor', 'ikon': Icons.cable},
    {'nama': 'Aksesori', 'ikon': Icons.headphones},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kategori Sparepart')),
      drawer: const MenuDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: kategori.map((item) {
          return Card(
            color: Colors.blue.shade50,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Kategori ${item['nama']} dipilih')),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['ikon'] as IconData, size: 42, color: Colors.blue),
                  const SizedBox(height: 10),
                  Text(
                    item['nama'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// HALAMAN 5: Form menggunakan TextField dan ElevatedButton.
// Data belum disimpan ke database; tombol menampilkan notifikasi.
class FormBarangPage extends StatefulWidget {
  const FormBarangPage({super.key});

  @override
  State<FormBarangPage> createState() => _FormBarangPageState();
}

class _FormBarangPageState extends State<FormBarangPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  void simpanBarang() {
    final nama = namaController.text.trim();
    final harga = hargaController.text.trim();

    if (nama.isEmpty || harga.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan harga harus diisi.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Contoh input berhasil: $nama, harga $harga')),
    );
    namaController.clear();
    hargaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Tambah Barang')),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.inventory_2, size: 72, color: Colors.blue),
            const SizedBox(height: 12),
            const Text(
              'Masukkan Informasi Barang',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama sparepart',
                hintText: 'Contoh: LCD Android',
                prefixIcon: Icon(Icons.phone_android),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Harga barang',
                hintText: 'Contoh: 150000',
                prefixIcon: Icon(Icons.payments),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: simpanBarang,
              icon: const Icon(Icons.save),
              label: const Text('Coba Simpan'),
            ),
            const SizedBox(height: 12),
            const Text(
              'Catatan: data pada contoh ini belum disimpan ke database.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
