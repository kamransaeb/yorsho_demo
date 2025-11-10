class AppConfig {
  static const String defaultLocale = 'tr';
  static String baseUrl = '';

  static void configDev() {
     // baseUrl = 'http://192.168.1.7:8080';
     baseUrl = 'http://10.34.52.112:8080';
  }

  static void configTest() {
    // TODO(boilerplate): flavoring
  }

  static void configProduction() {
    // TODO(boilerplate): flavoring
  }
}