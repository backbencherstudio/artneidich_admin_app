import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordVisibilityNotifier extends StateNotifier<bool> {
  PasswordVisibilityNotifier() : super(true); // Default is obfuscated

  /// Toggle the visibility of the password
  void toggleVisibility() {
    state = !state;
  }
}

final passwordVisibilityProvider =
    StateNotifierProvider<PasswordVisibilityNotifier, bool>((ref) {
      return PasswordVisibilityNotifier();
    });

/// =======++===+===++===+===+==++==++==++==+==++==+==+==+==+==+==++=++== ///
/// =======++===+===++===+===+==++==++==++==+==++==+==+==+==+==+==++=++== ///
/// =======++===+===++===+===+==++==++==++==+==++==+==+==+==+==+==++=++== ///

class ConfirmPasswordVisibilityNotifier extends StateNotifier<bool> {
  ConfirmPasswordVisibilityNotifier() : super(true); // Default is obfuscated

  /// Toggle the visibility of the password
  void toggleVisibility() {
    state = !state;
  }
}

final confirmPasswordVisibilityProvider =
    StateNotifierProvider<ConfirmPasswordVisibilityNotifier, bool>((ref) {
      return ConfirmPasswordVisibilityNotifier();
    });
