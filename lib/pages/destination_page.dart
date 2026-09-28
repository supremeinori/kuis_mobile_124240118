import 'package:flutter/material.dart';

import '../data/destinationModels.dart';
import 'login_page.dart';
import 'destination_detail_list.dart';

class DestinationPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Destinasi'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          // Tombol Logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: destinationList.length,
        itemBuilder: (context, index) {
          final DestinationModel destination = destinationList[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              // Cover Buku
              leading: SizedBox(
                width: 50,
                height: 70,
                child: Image.network(
                  destination.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              // Judul Buku
              title: Text(
                destination.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(' ${destination.location} '),
              // Rating
              trailing: Text(' ${destination.category} '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DestinationDetailList(destination: destination),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
