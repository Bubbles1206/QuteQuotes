class Quote {
  late String text;
  late String name;

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

  Quote create(String text, String name) {
    Quote quote = Quote(name: name, text: text);
    quote.setText(text);
    quote.setName(name);
    return quote;
  }

  Quote({
    required this.text,
    required this.name,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['text'],
      name: json['name'],
    );
  }
}
