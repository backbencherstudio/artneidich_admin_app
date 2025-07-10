import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationSettingProvider extends StateNotifier<bool> {
  NotificationSettingProvider() : super(true); // Default is obfuscated

  /// Toggle the visibility of the password
  void toggleNotification(bool value) {
    state = value;
  }
}

final notificationSettingProvider =
StateNotifierProvider<NotificationSettingProvider, bool>((ref) {
  return NotificationSettingProvider();
});
