import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isBiometricSupported = false;
  String _authStatus = 'Not Authenticated';

  @override
  void initState() {
    super.initState();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    bool isSupported = await _localAuthentication.isDeviceSupported();
    setState(() {
      _isBiometricSupported = isSupported;
    });
  }

  Future<void> _authenticate() async {
    bool isAuthenticated = false;

    try {
      isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to access the app',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print('Error: $e');
    }

    if (isAuthenticated) {
      setState(() {
        _authStatus = 'Authenticated';
      });
      // TODO: Add code to unlock the door here.
    } else {
      setState(() {
        _authStatus = 'Not Authenticated';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint Door Lock App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Biometric Support: $_isBiometricSupported'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isBiometricSupported ? _authenticate : null,
              child: Text('Authenticate'),
            ),
            SizedBox(height: 20),
            Text('Authentication Status: $_authStatus'),
          ],
        ),
      ),
    );
  }
}
