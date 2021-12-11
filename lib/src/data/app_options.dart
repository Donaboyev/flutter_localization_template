import 'dart:async';

import 'package:flutter/material.dart';

const systemLocaleOption = Locale('system');

Locale? _deviceLocale;

Locale get deviceLocale => _deviceLocale ?? const Locale('uz');

set deviceLocale(Locale locale) {
  _deviceLocale ??= locale;
}

class AppOptions {
  const AppOptions({Locale? locale, this.platform}) : _locale = locale;

  final Locale? _locale;
  final TargetPlatform? platform;

  Locale get locale => _locale ?? deviceLocale;

  AppOptions copyWith({
    Locale? locale,
    TargetPlatform? platform,
  }) {
    return AppOptions(
      locale: locale ?? this.locale,
      platform: platform ?? this.platform,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AppOptions &&
      locale == other.locale &&
      platform == other.platform;

  @override
  int get hashCode => hashValues(
        locale,
        platform,
      );

  static AppOptions? of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope?.modelBindingState.currentModel;
  }

  static void update(BuildContext context, AppOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope!.modelBindingState.updateModel(newModel);
  }
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope({
    Key? key,
    required this.modelBindingState,
    required Widget child,
  }) : super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  const ModelBinding({
    Key? key,
    this.initialModel = const AppOptions(),
    this.child,
  }) : super(key: key);

  final AppOptions initialModel;
  final Widget? child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  AppOptions? currentModel;
  Timer? _timeDilationTimer;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  @override
  void dispose() {
    _timeDilationTimer?.cancel();
    _timeDilationTimer = null;
    super.dispose();
  }

  void updateModel(AppOptions newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: (widget.child ?? Container()),
    );
  }
}
