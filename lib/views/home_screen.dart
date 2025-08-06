import 'package:flutter/material.dart';
import 'package:flutter_authproject/views/add_plant_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Bitkiler artık Map şeklinde tutulacak
  List<Map<String, dynamic>> plants = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Bitkilerim",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/plant_banner.png',
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: plants.isEmpty
                ? Center(
              child: Text(
                'Henüz bir bitki eklenmedi.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.local_florist, color: Colors.black),
                    title: Text(
                      plant['name'] ?? 'İsimsiz Bitki',
                      style: GoogleFonts.poppins(),
                    ),
                    subtitle: Text(
                      'Sulama aralığı: ${plant['watering'] ?? '?'} gün\nNot: ${plant['note'] ?? '-'}',
                      style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[300],
        child: const Icon(Icons.add),
        onPressed: () async {
          final newPlant = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPlantPage(),
            ),
          );

          if (newPlant != null && newPlant['name'] != null && (newPlant['name'] as String).isNotEmpty) {
            // setState'i microtask ile sarmalıyoruz:
            Future.microtask(() {
              setState(() {
                plants.add(newPlant);
              });
            });
          }
        },
      ),

    );
  }
}
