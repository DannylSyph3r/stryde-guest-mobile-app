abstract class AppUrls {
  static const String baseCarAPIUrl = "https://www.carqueryapi.com/api/0.3/?";

  static String getMakesUrl(int year) {
    return '$baseCarAPIUrl' 'cmd=getMakes&year=$year';
  }

  static String getModelsForMakeUrl(String make) {
    return '$baseCarAPIUrl' 'cmd=getModels&make=$make';
  }

  static String getTrimSpecsforModel(String make, String model) {
    return '$baseCarAPIUrl' 'make=$make&cmd=getTrims&model=$model';
  }
}
