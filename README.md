flutter-ecommerce-clean-architecture 🛒
Professional Flutter E-commerce App with Clean Architecture, BLoC State Management, and Advanced Testing

Architecture Overview:
Bu proje Clean Architecture prensiplerine göre geliştirilmiştir. Katmanlar:
- Domain Layer: İş mantığı ve entity’ler
- Data Layer: Repository implementasyonu ve veri kaynakları
- Presentation Layer: UI ve BLoC ile state management

Features:
- Ürün listeleme ve arama
- Kategoriye göre filtreleme
- Clean Architecture implementasyonu
- BLoC state management
- Profesyonel hata yönetimi
- Kapsamlı test altyapısı

Tech Stack:
- Framework: Flutter
- Architecture: Clean Architecture
- State Management: BLoC/Cubit
- Networking: Dio + Retrofit
- Testing: Unit ve Widget Test
- Code Generation: build_runner

Getting Started:
1. Repository’yi klonlayın:
   git clone https://github.com/berkecibir/flutter-ecommerce-clean-architecture.git
2. Bağımlılıkları yükleyin:
   flutter pub get
3. Kod üretimini çalıştırın:
   dart run build_runner build --delete-conflicting-outputs
4. Uygulamayı çalıştırın:
   flutter run
