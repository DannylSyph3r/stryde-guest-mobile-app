enum MessageTypee { sender, receiver }

class ChatMessage {
  final String messageBody;
  final String senderId;
  final String receiverId;
  final MessageTypee messageTag;
  final DateTime postDate;

  ChatMessage(
      {required this.messageBody,
      required this.senderId,
      required this.receiverId,
      required this.messageTag,
      required this.postDate
      });
}

List<ChatMessage> chatMessages = [
  ChatMessage(
      messageBody: "Hello!",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 3, minutes: 45))
      ),
      ChatMessage(
      messageBody: "Hi!",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 3, minutes: 42)),
      ),
  ChatMessage(
      messageBody: "Hi there!",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 3, minutes: 30)),
      ),
  ChatMessage(
      messageBody: "How are you?",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 3, minutes: 28)),
      ),
  ChatMessage(
      messageBody: "I'm good, thanks!",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 3, minutes: 24)),
      ),
  ChatMessage(
      messageBody: "What's up?",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 2, minutes: 20)),
      ),
  ChatMessage(
      messageBody: "Not much, just chilling.",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 2, minutes: 10)),
      ),
  ChatMessage(
      messageBody: "How's the weather there?",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 2, minutes: 5)),
      ),
  ChatMessage(
      messageBody: "It's sunny today!",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 2, minutes: 3)),
      ),
  ChatMessage(
      messageBody: "That's great!",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 2, minutes: 1)),
      ),
  ChatMessage(
      messageBody: "Indeed!",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 1, minutes: 59)),
      ),
  ChatMessage(
      messageBody: "How's your day going?",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 1, minutes: 45)),
      ),
  ChatMessage(
      messageBody: "It's been good so far!",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 1, minutes: 35)),
      ),
  ChatMessage(
      messageBody: "What are you up to?",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 1, minutes: 27)),
      ),
  ChatMessage(
      messageBody: "Just working on some projects.",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 1, minutes: 20)),
      ),
  ChatMessage(
      messageBody: "Sounds interesting!",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(days: 1, minutes: 18)),
      ),
  ChatMessage(
      messageBody: "Yeah, it's been busy lately.",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(days: 1, minutes: 2)),
      ),
  ChatMessage(
      messageBody: "Any plans for the weekend?",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(minutes: 59)),
      ),
  ChatMessage(
      messageBody: "Not yet, but I'm open to suggestions.",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(minutes: 25)),
      ),
  ChatMessage(
      messageBody: "Let's catch up for coffee!",
      senderId: "sender1",
      receiverId: "receiver1",
      messageTag: MessageTypee.sender,
      postDate: DateTime.now().subtract(const Duration(minutes: 20)),
      ),
  ChatMessage(
      messageBody: "Sure, that sounds great!",
      senderId: "receiver1",
      receiverId: "sender1",
      messageTag: MessageTypee.receiver,
      postDate: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
];
