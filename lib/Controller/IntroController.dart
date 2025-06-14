import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:weighttracker/Controller/Stroge.dart';

class Introcontroller {
  late final LocalAuthentication auth;
  bool supportState = false;

  Future<void> getAvaibleBiometrics() async {
    var avabilebiomeetrics = await auth.getAvailableBiometrics();

    print(avabilebiomeetrics);
    _authenticate();
  }

  Future<void> _authenticate() async {
    try {
      bool authentication = await auth.authenticate(
        localizedReason: "Warning",
        options: AuthenticationOptions(stickyAuth: true, biometricOnly: true),
      );
      await HiveStroge.saveHiveStroge(
        key: "fingerprint",
        value: authentication,
      );
      if (authentication == true){
        Get.offAllNamed("/dashboard");
      }
      print("auth ${authentication}");
    } catch (e) {
      print(e);
    }
  }
}
