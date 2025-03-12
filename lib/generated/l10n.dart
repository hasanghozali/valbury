// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome back!`
  String get welcome {
    return Intl.message(
      'Welcome back!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get email_hint {
    return Intl.message(
      'Enter your email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get email_error {
    return Intl.message(
      'Invalid email',
      name: 'email_error',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get password_hint {
    return Intl.message(
      'Enter your password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get password_error {
    return Intl.message(
      'Invalid password',
      name: 'password_error',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get or_login_with {
    return Intl.message(
      'Or continue with',
      name: 'or_login_with',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get no_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Now`
  String get sign_up_now {
    return Intl.message(
      'Sign Up Now',
      name: 'sign_up_now',
      desc: '',
      args: [],
    );
  }

  /// `Login as Guest`
  String get as_guest {
    return Intl.message(
      'Login as Guest',
      name: 'as_guest',
      desc: '',
      args: [],
    );
  }

  /// `Hello, `
  String get hello {
    return Intl.message(
      'Hello, ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Albums`
  String get albums {
    return Intl.message(
      'Albums',
      name: 'albums',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `No Post`
  String get no_post {
    return Intl.message(
      'No Post',
      name: 'no_post',
      desc: '',
      args: [],
    );
  }

  /// `All of your posts will be displayed here.`
  String get no_post_desc {
    return Intl.message(
      'All of your posts will be displayed here.',
      name: 'no_post_desc',
      desc: '',
      args: [],
    );
  }

  /// `No Album`
  String get no_album {
    return Intl.message(
      'No Album',
      name: 'no_album',
      desc: '',
      args: [],
    );
  }

  /// `All of your albums will be displayed here.`
  String get no_album_desc {
    return Intl.message(
      'All of your albums will be displayed here.',
      name: 'no_album_desc',
      desc: '',
      args: [],
    );
  }

  /// `No Favorite`
  String get no_favorite {
    return Intl.message(
      'No Favorite',
      name: 'no_favorite',
      desc: '',
      args: [],
    );
  }

  /// `All of your favorites will be displayed here.`
  String get no_favorite_desc {
    return Intl.message(
      'All of your favorites will be displayed here.',
      name: 'no_favorite_desc',
      desc: '',
      args: [],
    );
  }

  /// `No Comment`
  String get no_comment {
    return Intl.message(
      'No Comment',
      name: 'no_comment',
      desc: '',
      args: [],
    );
  }

  /// `All of your comments will be displayed here.`
  String get no_comment_desc {
    return Intl.message(
      'All of your comments will be displayed here.',
      name: 'no_comment_desc',
      desc: '',
      args: [],
    );
  }

  /// `No Photo`
  String get no_photo {
    return Intl.message(
      'No Photo',
      name: 'no_photo',
      desc: '',
      args: [],
    );
  }

  /// `All of your photos will be displayed here.`
  String get no_photo_desc {
    return Intl.message(
      'All of your photos will be displayed here.',
      name: 'no_photo_desc',
      desc: '',
      args: [],
    );
  }

  /// `Biometric`
  String get biometric {
    return Intl.message(
      'Biometric',
      name: 'biometric',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your identity to access your account`
  String get biometric_message {
    return Intl.message(
      'Please confirm your identity to access your account',
      name: 'biometric_message',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, you have not activated Biometric`
  String get biometric_not_active {
    return Intl.message(
      'Sorry, you have not activated Biometric',
      name: 'biometric_not_active',
      desc: '',
      args: [],
    );
  }

  /// `Indonesian`
  String get bahasa_indonesia {
    return Intl.message(
      'Indonesian',
      name: 'bahasa_indonesia',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get error_title {
    return Intl.message(
      'Oops!',
      name: 'error_title',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknown_error {
    return Intl.message(
      'Unknown Error',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `You are connected to the internet`
  String get connected {
    return Intl.message(
      'You are connected to the internet',
      name: 'connected',
      desc: '',
      args: [],
    );
  }

  /// `Connection lost, please check your network`
  String get not_connected {
    return Intl.message(
      'Connection lost, please check your network',
      name: 'not_connected',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
