class MessageHub {
  String? text;
  DateTime? time;
  String? name;
  String? type;

  MessageHub({this.text, this.time, this.name, this.type});

  Map<String,dynamic> toMap (){
    return {
      "name": name,
      "text": text,
      "type": type,
      "time": time,

    };
  }

}