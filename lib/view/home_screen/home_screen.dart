import 'package:api_integretion_sample/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<HomeScreenController>(context, listen: false)
            .getuserdata();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeprovider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Provider.of<HomeScreenController>(context, listen: false)
              .getuserdata();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: homeprovider.isLoading == false
              ?
              // Text(homeprovider.fact.toString())
              Image.network(homeprovider.message.toString())
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
