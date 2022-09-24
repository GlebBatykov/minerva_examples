class Note {
  final String id;

  final String title;

  final String value;

  Note(this.id, this.title, this.value);

  Note.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['title'],
        value = json['value'];
}
