#!/bin/bash

# Script para criar a estrutura de pastas e arquivos para o projeto Flutter FURIA Challenges
# Autor: Manus
# Data: 26/04/2025

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Criando estrutura de pastas para o projeto FURIA Challenges ===${NC}"

# Verificar se o Flutter está instalado
if ! command -v flutter &> /dev/null; then
    echo -e "${YELLOW}Flutter não encontrado. Por favor, instale o Flutter antes de continuar.${NC}"
    exit 1
fi

# Confirmar criação no diretório atual
read -p "Deseja criar a estrutura de pastas no diretório atual ($(pwd))? (s/n): " CONFIRM
if [[ "$CONFIRM" != "s" ]]; then
    echo -e "${YELLOW}Operação cancelada.${NC}"
    exit 0
fi

# Criar estrutura de pastas
echo -e "${GREEN}Criando estrutura de pastas...${NC}"

# Estrutura principal
mkdir -p lib/core/{constants,services,widgets,utils}
mkdir -p lib/features/{auth,chat_furia,know_your_fan}

# Estrutura para auth
mkdir -p lib/features/auth/{models,repositories,screens,widgets,services}

# Estrutura para chat_furia
mkdir -p lib/features/chat_furia/{models,repositories,screens,widgets,services}

# Estrutura para know_your_fan
mkdir -p lib/features/know_your_fan/{models,repositories,screens,widgets,services}

# Criar arquivos base
echo -e "${GREEN}Criando arquivos base...${NC}"

# Arquivo app.dart
cat > lib/app.dart << 'EOF'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FuriaChallengesApp extends ConsumerWidget {
  const FuriaChallengesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'FURIA Challenges',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // Adicione mais rotas aqui
  ],
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FURIA Challenges'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegação para o desafio 1
              },
              child: const Text('Experiência Conversacional'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegação para o desafio 2
              },
              child: const Text('Know Your Fan'),
            ),
          ],
        ),
      ),
    );
  }
}
EOF

# Atualizar main.dart
cat > lib/main.dart << 'EOF'
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    const ProviderScope(
      child: FuriaChallengesApp(),
    ),
  );
}
EOF

# Criar arquivos de constantes
cat > lib/core/constants/app_colors.dart << 'EOF'
import 'package:flutter/material.dart';

class AppColors {
  // Cores da FURIA
  static const Color primary = Color(0xFF000000);  // Preto
  static const Color secondary = Color(0xFFFFFFFF);  // Branco
  static const Color accent = Color(0xFF00FFFF);  // Ciano
  
  // Cores de UI
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color error = Color(0xFFCF6679);
  
  // Cores de texto
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xB3FFFFFF);  // 70% branco
}
EOF

cat > lib/core/constants/app_theme.dart << 'EOF'
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        background: AppColors.background,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.primary,
        ),
      ),
    );
  }
}
EOF

# Criar arquivo de serviço Firebase
mkdir -p lib/core/services/firebase
cat > lib/core/services/firebase/firebase_service.dart << 'EOF'
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  // Instâncias do Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  
  // Getters
  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;
  FirebaseStorage get storage => _storage;
  
  // Coleções
  CollectionReference get users => _firestore.collection('users');
  CollectionReference get chatMessages => _firestore.collection('chat_messages');
  CollectionReference get chatRooms => _firestore.collection('chat_rooms');
  CollectionReference get fanProfiles => _firestore.collection('fan_profiles');
  CollectionReference get documents => _firestore.collection('documents');
  CollectionReference get socialConnections => _firestore.collection('social_connections');
}
EOF

# Criar arquivo de modelo de usuário
cat > lib/features/auth/models/user_model.dart << 'EOF'
class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  UserModel({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
  
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
EOF

# Criar arquivo de modelo de mensagem
cat > lib/features/chat_furia/models/message_model.dart << 'EOF'
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String text;
  final String userId;
  final String userName;
  final String? userPhotoUrl;
  final DateTime timestamp;
  final String roomId;
  
  MessageModel({
    required this.id,
    required this.text,
    required this.userId,
    required this.userName,
    this.userPhotoUrl,
    required this.timestamp,
    required this.roomId,
  });
  
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      text: json['text'],
      userId: json['userId'],
      userName: json['userName'],
      userPhotoUrl: json['userPhotoUrl'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      roomId: json['roomId'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'userId': userId,
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'timestamp': timestamp,
      'roomId': roomId,
    };
  }
}
EOF

# Criar arquivo de modelo de perfil de fã
cat > lib/features/know_your_fan/models/fan_profile_model.dart << 'EOF'
class FanProfileModel {
  final String id;
  final String userId;
  final String name;
  final String? address;
  final String? cpf;
  final List<String>? interests;
  final List<String>? events;
  final List<String>? purchases;
  final List<String>? documentIds;
  final List<SocialMediaAccount>? socialAccounts;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  FanProfileModel({
    required this.id,
    required this.userId,
    required this.name,
    this.address,
    this.cpf,
    this.interests,
    this.events,
    this.purchases,
    this.documentIds,
    this.socialAccounts,
    required this.createdAt,
    required this.updatedAt,
  });
  
  factory FanProfileModel.fromJson(Map<String, dynamic> json) {
    return FanProfileModel(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      address: json['address'],
      cpf: json['cpf'],
      interests: List<String>.from(json['interests'] ?? []),
      events: List<String>.from(json['events'] ?? []),
      purchases: List<String>.from(json['purchases'] ?? []),
      documentIds: List<String>.from(json['documentIds'] ?? []),
      socialAccounts: (json['socialAccounts'] as List?)
          ?.map((e) => SocialMediaAccount.fromJson(e))
          .toList(),
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'address': address,
      'cpf': cpf,
      'interests': interests,
      'events': events,
      'purchases': purchases,
      'documentIds': documentIds,
      'socialAccounts': socialAccounts?.map((e) => e.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class SocialMediaAccount {
  final String platform;
  final String username;
  final String? accessToken;
  
  SocialMediaAccount({
    required this.platform,
    required this.username,
    this.accessToken,
  });
  
  factory SocialMediaAccount.fromJson(Map<String, dynamic> json) {
    return SocialMediaAccount(
      platform: json['platform'],
      username: json['username'],
      accessToken: json['accessToken'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'username': username,
      'accessToken': accessToken,
    };
  }
}
EOF

# Atualizar pubspec.yaml com as dependências necessárias
cat > pubspec.yaml << 'EOF'
name: furia_challenges
description: Projeto integrado para os desafios técnicos da FURIA.
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ">=2.17.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  
  # Firebase
  firebase_core: ^2.15.0
  firebase_auth: ^4.7.2
  cloud_firestore: ^4.8.4
  firebase_storage: ^11.2.5
  firebase_messaging: ^14.6.5
  
  # Estado e DI
  flutter_riverpod: ^2.3.6
  
  # Navegação
  go_router: ^10.0.0
  
  # Rede e API
  dio: ^5.3.0
  http: ^1.1.0
  
  # Armazenamento local
  shared_preferences: ^2.2.0
  flutter_secure_storage: ^8.0.0
  
  # UI
  google_fonts: ^5.1.0
  flutter_svg: ^2.0.7
  cached_network_image: ^3.2.3
  
  # Câmera e ML
  camera: ^0.10.5+2
  google_ml_kit: ^0.16.2
  image_picker: ^1.0.1
  
  # Utilidades
  intl: ^0.18.1
  url_launcher: ^6.1.12
  path_provider: ^2.1.0
  uuid: ^3.0.7

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.2
  build_runner: ^2.4.6

flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/icons/
EOF

# Criar diretórios para assets
mkdir -p assets/{images,icons}

# Criar arquivo .gitignore
cat > .gitignore << 'EOF'
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.buildlog/
.history
.svn/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Web related
lib/generated_plugin_registrant.dart

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release

# Firebase
google-services.json
GoogleService-Info.plist
firebase_options.dart

# Environment variables
.env
.env.*
EOF

# Criar README.md
cat > README.md << 'EOF'
# FURIA Challenges

Projeto integrado para os desafios técnicos da FURIA:
1. **Experiência Conversacional**: Chat para fãs do time de CS da FURIA
2. **Know Your Fan**: Solução para coleta e análise de dados de fãs

## Configuração

1. Clone o repositório
2. Execute `flutter pub get` para instalar as dependências
3. Configure o Firebase usando FlutterFire CLI
4. Execute o aplicativo com `flutter run`

## Estrutura do Projeto

O projeto segue uma arquitetura modular com separação clara entre os módulos de cada desafio.

Para mais detalhes, consulte a documentação completa.
EOF

echo -e "${GREEN}Estrutura de pastas e arquivos criada com sucesso!${NC}"
echo -e "${YELLOW}Próximos passos:${NC}"
echo "1. Navegue para o diretório do projeto: cd $PROJECT_NAME"
echo "2. Execute 'flutter pub get' para instalar as dependências"
echo "3. Configure o Firebase usando FlutterFire CLI: 'flutterfire configure'"
echo "4. Execute o aplicativo com 'flutter run'"

echo -e "${BLUE}=== Projeto FURIA Challenges pronto para desenvolvimento! ===${NC}"
