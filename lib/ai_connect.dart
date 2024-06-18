// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// class ScreenTest extends StatelessWidget {
//   const ScreenTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Flutter Dio Example')),
//         body: Center(
//           child: FutureBuilder(
//             future: fetchData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 return Text('Response: ${snapshot.data}');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<String> fetchData() async {
//     final dio = Dio();
//     const url = 'https://ant-man19-mentisadhd.hf.space/call/predict';
//     final headers = {'Content-Type': 'application/json'};
//     final body = {
//       'data': [
//         '53.10,15.141597,1.646668e+09',],};
//     try {
//       // First POST request
//       final response = await dio.post(url, data: body, options: Options(headers: headers));
//       if (response.statusCode != 200) {
//         throw Exception('Failed to load data');
//       }
//       final responseBody = response.data;
//       final eventId = responseBody['event_id'];
//       // replace 'event_id' with the actual key for event ID
//       // Second GET request
//       final eventUrl = 'https://ant-man19-mentisadhd.hf.space/call/predict/$eventId';
//       final eventResponse = await dio.get(eventUrl);
//       if (eventResponse.statusCode != 200) {
//         throw Exception('Failed to load event data');
//       }
//       return eventResponse.data.toString();
//     } catch (e) {
//       throw Exception('Failed to fetch data: $e');
//     }
//   }
// }
