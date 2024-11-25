import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart'; // This is still used for file paths

class Pref {
  static late Box _box;

  static Future<void> initialize() async {
    // Open the Hive box
    _box = await Hive.openBox('myData'); // Use 'await' to ensure the box is opened
  }

  // Getter for 'showOnboarding' with a default value
  static bool get showOnboarding => _box.get('showOnboarding', defaultValue: true);

  // Setter for 'showOnboarding'
  static set showOnboarding(bool value) => _box.put('showOnboarding', value);
}
