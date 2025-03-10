import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Multi Fungsi',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi Kuis Mobile IF-B')),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildMenuCard(
            context,
            'Menu Trapesium',
            Icons.architecture,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrapesiumPage()),
            ),
          ),
          _buildMenuCard(
            context,
            'Menu Kubus',
            Icons.view_in_ar,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KubusPage()),
            ),
          ),
          _buildMenuCard(
            context,
            'Menu Penghitung Hari',
            Icons.calendar_today,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HariPage()),
            ),
          ),
          _buildMenuCard(
            context,
            'Menu Data Diri',
            Icons.person,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon), Text(title)],
        ),
      ),
    );
  }
}

// Menu 1: Trapesium
class TrapesiumPage extends StatefulWidget {
  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController _alasAtasController = TextEditingController();
  final TextEditingController _alasBawahController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _sisiMiring1Controller = TextEditingController();
  final TextEditingController _sisiMiring2Controller = TextEditingController();
  double _luas = 0;
  double _keliling = 0;

  void _hitungTrapesium() {
    try {
      double alasAtas = double.parse(_alasAtasController.text);
      double alasBawah = double.parse(_alasBawahController.text);
      double tinggi = double.parse(_tinggiController.text);
      double sisiMiring1 = double.parse(_sisiMiring1Controller.text);
      double sisiMiring2 = double.parse(_sisiMiring2Controller.text);

      setState(() {
        _luas = (alasAtas + alasBawah) * tinggi / 2;
        _keliling = alasAtas + alasBawah + sisiMiring1 + sisiMiring2;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Masukkan nilai yang valid')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menghitung Trapesium')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.architecture),
            TextField(
              controller: _alasAtasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Alas Atas'),
            ),
            TextField(
              controller: _alasBawahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Alas Bawah'),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi'),
            ),
            TextField(
              controller: _sisiMiring1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sisi Miring 1'),
            ),
            TextField(
              controller: _sisiMiring2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sisi Miring 2'),
            ),
            ElevatedButton(onPressed: _hitungTrapesium, child: Text('Hitung')),
            Text('Hasil Perhitungan:'),
            Text('Luas: ${_luas.toStringAsFixed(2)}'),
            Text('Keliling: ${_keliling.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

// Menu 2: Kubus
class KubusPage extends StatefulWidget {
  @override
  _KubusPageState createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController _sisiController = TextEditingController();
  double _volume = 0;
  double _keliling = 0;
  double _luasPermukaan = 0;

  void _hitungKubus() {
    try {
      double sisi = double.parse(_sisiController.text);

      setState(() {
        _volume = pow(sisi, 3).toDouble();
        _keliling = 12 * sisi;
        _luasPermukaan = 6 * pow(sisi, 2).toDouble();
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Masukkan nilai yang valid')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menghitung Kubus')),
      body: Column(
        children: [
          Icon(Icons.view_in_ar),
          TextField(
            controller: _sisiController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Panjang Sisi'),
          ),
          ElevatedButton(onPressed: _hitungKubus, child: Text('Hitung')),
          Text('Hasil Perhitungan:'),
          Text('Volume: ${_volume.toStringAsFixed(2)}'),
          Text('Keliling: ${_keliling.toStringAsFixed(2)}'),
          Text('Luas Permukaan: ${_luasPermukaan.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}

// Menu 3: Penghitung Hari
class HariPage extends StatefulWidget {
  @override
  _HariPageState createState() => _HariPageState();
}

class _HariPageState extends State<HariPage> {
  final TextEditingController _nomorController = TextEditingController();
  String _hasilHari = '';
  final List<String> _daftarHari = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  void _tentukanHari() {
    try {
      int nomor = int.parse(_nomorController.text);
      if (nomor >= 1 && nomor <= 7) {
        setState(() {
          _hasilHari = _daftarHari[nomor - 1];
        });
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Masukkan angka 1-7')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Masukkan nilai yang valid')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Penghitung Hari')),
      body: Column(
        children: [
          Text(
            '1 = Senin, 2 = Selasa, 3 = Rabu, 4 = Kamis, 5 = Jumat, 6 = Sabtu, 7 = Minggu',
          ),
          TextField(
            controller: _nomorController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Masukkan Angka (1-7)'),
          ),
          ElevatedButton(
            onPressed: _tentukanHari,
            child: Text('Tentukan Hari'),
          ),
          if (_hasilHari.isNotEmpty) Text('Hari yang dipilih: $_hasilHari'),
          Text('Daftar Hari:'),
          for (int i = 0; i < _daftarHari.length; i++)
            Text('${i + 1}. ${_daftarHari[i]}'),
        ],
      ),
    );
  }
}

// Menu 4: Data Diri
class ProfilePage extends StatelessWidget {
  final Map<String, String> _profileData = {
    'NIM': '123220088',
    'Nama': 'Jaconiah',
    'Kelas': 'IF-B',
    'Hobby': 'Makan',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Diri')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menambahkan foto profil dari asset
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset('img/image.png', fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _profileData['Nama'] ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String key in _profileData.keys)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Text(
                                '$key:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(child: Text('${_profileData[key]}')),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
