import 'package:flutter_riverpod/flutter_riverpod.dart';

final startingLocationProvider = StateProvider<String>((ref) => "");

final desinationLocationProvider = StateProvider<String>((ref) => "");

final tripStartedNotiferProvider = StateProvider<bool>((ref) => false);

final tripCompletedNotifier = StateProvider<bool>((ref) => false);
