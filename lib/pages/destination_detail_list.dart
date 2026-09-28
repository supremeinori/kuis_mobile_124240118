import 'package:flutter/material.dart';

import '../data/destinationModels.dart';

class DestinationDetailList extends StatelessWidget {
  final DestinationModel destination;

  const DestinationDetailList({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar menampilkan judul buku
      appBar: AppBar(
        title: Text(destination.name),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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
                destination.imageUrl,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) =>
                    const Icon(Icons.broken_image, size: 64),
              ),
            ),
            const SizedBox(height: 16),

            // Judul
            Text(
              destination.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            const Divider(height: 28),
            // Informasi Buku
            const SizedBox(height: 4),
            Text('Kategori: ${destination.category}'),
            const SizedBox(height: 4),
            Text('Lokasi: ${destination.location}'),
            const SizedBox(height: 4),
            Text('ticketinfo: ${destination.ticketInfo}'),
            const SizedBox(height: 4),
            Text('Jam Buka: ${destination.openingHours}'),
            const SizedBox(height: 4),
            Text('Attraksi: ${destination.attraction} halaman'),
            const SizedBox(height: 4),
            Text('Info lebih lanjut: ${destination.wikipediaUrl} '),
            const Divider(height: 28),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              destination.description,
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
