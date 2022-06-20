import 'package:dart_amqp/dart_amqp.dart';

class RmqService{
  Client client;

  void publish(String message){
    ConnectionSettings settings = ConnectionSettings(
      host: 'rmq2.pptik.id',
      authProvider: PlainAuthenticator("smkn13bandung", "qwerty"),
      virtualHost: '/smkn13bandung'
    );
    Client client = Client(settings: settings);
    print("Send Data RMQ Success");
    client.channel().then((Channel channel) {
      return channel.queue("Log", durable: true);
    }).then((Queue queue){
      queue.publish(message);
      client.close();
    });
  }

  void subscribe(Function sensor, Function actuator){
    ConnectionSettings settings = ConnectionSettings(
        host: 'rmq2.pptik.id',
        authProvider: PlainAuthenticator('smkn13bandung', 'qwerty'),
        virtualHost: '/smkn13bandung'
    );
    client = Client(settings: settings);
    client.connect().then((value) {
      sensor();
      actuator();
    });
  }

  void dataDevice(String queueRmq, Function value){
    client
        .channel()
        .then((Channel channel) => channel.queue(queueRmq, durable: true))
        .then((Queue queue) => queue.consume())
        .then((Consumer consumer) => consumer.listen ((AmqpMessage message){
          value(message.payloadAsString);
    }));
  }
}