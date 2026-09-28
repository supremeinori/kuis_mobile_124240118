import 'package:flutter/material.dart';

import '../data/destinationModels.dart';

class DestinationDetailList extends StatefulWidget {
  final DestinationModel destination;

  const DestinationDetailList({super.key, required this.destination});

  @override
  State<DestinationDetailList> createState() => _DestinationDetailListState();
}

class _DestinationDetailListState extends State<DestinationDetailList> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar menampilkan judul buku
      appBar: AppBar(
        title: Text(widget.destination.name),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            // Ganti icon berdasarkan kondisi state
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite
                  ? const Color.fromARGB(255, 244, 54, 187)
                  : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? 'Ditambahkan ke Favorit!'
                        : 'Dihapus dari Favorit!',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      // 2. Body menampilkan seluruh informasi buku
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Buku
            Center(
              child: Image.network(
                widget.destination.imageUrl,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) =>
                    const Icon(Icons.broken_image, size: 64),
              ),
            ),
            const SizedBox(height: 16),

            // Judul
            Text(
              widget.destination.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            const Divider(height: 28),
            // Informasi Buku
            const SizedBox(height: 4),
            Text('Kategori: ${widget.destination.category}'),
            const SizedBox(height: 4),
            Text('Lokasi: ${widget.destination.location}'),
            const SizedBox(height: 4),
            Text('ticketinfo: ${widget.destination.ticketInfo}'),
            const SizedBox(height: 4),
            Text('Jam Buka: ${widget.destination.openingHours}'),
            const SizedBox(height: 4),
            Text('Attraksi: ${widget.destination.attraction} halaman'),
            const SizedBox(height: 4),
            Text('Info lebih lanjut: ${widget.destination.wikipediaUrl} '),
            const Divider(height: 28),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              widget.destination.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(height: 1.5),
            ),

            // Deskripsi / Sinopsis
          ],
        ),
      ),
    );
  }
}
