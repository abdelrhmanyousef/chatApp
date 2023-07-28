class MessagesModel {
  final String messages;
  final String id;

  MessagesModel(this.messages, this.id);

  factory MessagesModel.fromjson(jsondata) {
    return MessagesModel(jsondata['messages'], jsondata['id']);
  }
}
