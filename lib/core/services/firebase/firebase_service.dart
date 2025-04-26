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
