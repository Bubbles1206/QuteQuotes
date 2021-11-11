class Quote {
  late String text;
  late String name;
  late int id;

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getText() {
    return text;
  }

  void setText(String text) {
    this.text = text;
  }

  String getName() {
    return name;
  }

  void setName(String author) {
    name = author;
  }

  Quote create(String text, String name, int id) {
    Quote quote = Quote(name: name, text: text, id: id);
    quote.setText(text);
    quote.setName(name);
    return quote;
  }

  Quote({
    required this.text,
    required this.name,
    required this.id,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['text'],
      name: json['name'],
    );
  }
}
