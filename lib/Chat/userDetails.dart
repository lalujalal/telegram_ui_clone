

class ChatModel {
  String? name;
  String? messageText;
  String? imageUrl;
  String? time;

  ChatModel({
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
  });
}

List<ChatModel> getChatUsers() {
  return [
    ChatModel(name: "Developers", messageText: "How are you?", imageUrl: "assets/images/devo.jpg", time: "now"),
    ChatModel(name: "Padippura Notifications", messageText: "Can you please share the file?", imageUrl: "assets/images/padippura.jpg", time: "12:04"),
    ChatModel(name: "Andre Ressel", messageText: "Awesome Setup", imageUrl: "assets/images/joco.png", time: "6:35"),
    ChatModel(name: "Mallu Devolepor", messageText: "will update you in the evening", imageUrl: "assets/images/mallu.jpg", time: "Yesterday"),
    ChatModel(name: "Ricky Ponding", messageText: "That's Great", imageUrl: "assets/images/willing.jpg", time: "Yesterday"),
    ChatModel(name: "Javed Brocamp ", messageText: "Hey where are you?", imageUrl: "assets/images/jpic.jpg", time: "9 Oct"),
    ChatModel(name: "Philip Mampad", messageText: "Busy! Call me in 20 mins", imageUrl: "assets/images/p.png", time: "8 Oct"),
    ChatModel(name: "Devan Brocamp", messageText: "Thankyou, It's awesome", imageUrl: "assets/images/d pic.png", time: "23 sep"),
  ];
}



  
