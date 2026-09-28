class BrewSession {
  static int? coffeeGrams;
  static int? waterGrams;
  static String? brewMethod;
  static String? roastLevel;
  static int? grindSetting;
  static int? brewTimeSeconds;

  static void clear() {
    coffeeGrams = null;
    waterGrams = null;
    brewMethod = null;
    roastLevel = null;
    grindSetting = null;
    brewTimeSeconds = null;
  }
}