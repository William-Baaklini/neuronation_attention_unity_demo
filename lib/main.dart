import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

void main() {
  String mainText = "";
  runApp(const MaterialApp(
    title: 'NeuroNation POC',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Game'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UnitySceneOne()),
            );
          },
        ),
      ),
    );
  }
}

class UnitySceneOne extends StatefulWidget {
  const UnitySceneOne({super.key});

  @override
  State<UnitySceneOne> createState() => _UnitySceneOneState();
}

class _UnitySceneOneState extends State<UnitySceneOne> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _unityWidgetController?.postMessage("Player", "RestartGame", "_");
          Navigator.pop(context);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(
          Icons.pause,
          color: Color.fromARGB(255, 49, 157, 217),
        ),
      ),
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          child: UnityWidget(
            onUnityCreated: onUnityCreated,
            onUnitySceneLoaded: onUnitySceneLoaded,
            onUnityMessage: onUnityMessage,
          ),
        ),
      ),
    );
  }

  void onUnityCreated(controller) {
    _unityWidgetController = controller;
    _unityWidgetController?.postMessage(
        "FlutterManager", "ReceivePopUp", "This is a Flutter Test Message");
  }

  void onUnitySceneLoaded(SceneLoaded? sceneInfo) {
    _unityWidgetController?.postMessage(
        "FlutterManager", "ReceivePopUp", "This is a Flutter Test Message");
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
    // if (message.toString() == "restart") {
    //   _unityWidgetController?.postMessage("Player", "RestartGame", "_");
    // }
    // Navigator.pop(context);
  }
}
