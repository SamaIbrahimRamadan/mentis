import 'package:flutter/material.dart';
import 'package:mentis/core/logger.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = MqttServerClient.withPort(
    '91.121.93.94', // Broker address
    'lens_oDqldZFFMMOBG4AaBPBUqqv8exM', // Client ID
    1883, // Port
  );

  // Set the client connection messages and behavior
  client.logging(on: true);
  client.keepAlivePeriod = 20;

  client.onConnected = () {
    PrintLog.i('Connected to the MQTT broker');
  };

  client.onDisconnected = () {
    PrintLog.i('Disconnected from the MQTT broker');
  };

  client.onSubscribed = (String topic) {
    PrintLog.i('Subscribed to topic: $topic');
  };

  try {
    final connMessage = MqttConnectMessage()
        .withClientIdentifier('VOLT')
        .startClean() // Non-persistent session for simplicity
        .withWillQos(MqttQos.atLeastOnce);

    client.connectionMessage = connMessage;

    await client.connect();
  } catch (e) {
    PrintLog.i('Exception: $e');
    client.disconnect();
  }

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final MqttServerClient client;
  const MyApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image App',
      home: ImageScreen(client: client),
    );
  }
}

class ImageScreen extends StatefulWidget {
  final MqttServerClient client;
  const ImageScreen({super.key, required this.client});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late Stream<List<MqttReceivedMessage<MqttMessage>>> updatesStream;
  String latestMessage = '';
  String latestImageUrl = '';

  @override
  void initState() {
    super.initState();
    if (widget.client.connectionStatus?.state == MqttConnectionState.connected) {
      widget.client.subscribe(
        'device/led1',
        MqttQos.atMostOnce,
      );
    } else {
      PrintLog.i('Client is not connected');
    }

    updatesStream = widget.client.updates!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Updates')),
      body: StreamBuilder<List<MqttReceivedMessage<MqttMessage>>>(
        stream: updatesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data received'));
          } else {
            final updates = snapshot.data!;
            PrintLog.e(
              updates.map((update) {
                final topic = update.topic;
                final message = update.payload;
                return 'Topic: $topic, Message: $message';
              }).join('\n'),
            );
            final MqttPublishMessage payload = updates.last.payload as MqttPublishMessage;
            latestMessage = MqttPublishPayload.bytesToStringAsString(payload.payload.message);

            // Assuming the message is a URL to the image
            latestImageUrl = latestMessage;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    latestImageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Error loading image: $error');
                    },
                  ),
                  const SizedBox(height: 20),
                  Text('Received data: $latestMessage'),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.client.disconnect();
    super.dispose();
  }
}
