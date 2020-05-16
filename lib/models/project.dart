class Project {
  final String userId;
  final String name;
  final String description;
  final int timestamp;

  Project({
    this.userId,
    this.name,
    this.description,
    this.timestamp,
  });

  Project.fromData(Map<String, dynamic> data)
      : userId = data['userId'],
        name = data['name'],
        description = data['description'],
        timestamp = data['timestamp'];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'description': description,
      'timestamp': timestamp,
    };
  }
}
