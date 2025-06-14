import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @welcomeT.
  ///
  /// In en, this message translates to:
  /// **'Welcome to vento soffio '**
  String get welcomeT;

  /// No description provided for @companyIntroduction.
  ///
  /// In en, this message translates to:
  /// **'Vento Soffio is a dynamic software development company specializing in delivering innovative digital solutions. The company offers a wide range of services, including mobile application development, web design and development, IT solutions, and robust back-end systems. With a focus     n innovation, quality, and client satisfaction, Vento Soffio helps businesses transform their digital presence and achieve their technological goal web design and development, IT solutions, and robust back-end systems. With a focus     n innovation, quality, and client satisfaction, Vento Soffio helps businesses transform their digital presence and achieve their technological goal'**
  String get companyIntroduction;

  /// No description provided for @service.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get service;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @requestService.
  ///
  /// In en, this message translates to:
  /// **'Request Service'**
  String get requestService;

  /// No description provided for @customerService.
  ///
  /// In en, this message translates to:
  /// **'Customer Service'**
  String get customerService;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @mission.
  ///
  /// In en, this message translates to:
  /// **'% Completed'**
  String get mission;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @mobileDescription.
  ///
  /// In en, this message translates to:
  /// **'\'A mobile application is a software program specifically developed to run on mobile devices such as smartphones and tablets.It aims to provide various services or functions that meet user needs in different fields, such as social networking, entertainment,e-commerce, education, health, productivity, and gaming Mobile apps are known for their ease of access and faster performance compared to websites, as they can often be use without a constant internet connection. These applications are developed using various programming languages and technologies such as Flutter and React Native, or native languages like Java and Kotlin for Android and Swift for iOS.The development process of mobile applications involves several stages, starting from user interface and without a constant internet connection. '**
  String get mobileDescription;

  /// No description provided for @uiUxDescription.
  ///
  /// In en, this message translates to:
  /// **'UI and UX are two essential parts of designing any app or website, but they each have a different focus.UI (User Interface) is the visual part the user sees and interacts with — buttons, colors, fonts, spacing — in short, how it looks.UX (User Experience), on the other hand, is about how it feels. It’s the overall experience a user has while using the product. Was it smooth? Easy to understand? Could they find what they were looking for quickly?The two work hand-in-hand: a product might look great (good UI), but if it’s hard to use or confusing (bad UX), users will still be frustrated. Likewise, even if the experience is well thought-out, if it looks ugly or unappealing, it won’t attract users.So, a good balance between UI and UX is what makes a product truly successful.'**
  String get uiUxDescription;

  /// No description provided for @backEndDescription.
  ///
  /// In en, this message translates to:
  /// **'The back-end is the invisible part of any website or application that the user doesn\'t see, but it\'s where all the real work happens. When you log in to a site, send a message, or make a purchase, it\'s the back-end that receives your request, checks the data in the database, processes the logic, and then sends back the result.You can think of the back-end as the brain and logic behind everything. It handles storing, updating, deleting, and processing information. Without it, the front-end (what you see) would just be an empty shell — nice to look at, but not functional.'**
  String get backEndDescription;

  /// No description provided for @webDescription.
  ///
  /// In en, this message translates to:
  /// **'Websites are digital pages you can visit through the internet, whether you\'re on a phone or a computer. A website can be as simple as a blog with a few articles, or as complex as an e-commerce platform where you shop and interact with services.A website is mainly made up of two parts: the front-end (what you see and interact with) and the back-end (what works behind the scenes to make everything function smoothly). Web pages are built using technologies like HTML, CSS, and JavaScript, and they often connect to backend systems that manage data.The main purpose of a website is to provide a service, deliver information, or make it easier for people to do something online instead of physically. For example, instead of going to a store, you can go to their website, place an order, and have it delivered to your door.'**
  String get webDescription;

  /// No description provided for @itDescription.
  ///
  /// In en, this message translates to:
  /// **'IT, or Information Technology, is the field that handles everything related to computers, networks, and digital systems within companies and organizations. When a business wants to manage its operations, protect its data, or help employees work smoothly together — that’s where IT comes in.This field covers tasks like server management, network security, hardware maintenance, database handling, and technical support. It also involves organizing access to information and offering smart solutions that boost productivity.Simply put, if a company were a body, IT would be the nervous system — connecting everything and keeping it running smoothly.'**
  String get itDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
