import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Definitions {
  static const String appName = "Mia Karaoke";
  static const String appVersion = "Version 1.0.0";
  static const int appVersionCode = 1;
  static const String appColor = "#ffd7167";
  static const String googleSansFamily = "GoogleSans";
  static bool isDebugMode = false;

  //* Colors
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static Color buttonsColor = Colors.blue[600];
  static Color symbolsColor = Colors.grey[500];
  static Color colorSample1 = Colors.blue[600];
  static Color colorSample2 = Color(0xff4bb17b);

  //*  Texts
  static const String loadingText = "Loading...";
  static const String tryAgainText = "Try Again";
  static const String someErrorText = "Some error";
  static const String signInText = "Sign In";
  static const String signInGoogleText = "Sign in with google";
  static const String signOutText = "Sign Out";
  static const String wrongText = "Something went wrong";
  static const String moreFeatureText = "More Features coming soon.";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";

  //* Preferences
  static SharedPreferences prefs;
  static const String loggedInPref = "loggedInPref1";
  static const String isAdminPref = "isAdminPref";
  static const String darkModePref = "darkModePref";
}
