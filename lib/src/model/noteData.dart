class NoteData{
  String title;
  String description;
  String date;
  String time;
  NoteData({required this.title, required this.description, required this.date, required this.time});

  factory NoteData.fromJson(Map<String, dynamic> json) => NoteData(
    title: json['title'],
    description: json['description'],
    date: json['date'],
    time: json['time'],
  );

  Map<String, dynamic> toJson() => {
    'title' : title,
    'description' : description,
    'date' : date,
    'time' : time,
  };

}