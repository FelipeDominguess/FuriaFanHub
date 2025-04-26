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
