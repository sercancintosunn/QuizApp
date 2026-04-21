# 🧠 Quiz Uygulaması

Flutter ile geliştirilmiş, zamanlayıcılı çoktan seçmeli bilgi yarışması uygulaması.

---

## 📸 Ekran Görüntüleri

| Başlangıç Ekranı | Soru Ekranı (Normal) | Soru Ekranı (Süre Azaldı) | Sonuç Ekranı |
|:---:|:---:|:---:|:---:|
| ![Başlangıç](Ekran görüntüsü 2026-04-21 131130.png) | ![Soru Normal](Ekran görüntüsü 2026-04-21 131142.png
) | ![Soru Kırmızı](Ekran görüntüsü 2026-04-21 131201.png) | ![Sonuç](Ekran görüntüsü 2026-04-21 131208.png) |

---

## ✨ Özellikler

- 📝 **10 Soruluk Quiz** — Tarih, bilim, edebiyat, coğrafya ve felsefe gibi farklı kategorilerde sorular
- ⏱️ **Geri Sayım Sayacı** — Her soru için 15 saniyelik süre; süre dolunca otomatik olarak sonraki soruya geçilir
- 🔴 **Dinamik Renk Uyarısı** — Kalan süre 5 saniyenin altına düştüğünde zamanlayıcı ve progress bar kırmızıya döner
- 📊 **Progress Bar** — Kalan süreyi görsel olarak gösteren animasyonlu ilerleme çubuğu
- 🏆 **Skor Ekranı** — Quiz sonunda toplam doğru sayısı gösterilir
- 🔄 **Yeniden Başlatma** — Sonuç ekranından tek tuşla yeniden başlama imkânı
- 📱 **Material 3 Tasarım** — Modern ve temiz kullanıcı arayüzü

---

## 🗂️ Proje Yapısı

```
quiz_uygulamasi/
├── lib/
│   └── main.dart          # Tüm uygulama kodu
├── pubspec.yaml           # Bağımlılıklar ve proje ayarları
└── README.md
```

### `main.dart` İçindeki Sınıflar

| Sınıf | Tür | Açıklama |
|---|---|---|
| `Sorular` | Model | Soru metni, şıklar ve doğru cevap indeksini tutar |
| `MyApp` | StatelessWidget | Uygulamanın kök widget'ı, tema ayarları burada |
| `BaslangicEkrani` | StatelessWidget | Karşılama / başlangıç ekranı |
| `QuizEkrani` | StatefulWidget | Soru gösterimi, zamanlayıcı ve cevap mantığı |
| `ResultScreen` | StatelessWidget | Quiz sonu skor ekranı |

---

## 🚀 Kurulum

### Gereksinimler

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.0 ve üzeri)
- Dart SDK (Flutter ile birlikte gelir)
- Android Studio veya VS Code (önerilen)
- Bağlı bir cihaz veya emülatör

### Adımlar

**1. Repoyu klonlayın**
```bash
git clone https://github.com/kullanici-adi/quiz-uygulamasi.git
cd quiz-uygulamasi
```

**2. Bağımlılıkları yükleyin**
```bash
flutter pub get
```

**3. Uygulamayı çalıştırın**
```bash
flutter run
```

> Birden fazla cihaz bağlıysa `flutter run -d <cihaz_id>` ile hedef cihazı belirtebilirsiniz.

### Derleme (Build)

```bash
# Android APK
flutter build apk --release

# iOS (yalnızca macOS)
flutter build ios --release
```

---

## 🛠️ Kullanılan Teknolojiler

- **Flutter** — UI framework
- **Dart** — Programlama dili
- **Material 3** — Tasarım sistemi
- **dart:async** — Zamanlayıcı (Timer) için

---

## 📄 Lisans

Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.
