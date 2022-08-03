import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/controller.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with TickerProviderStateMixin {
  final TextEditingController _txtControllerMessage = TextEditingController();
  final List<ChatMessage> _listMessage = <ChatMessage>[];

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'ProGulf Help Center',
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: height * 0.1,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Hello, Welcome to Progulf Chat Center',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: height * 0.1,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    'How Can We Help You Today?',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _listMessage[index],
              itemCount: _listMessage.length,
            ),
          ),
          new Divider(
            height: 10.0,
          ),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildCompotionInput(),
          ),
        ],
      ),
    );
  }

  Widget _buildCompotionInput() {
    return SingleChildScrollView(
      child: new Container(
        margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _txtControllerMessage,
                onSubmitted: _onSubmitMessage,
                decoration:
                    new InputDecoration.collapsed(hintText: "Message..."),
              ),
            ),
            new Container(
              child: new IconButton(
                  icon: Icon(Icons.send, color: Colors.deepOrange),
                  onPressed: _sendMessage),
            )
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    ChatMessage message = ChatMessage(
      message: _txtControllerMessage.text,
      animationController: AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      if (_txtControllerMessage.text.length > 0) {
        _listMessage.insert(0, message);
      }
    });
    // Hide keyboard after send message
    // FocusScope.of(context).requestFocus(FocusNode());
    _txtControllerMessage.clear();
    message.animationController.forward();
  }

  void _onSubmitMessage(String text) {
    print("message: $text");
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage(
      {Key? key, required this.message, required this.animationController})
      : super(key: key);

  final String message;
  final AnimationController animationController;
  final UserName uname = Get.put(UserName());
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(7.0),
              child: CircleAvatar(
                radius: 28,
                child: Image(
                  image: NetworkImage(
                    ('https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg'),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    uname.userName.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Text(message),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
