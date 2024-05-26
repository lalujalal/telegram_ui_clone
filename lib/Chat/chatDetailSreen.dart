import 'package:flutter/material.dart';
import 'package:telegram_app/Chat/userDetails.dart';

class ChatDetailPage extends StatelessWidget {
  final ChatModel user;
  const ChatDetailPage({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(72),
        child: AppBar(
          flexibleSpace: SafeArea(
            child:Container(
              padding: const EdgeInsets.only(right: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 9,left: 100),
                child: Row(
                  children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(user.imageUrl!),
                  ),
                  const SizedBox(width: 28),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text(user.name!,style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                       const SizedBox(height: 6,),
                      const Text('online',style: TextStyle(color: Colors.white),)
                      ] 
                    ),
                  ),
                ]),
              ),
            ) ),
            actions:const [
               Icon(
                Icons.call,
                color: Colors.white,
              ),
               SizedBox(
                width: 10,
              ),
               Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
        ),
      ),
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/chatpage.jpg"),
          fit: BoxFit.cover,
          ) 
        ) ,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              padding:const  EdgeInsets.only(top: 10,bottom: 10),
              itemBuilder: (context, index){
                return Container(
                  padding:const  EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "left"?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messages[index].messageType  == "left"?Colors.grey.shade200:Colors.blue[200]),
                    ),
                    padding: const EdgeInsets.all(16),
            child: Text(messages[index].messageContent!, style: const TextStyle(fontSize: 15),),
                  )
                )
              );
              },
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding:const EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: (){},
                      backgroundColor: Colors.blue,
                      elevation: 0,
                      child: const Icon(Icons.send,color: Colors.white,size: 18,),
                      
                    ),
                  ],
            ),
            )
          )
        ], ),
      ),
    );
  }
}

class MessageText{
  String? messageContent;
  String? messageType;
  MessageText({required this.messageContent, required this.messageType});
}

List<MessageText> messages = [
    MessageText(messageContent: "Hello", messageType: "left"),
    MessageText(messageContent: "what about your career?", messageType: "left"),
    MessageText(messageContent: "Hey , I am doing fine dude. wbu?", messageType: "right"),
    MessageText(messageContent: "ehhhh, doing OK.", messageType: "left"),
    MessageText(messageContent: "Is there any thing wrong?", messageType: "right"),
  ];