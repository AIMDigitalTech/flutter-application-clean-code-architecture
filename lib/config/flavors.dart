enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get baseURL {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://api-dev.com';
      case Flavor.prod:
        return 'https://api-prod.com';
      default:
        return '';
    }
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'AIM Digital dev';
      case Flavor.prod:
        return 'AIM Digital ';
      default:
        return 'title';
    }
  }
}
