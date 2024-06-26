import 'package:flutter/material.dart';
import 'package:mentis/core/helper/spacing.dart';
import 'package:mentis/core/logger.dart';
import 'package:mentis/core/theme/color.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../../core/theme/styles.dart';
import '../../../res.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late MqttServerClient client;
  bool led1Switch = false;
  bool led2Switch = false;
  bool led3Switch = false;
  bool led4Switch = false;

  String heartRateValue = '';
  String respiratoryRateValue = '';
  String oxygenSaturationValue = '';
  String lastBeatTimeValue = '';
  String dataValue = '';

  @override
  void initState() {
    super.initState();
    _initializeMqttClient();
  }

  Future<void> _initializeMqttClient() async {
    client = MqttServerClient.withPort(
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
      _subscribeToTopics();
    } catch (e) {
      PrintLog.i('Exception: $e');
      client.disconnect();
    }
  }

  void _subscribeToTopics() {
    client.subscribe('device/heartRate', MqttQos.atMostOnce);
    client.subscribe('device/respiratoryRate', MqttQos.atMostOnce);
    client.subscribe('device/oxygenSaturation', MqttQos.atMostOnce);
    client.subscribe('device/lastBeatTime', MqttQos.atMostOnce);
    client.subscribe('device/data', MqttQos.atMostOnce);
    client.updates!.listen(_onMessage);
  }

  void _onMessage(List<MqttReceivedMessage<MqttMessage>> events) {
    for (var event in events) {
      final topic = event.topic;
      final MqttPublishMessage message = event.payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      setState(() {
        switch (topic) {
          case 'device/heartRate':
            heartRateValue = payload;
            break;
          case 'device/respiratoryRate':
            respiratoryRateValue = payload;
            break;
          case 'device/oxygenSaturation':
            oxygenSaturationValue = payload;
            break;
          case 'device/lastBeatTime':
            lastBeatTimeValue = payload;
            break;
          case 'device/data':
            dataValue = payload;
            break;
        }
      });
    }
  }

  void _handleSwitchChange(bool value, String topic) {
    setState(() {
      switch (topic) {
        case 'device/led1':
          led1Switch = value;
          break;
        case 'device/led2':
          led2Switch = value;
          break;
        case 'device/led3':
          led3Switch = value;
          break;
        case 'device/led4':
          led4Switch = value;
          break;
      }
    });
    final message = MqttClientPayloadBuilder();
    message.addString(value ? '1' : '0');
    client.publishMessage(
      topic,
      MqttQos.atLeastOnce,
      message.payload!,
    );

    PrintLog.i('Sent message: ${value ? '1' : '0'} to topic: $topic');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            120.sbW,
            Text(
              'Do Tasks ',
              style: Styles.title20.copyWith(color: ColorManger.mainColor),
            ),
            80.sbW,
            Image.asset(Res.img, width: 60, height: 70),
          ],
        ),
      ),
      body: ListView(
        //padding: const EdgeInsets.all(10.0),
        children: [
          SwitchListTile(
            // title: Image.asset(Res.study),
            //const Text('LED 1'),
            value: led1Switch,
            onChanged: (value) => _handleSwitchChange(value, 'device/led1'),
          ),
          SwitchListTile(
            title: Image.asset(Res.study),
            value: led2Switch,
            onChanged: (value) => _handleSwitchChange(value, 'device/led2'),
          ),
          SwitchListTile(
            title: Image.asset(Res.study),
            value: led3Switch,
            onChanged: (value) => _handleSwitchChange(value, 'device/led3'),
          ),
          SwitchListTile(
            title: Image.asset(Res.study),
            value: led4Switch,
            onChanged: (value) => _handleSwitchChange(value, 'device/led4'),
          ),
          const Divider(),
          ListTile(
            title: Text('Heart Rate ($heartRateValue)', style: Styles.title20),
          ),
          ListTile(
              title: Text('Respiratory Rate ($respiratoryRateValue)',
                  style: Styles.title20)),
          ListTile(
              title: Text('Oxygen Saturation ($oxygenSaturationValue)',
                  style: Styles.title20)),
          ListTile(
              title: Text('Last Beat Time ($lastBeatTimeValue)',
                  style: Styles.title20)),
          ListTile(title: Text('Data ($dataValue)', style: Styles.title20)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    client.disconnect();
    super.dispose();
  }
}
