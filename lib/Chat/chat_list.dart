import 'package:flutter/material.dart';
import 'package:telegram_app/Chat/chatDetailSreen.dart';
import 'package:telegram_app/Chat/userDetails.dart';

class ChatPerson extends StatefulWidget {
  const ChatPerson({super.key});

  @override
  State<ChatPerson> createState() => __ChatPageState();
}

class __ChatPageState extends State<ChatPerson> {
  @override
  Widget build(BuildContext context) {
    return buildChatPage();
  }

  Widget buildChatPage() {
    List<ChatModel> chatUsers = getChatUsers();

    return ListView.separated(
      
      itemCount: chatUsers.length,
      separatorBuilder: (context, index) => const Divider(thickness:2,),
      itemBuilder: (context, index) {
        ChatModel user = chatUsers[index];
        Widget avatar;
      if (index % 2 == 0) {
        avatar = CircleAvatar(
          backgroundImage: AssetImage(user.imageUrl!),
        );
      } else {
        avatar = ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            user.imageUrl!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        );
      }

        return ListTile(
          leading: avatar,
          title: Text(user.name!),
          subtitle: Text(user.messageText!),
          trailing: Text(user.time!),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  ChatDetailPage(user: user);
            }));
          },
        );
      },
    );
  }
}
