import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFBFDBFE);
    const secondaryColor = Color(0xFFF472B6);
    const tertiaryColor = Color(0xFF2C0051); 
    const neutralColor = Color(0xFF0F172A);

    return MaterialApp(
      title: 'Hadist Pedia',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter', 
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: tertiaryColor,
          surface: neutralColor,
        ),
        scaffoldBackgroundColor: neutralColor, 
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Widget _buildChip(String label, {required bool isSelected, required ColorScheme colorScheme}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? colorScheme.surface : Colors.white.withOpacity(0.8),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface, 
      body: Stack(
        children: [
          // 1. Efek Glow Kiri Atas
          Positioned(
            top: -250,
            left: -250,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                width: 800,
                height: 800,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      colorScheme.tertiary.withOpacity(0.9), 
                      colorScheme.tertiary.withOpacity(0.0), 
                    ],
                    stops: const [0.1, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // 2. Efek Glow Kanan Bawah
          Positioned(
            bottom: -200,
            right: -200,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      colorScheme.secondary.withOpacity(0.5), 
                      colorScheme.secondary.withOpacity(0.0), 
                    ],
                    stops: const [0.1, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // 3. LAYER DARK GLASSMORPHISM
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: Container(
                color: colorScheme.surface.withOpacity(0.6), 
              ),
            ),
          ),

          // 4. KONTEN UTAMA
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- HEADER ATAS ---
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 20.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFa855f7), 
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.auto_awesome, 
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Hadistpedia',
                        style: TextStyle(
                          color: Color(0xFFc084fc),
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 18, 
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), 
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // --- FILTER CHIPS BAWAH ---
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      _buildChip('All', isSelected: true, colorScheme: colorScheme),
                      const SizedBox(width: 12),
                      _buildChip('Hadith', isSelected: false, colorScheme: colorScheme),
                      const SizedBox(width: 12),
                      _buildChip('Daily Vibe', isSelected: false, colorScheme: colorScheme),
                      const SizedBox(width: 12),
                      _buildChip('Reflections', isSelected: false, colorScheme: colorScheme),
                      const SizedBox(width: 12),
                      _buildChip('Audio', isSelected: false, colorScheme: colorScheme),
                    ],
                  ),
                ),
                
                const SizedBox(height: 36), // Jarak sebelum tulisan Daily Vibe

                // --- DAILY VIBE TITLE ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Label FOR YOU
                      Text(
                        'FOR YOU',
                        style: TextStyle(
                          color: colorScheme.secondary, // Warna pink
                          letterSpacing: 2.0, // Teksnya merenggang
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Baris Judul & Tombol View History
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Daily Vibe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'View History',
                            style: TextStyle(
                              color: colorScheme.primary, // Warna biru muda
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // --- QUOTE CARD COMPONENT ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28), // Membulatkan semua isi kartu
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF131524), // Background dasar kartu
                        border: Border.all(
                          color: Colors.white.withOpacity(0.08), 
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Stack(
                        children: [
                          // Efek Nebula Galaksi di dalam kartu
                          Positioned(
                            top: -60,
                            right: -20,
                            child: Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    const Color(0xFFc084fc).withOpacity(0.5), // Pendar ungu
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -50,
                            left: -40,
                            child: Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    const Color(0xFF0ea5e9).withOpacity(0.4), // Pendar tosca/biru muda
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                          // Isi Kartu
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Badge Authentic (Pink)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: colorScheme.secondary.withOpacity(0.2), // Background transparan
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'AUTHENTIC',
                                    style: TextStyle(
                                      color: colorScheme.secondary, 
                                      fontSize: 10, 
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                                
                                const SizedBox(height: 20),
                                
                                // Teks Quote 
                                const Text(
                                  '"The best of you are those who have the best manners and character."',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    height: 1.3, // Spasi antar baris teks
                                  ),
                                ),
                                
                                const SizedBox(height: 32),
                                
                                // Baris Bawah: Sumber & Tombol
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Sumber
                                    Text(
                                      'Sahih Bukhari',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    
                                    // Tombol Read More
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: colorScheme.primary, // Biru muda
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Read More',
                                        style: TextStyle(
                                          color: colorScheme.surface, // Warna gelap
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
