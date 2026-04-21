import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Sorular {
  final String soru;
  final List<String> cevap;
  final int dogruCevap;

  const Sorular({
    required this.soru,
    required this.cevap,
    required this.dogruCevap,
  });
}

const List<Sorular> sorular = [
  Sorular(
    soru:
        "İtalyan Rönesansı'nın en önemli temsilcilerinden biri olan Mona Lisa tablosunun ressamı kimdir?",
    cevap: [
      "Michelangelo",
      "Leonardo da Vinci",
      "Raffaello Sanzio",
      "Donatello",
      "Botticelli",
    ],
    dogruCevap: 1,
  ),

  Sorular(
    soru: "Dünyanın en uzun nehri hangisidir?",
    cevap: [
      "Amazon Nehri",
      "Yangtze Nehri",
      "Mississippi Nehri",
      "Nil Nehri",
      "Ganj Nehri",
    ],
    dogruCevap: 4,
  ),

  Sorular(
    soru:
        "Kuantum mekaniğinin temellerini atan 'belirsizlik ilkesi' hangi fizikçiye aittir?",
    cevap: [
      "Albert Einstein",
      "Niels Bohr",
      "Werner Heisenberg",
      "Erwin Schrödinger",
      "Max Planck",
    ],
    dogruCevap: 2,
  ),

  Sorular(
    soru: "Sanayi Devrimi'nin ilk başladığı ülke aşağıdakilerden hangisidir?",
    cevap: ["Almanya", "İngiltere", "Fransa", "ABD", "Osmanlı"],
    dogruCevap: 1,
  ),

  Sorular(
    soru:
        "Osmanlı Devleti'nde Tanzimat Fermanı hangi padişah döneminde ilan edilmiştir?",
    cevap: [
      "Abdülmecid",
      "II. Mahmud",
      "V. Murad",
      "Abdülaziz",
      "II. Abdülhamid",
    ],
    dogruCevap: 0,
  ),

  Sorular(
    soru: "Edebiyatımızda 'Şair-i Azam' unvanı ile tanınan şairimiz kimdir?",
    cevap: [
      "Namık Kemal",
      "Muallim Naci",
      "Ziya Paşa",
      "Recaizade Mahmut Ekrem",
      "Abdülhak Hamit Tarhan",
    ],
    dogruCevap: 4,
  ),

  Sorular(
    soru: "Güneş Sistemi'ndeki en büyük gezegen hangisidir?",
    cevap: ["Satürn", "Neptün", "Uranüs", "Mars", "Jüpiter"],
    dogruCevap: 4,
  ),

  Sorular(
    soru:
        "Felsefede 'Varoluş özden önce gelir' diyen varoluşçu düşünür kimdir?",
    cevap: [
      "Friedrich Nietzsche",
      "Albert Camus",
      "Jean-Paul Sartre",
      "Søren Kierkegaard",
      "Martin Heidegger",
    ],
    dogruCevap: 2,
  ),

  Sorular(
    soru:
        "Aşağıdaki ülkelerden hangisi BM Güvenlik Konseyi'nin 5 daimi üyesinden biri değildir?",
    cevap: ["Almanya", "Çin", "Fransa", "Rusya", "Birleşik Krallık"],
    dogruCevap: 0,
  ),

  Sorular(
    soru: "Periyodik tabloda 'Au' simgesi ile gösterilen element hangisidir?",
    cevap: ["Gümüş", "Bakır", "Alüminyum", "Demir", "Altın"],
    dogruCevap: 4,
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Uygulaması",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BaslangicEkrani(),
    );
  }
}

class BaslangicEkrani extends StatelessWidget {
  const BaslangicEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Uygulaması',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const QuizEkrani()),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                side: const BorderSide(color: Colors.deepPurple),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 16,
                ),
              ),
              child: const Text('Başla', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  int _currentIndex = 0;
  int _skor = 0;
  int _kalanSure = 15;
  Timer? _timer;

  static const int _toplamSure = 15;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _kalanSure = _toplamSure);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_kalanSure == 0) {
        _goToNext();
      } else {
        setState(() => _kalanSure--);
      }
    });
  }

  void _answerSelected(int selectedIndex) {
    _timer?.cancel();
    if (selectedIndex == sorular[_currentIndex].dogruCevap) {
      setState(() => _skor++);
    }
    _goToNext();
  }

  void _goToNext() {
    if (_currentIndex + 1 < sorular.length) {
      setState(() => _currentIndex++);
      _startTimer();
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(skor: _skor, total: sorular.length),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final suankiSoru = sorular[_currentIndex];
    final ratio = _kalanSure / _toplamSure;
    final timerColor = _kalanSure <= 5 ? Colors.red : Colors.blue;

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Uygulaması"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soru ${_currentIndex + 1}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Text(
              'Kalan Süre: ${_kalanSure.toString()} saniye',
              style: TextStyle(
                fontSize: 15,
                color: timerColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 8,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(timerColor),
              ),
            ),
            const SizedBox(height: 28),

            Text(suankiSoru.soru, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 24),

            ...List.generate(
              suankiSoru.cevap.length,
              (i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: OutlinedButton(
                  onPressed: () => _answerSelected(i),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    suankiSoru.cevap[i],
                    style: const TextStyle(fontSize: 15),
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

class ResultScreen extends StatelessWidget {
  final int skor;
  final int total;
  const ResultScreen({super.key, required this.skor, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz Bitti!\nSkorunuz $skor / $total",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const BaslangicEkrani()),
              ),
              child: const Text("Yeniden Başla"),
            ),
          ],
        ),
      ),
    );
  }
}
