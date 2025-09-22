class Post {
  final int id;
  final String title;
  final String body;

  // Constructer using named parameter

  const Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
  );

  Map<String, dynamic> toJson() =>{'id': id, 'title': title, 'body' : body};
}