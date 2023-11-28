import 'package:flutter/material.dart';
import '../model/materiModel.dart';
import 'ViewPDF.dart';

class Materi extends StatefulWidget {
  const Materi({super.key});

  @override
  State<Materi> createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  final List<MateriModel> daftarMateri = [
    MateriModel(
        nama: 'Pengertian Ambphibia', file: 'assets/file/pengertian.pdf'),
    MateriModel(nama: 'Ciri-ciri Ambphibia', file: 'assets/file/ciri.pdf'),
    MateriModel(nama: 'Ordo Ambphibia', file: 'assets/file/ordo.pdf'),
    // Tambahkan lebih banyak materi sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title:  Text(
          "Materi",
          style: TextStyle(color:Colors.grey[700]),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFF6DC),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/bg.jpg'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: daftarMateri.length,
            itemBuilder: (context, index) {
              MateriModel materi = daftarMateri[index];
              return Card(
                child: ListTile(
                  tileColor:Color(0xFFFAEED1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  leading: const Icon(Icons.book, size: 30),
                  title: Text(materi.nama),
                  // Tambahkan aksi atau fungsi yang diinginkan saat ListTile diklik
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewPdf(title: materi.nama, file: materi.file)),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
