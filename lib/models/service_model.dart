class Service {
  final String title;
  final String description;
  final String icon;

  Service({required this.title, required this.description, required this.icon});

  factory Service.fromMap(Map<String, dynamic> data) {
    return Service(
      title: data['title'],
      description: data['description'],
      icon: (data['icon'] ?? '').toString().trim(),
    );
  }
}
