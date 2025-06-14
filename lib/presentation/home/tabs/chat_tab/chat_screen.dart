import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mostafa/core/utils/assets_manager.dart';
import '../../../../l10n/app_localizations.dart';

class ChatScreenUser1 extends StatefulWidget {
  const ChatScreenUser1({super.key});

  @override
  ChatScreenUser1State createState() => ChatScreenUser1State();
}

class ChatScreenUser1State extends State<ChatScreenUser1> {
  final TextEditingController _controller = TextEditingController();
  final String userId = 'user1';
  final String otherUserId = 'user2';

  void sendMessage(String message) async {
    final chatId = userId.compareTo(otherUserId) < 0
        ? '$userId$otherUserId'
        : '$otherUserId$userId';

    final messageData = {
      'from': userId,
      'to': otherUserId,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(messageData);
    _controller.clear();
  }

  Stream<QuerySnapshot> getMessagesStream() {
    final chatId = userId.compareTo(otherUserId) < 0
        ? '$userId$otherUserId'
        : '$otherUserId$userId';
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.customerService),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getMessagesStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isMe = msg['from'] == userId;

                    final timestamp = msg['timestamp'] as Timestamp?;
                    final timeString = timestamp != null
                        ? DateFormat(' hh:mm a').format(timestamp.toDate())
                        : '...';

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.green[200] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              msg['message'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              timeString,
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[700]),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.send,
                      hintStyle: const TextStyle(color: Colors.white60),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                // IconButton(
                //   icon: const Icon(Icons.send),
                //   onPressed: () {
                //
                //   },
                // ),
                IconButton(
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        sendMessage(_controller.text.trim());
                      }
                    },
                    icon: Image.asset(AssetsManager.sendImage)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
