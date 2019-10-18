class AppConfig {
  static const isProducttion =
      bool.fromEnvironment('dart.vm.producttion'); //是否为生产模式
}
