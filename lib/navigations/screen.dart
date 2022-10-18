part of app_navigation;

class ScreenConfig {
  Key? key;
  late String title;
  late String path;
  late Transition? transition;
  ScreenConfig(
      {Key? key, required this.title, required this.path, this.transition}) {
    key = this.key;
    transition = transition ??
        (GetPlatform.isAndroid ? Transition.downToUp : Transition.rightToLeft);
  }
}

abstract class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  StatefulElement createElement() => StatefulElement(this);

  @override
  @protected
  @factory
  State createState();

  @protected
  @factory
  ScreenConfig createConfig();

  Future<T?> goto<T>({
    int? id,
    dynamic arguments,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    return Get.toNamed<T>(
      createConfig().path,
      id: id,
      arguments: arguments,
      parameters: parameters,
      preventDuplicates: preventDuplicates,
    );
  }

  Future<T?>? popTo<T>({
    dynamic arguments,
    int? id,
    dynamic result,
    Map<String, String>? parameters,
  }) {
    return Get.offAndToNamed(
      createConfig().path,
      id: id,
      arguments: arguments,
      parameters: parameters,
    );
  }

  Future<T?>? popThenTo<T>(
    String markedPage, {
    dynamic arguments,
    int? id,
    dynamic result,
    Map<String, String>? parameters,
  }) {
    return Get.offNamedUntil(
      createConfig().path,
      ModalRoute.withName(markedPage),
      id: id,
      arguments: arguments,
      parameters: parameters,
    );
  }

  Future<T?>? startAt<T>(
      {dynamic arguments,
      int? id,
      dynamic result,
      Map<String, String>? parameters}) {
    return Get.offAllNamed(
      createConfig().path,
      id: id,
      arguments: arguments,
      parameters: parameters,
    );
  }
}
