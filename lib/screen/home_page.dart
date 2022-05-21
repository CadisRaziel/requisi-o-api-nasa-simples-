import 'package:flutter/material.dart';
import 'package:nasa_api/model/apod.dart';
import 'package:nasa_api/service/controller_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ControllerService controller = ControllerService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api nasa'),
        centerTitle: true,
      ),
      body: FutureBuilder<Apod?>(
        future: controller.getApiNasa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Ocurreu um erro'),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        Text('${snapshot.data!.title}'),
                        Text('${snapshot.data!.date}'),
                        Text('${snapshot.data!.copyright}'),
                        Image.network('${snapshot.data!.url}'),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
