import consumer from "./consumer"


consumer.subscriptions.create({"channel" : "ConversationChannel", "conversation_id":conversation_id} , {
  connected() { 
    console.log(`test - subscribed to ${conversation_id}`)
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#message-container').append(data)
  }
});
