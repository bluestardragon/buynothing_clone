
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 236 (118.0 per locale)
 *
 * Built on 2023-05-30 at 19:51 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	it, // 'it'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of translation).
///
/// Usage:
/// String a = translation.someKey.anotherKey;
/// String b = translation['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn _translation = _currLocale.translations;
_TranslationsEn get translation => _translation;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final translation = Translations.of(context); // Get translation variable.
/// String a = translation.someKey.anotherKey; // Use translation variable.
/// String b = translation['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TranslationsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_translation = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _TranslationsEn _translationsEn = _TranslationsEn.build();
late _TranslationsIt _translationsIt = _TranslationsIt.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_TranslationsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.it: return _translationsIt;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_TranslationsEn build() {
		switch (this) {
			case AppLocale.en: return _TranslationsEn.build();
			case AppLocale.it: return _TranslationsIt.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.it: return 'it';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.it: return const Locale.fromSubtags(languageCode: 'it');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'it': return AppLocale.it;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _TranslationsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsGenericEn generic = _TranslationsGenericEn._(_root);
	late final _TranslationsTextFieldValidationsEn textFieldValidations = _TranslationsTextFieldValidationsEn._(_root);
	late final _TranslationsTextFormFieldHintsEn textFormFieldHints = _TranslationsTextFormFieldHintsEn._(_root);
	late final _TranslationsTutorialEn tutorial = _TranslationsTutorialEn._(_root);
	late final _TranslationsProfilePageEn profilePage = _TranslationsProfilePageEn._(_root);
	late final _TranslationsSignupPageEn signupPage = _TranslationsSignupPageEn._(_root);
	late final _TranslationsLoginPageEn loginPage = _TranslationsLoginPageEn._(_root);
	late final _TranslationsAccessPageEn accessPage = _TranslationsAccessPageEn._(_root);
	late final _TranslationsHomePageEn homePage = _TranslationsHomePageEn._(_root);
	late final _TranslationsUpdatesPageEn updatesPage = _TranslationsUpdatesPageEn._(_root);
	late final _TranslationsPostDetailPageEn postDetailPage = _TranslationsPostDetailPageEn._(_root);
	late final _TranslationsPostCardEn postCard = _TranslationsPostCardEn._(_root);
}

// Path: generic
class _TranslationsGenericEn {
	_TranslationsGenericEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get next => 'Next';
	String get access => 'Access';
	String get notificationDefaultChannel => 'Incoming notifications';
	String get notificationDescriptionDefaultChannel => 'App updates';
	String get genericError => 'Unexpected error';
	String get genericError1 => 'At the moment it is not possible to change the email!';
	String get logout => 'Logout';
	String get continueTxt => 'Continue';
	String get skip => 'Skip';
	String get login => 'Login';
	String get signup => 'Signup';
	String get cancel => 'Cancel';
	String get username => 'Username';
	String get email => 'Email';
	String get password => 'Password';
	String get confirmEmail => 'Confirm email';
	String get confirmPassword => 'Confirm password';
	String get name => 'Name';
	String get surname => 'Surname';
	String get backToLogin => 'Back to Login';
	String get save => 'Save';
	String get deleteAddressDialogDescription => 'The address will be deleted forever.\nClick Continue to delete.';
	String get deletePaymentMethodDialogDescription => 'The payment method will be deleted forever.\nClick Continue to delete.';
	String get areYourSure => 'Are you sure?';
	String get profile => 'Profile';
	String get home => 'Home';
	String get updates => 'Updates';
	String get pwdResetSuccess => 'Password changed successfully';
	String get pwdUpdateFailed1 => 'Password change Failed. Current Password is wrong.Please check again.';
}

// Path: textFieldValidations
class _TranslationsTextFieldValidationsEn {
	_TranslationsTextFieldValidationsEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get textFormFieldEmpty => 'This field cannot be empty';
	String get maxLenght => 'The maximum length is';
	String get wrongCharacters => 'Invalid characters.';
	String get weakPassword => 'Password too weak';
	String get emailAlreadyInUse => 'This email is already in use';
	String get invalidEmail => 'Invalid email';
	String get emptySpace => 'You have entered a blank space in the email';
	String get passwordsDontMatch => 'Passwords do not match';
	String get emailsDontMatch => 'Emails do not match';
}

// Path: textFormFieldHints
class _TranslationsTextFormFieldHintsEn {
	_TranslationsTextFormFieldHintsEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get confirmNewPassword => 'Confirm Password';
	String get password => '\*******';
	String get insertNewPassword => 'New Password';
	String get insertOldPassword => 'Old Password';
	String get email => 'buynothingapp@gmail.com';
	String get name => 'Name';
	String get surname => 'Surname';
	String get editPassword => 'Edit password';
	String get listingTitle => 'Title';
	String get listingDesc => 'Description';
}

// Path: tutorial
class _TranslationsTutorialEn {
	_TranslationsTutorialEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get tutorialFirstMessageTitle => 'Siamo una startup specializzata\nin sviluppo mobile';
	String get tutorialFirstMessageDescription => 'nata dall\'incontro di Emanuel\nTesoriello e Martijn Duin';
	String get tutorialSecondMessageTitle => 'La nostra crew opera da tutto il\nmondo!';
	String get tutorialSecondMessageDescription => 'composta dai migliori sviluppatori di\ntutta Europa e sostenitrice del\nnomadismo digitale';
	String get tutorialThirdMessageTitle => 'Lo sviluppo Flutter è il nostro\npunto di forza';
	String get tutorialThirdMessageDescription => 'ma abbiamo assi nelle maniche che ci\npermettono di eccellere negli sviluppi\nreact, backend, IoT e molto altro...';
}

// Path: profilePage
class _TranslationsProfilePageEn {
	_TranslationsProfilePageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get editPersonalData => 'Modify personal data';
	String get settings => 'Settings';
	String get privacyPolicy => 'Privacy Policy';
	String get changeProfileImage => 'Change profile picture';
	String get username => 'Username';
	String get editPassword => 'Change Password';
	String get name => 'Name';
	String get surname => 'Surname';
	String get email => 'Email';
	String get city => 'City';
	String get genre => 'Genere';
	String get darkTheme => 'Alternative theme';
	String get darkThemeDescription => 'Try the app with a different color now!';
	String get accessibility => 'Accessibility';
	String get accessibilityDescription => 'Lorem ipsum dolor sic amet';
	String get aboutMe => 'About me';
	String get phoneNumber => 'Phone Number';
	String get nameAndSurname => 'Name and Surname';
	String get resetPassword => 'Reset password';
	String get changePersonalInfos => 'Change persoanl data';
}

// Path: signupPage
class _TranslationsSignupPageEn {
	_TranslationsSignupPageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get signupCompleted => 'Registration completed!';
	String get signup => 'Signup';
	String get acceptTermsAndConditions => 'I accept the terms and conditions of the service';
	String get privacyPolicy1 => 'I have read your privacy policy. 13 of the GDPR. I understood the purposes referred to in point 2.A and the legal bases for which the processing is necessary and legitimate, even without the consent of the data indicated as mandatory. With reference to the processing of my personal data, for which consent is required as explained in the methods and purposes indicated';
	String get privacyPolicy2B0 => 'I consent to the processing of other particular data necessary for the services requested';
	String get privacyPolicy2B1 => 'Data processing to improve services';
	String get privacyPolicy2B2 => 'Marketing and/or commercial';
	String get privacyPolicy2B3 => 'Semi-automated profiling - aimed at sending nutrition advice and/or specific promotional offers relevant to the diet goals of registered data subjects';
	String get checkEmail => 'Check your email!';
	String get sentToEmail => 'We have sent an email with a confirmation link\n to this email:';
	String get checkSpam => 'If you don\'t receive it within 5 minutes,\nplease check your spam.';
	String get notReceived => 'Didn\'t receive the email?';
	String get sendAgain => 'Resubmit';
	String get gdpr => 'Manifestation of data processing consent - Privacy - (GDPR 679/2016)';
	String get acceptPrivacy => 'To continue accept our Terms and Conditions and our Privacy Policy';
	String get privacyTitle => 'Privacy and personal data';
}

// Path: loginPage
class _TranslationsLoginPageEn {
	_TranslationsLoginPageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Login';
	String get loginPageDescription => 'Lorem ipsum dolor sic amet';
	String get forgotPassword => 'Forgot password?';
	String get recoverPassword => 'Recover password';
	String get insertEmailToRecoverPwd => 'Enter the email for which you want to recover the password.';
	String get recover => 'Recover';
	String get newUser => 'New user?';
	String get noUserFoundForThisEmail => 'No users with this email were found';
	String get wrongPasswordForThisUser => 'The password entered is incorrect';
	String get notVerifiedEmail => 'Unverified email for this user';
	String get tooManyAccessTempt => 'Warning, you have made too many login attempts. Please try again later.';
	String get errorInSendingNewPassword => 'There was an error sending your new password';
	String get messageInSendingNewPassword => 'We have sent a password recovery email';
	String get noUserFoundForRecoverPassword => 'No users found for the entered email';
	String get email => 'Email';
	String get password => 'Password';
	String get dontHaveAnAccount => 'Do not have an account?';
	String get signupHere => 'Register here';
	String get orAccessWith => 'Or log in with';
}

// Path: accessPage
class _TranslationsAccessPageEn {
	_TranslationsAccessPageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get doYouAlreadyHaveAnAccount => 'Do you already have an account?';
	String get access => 'Log in';
	String get title => 'Register and reach your \ngoals with us!';
	String get description => 'Your personal crew at the cost of an\employee, to support your \nproject!';
}

// Path: homePage
class _TranslationsHomePageEn {
	_TranslationsHomePageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get welcome => 'Welcome';
	String get title => 'This is the\nGeniusArchitecture boilerplate!';
	String get subtitle => 'This is what you have available:';
}

// Path: updatesPage
class _TranslationsUpdatesPageEn {
	_TranslationsUpdatesPageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Here are all the latest posts by GeniusCrew';
	String get addLbl => 'Add Listing';
}

// Path: postDetailPage
class _TranslationsPostDetailPageEn {
	_TranslationsPostDetailPageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Update';
	String get postedOn => 'Posted on';
}

// Path: postCard
class _TranslationsPostCardEn {
	_TranslationsPostCardEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get postedOn => 'Posted on';
}

// Path: <root>
class _TranslationsIt extends _TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsIt.build()
		: super.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key] ?? super._flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _TranslationsIt _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsGenericIt generic = _TranslationsGenericIt._(_root);
	@override late final _TranslationsTextFieldValidationsIt textFieldValidations = _TranslationsTextFieldValidationsIt._(_root);
	@override late final _TranslationsTextFormFieldHintsIt textFormFieldHints = _TranslationsTextFormFieldHintsIt._(_root);
	@override late final _TranslationsTutorialIt tutorial = _TranslationsTutorialIt._(_root);
	@override late final _TranslationsProfilePageIt profilePage = _TranslationsProfilePageIt._(_root);
	@override late final _TranslationsSignupPageIt signupPage = _TranslationsSignupPageIt._(_root);
	@override late final _TranslationsLoginPageIt loginPage = _TranslationsLoginPageIt._(_root);
	@override late final _TranslationsAccessPageIt accessPage = _TranslationsAccessPageIt._(_root);
	@override late final _TranslationsHomePageIt homePage = _TranslationsHomePageIt._(_root);
	@override late final _TranslationsUpdatesPageIt updatesPage = _TranslationsUpdatesPageIt._(_root);
	@override late final _TranslationsPostDetailPageIt postDetailPage = _TranslationsPostDetailPageIt._(_root);
	@override late final _TranslationsPostCardIt postCard = _TranslationsPostCardIt._(_root);
}

// Path: generic
class _TranslationsGenericIt extends _TranslationsGenericEn {
	_TranslationsGenericIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get next => 'Avanti';
	@override String get access => 'Accedi';
	@override String get notificationDefaultChannel => 'Notifiche in arrivo';
	@override String get notificationDescriptionDefaultChannel => 'Aggiornamenti sull\' app @@';
	@override String get genericError => 'Errore imprevisto';
	@override String get logout => 'Logout';
	@override String get continueTxt => 'Continua';
	@override String get skip => 'Salta';
	@override String get login => 'Accedi';
	@override String get signup => 'Signup';
	@override String get cancel => 'Annulla';
	@override String get username => 'Username';
	@override String get email => 'Email';
	@override String get password => 'Password';
	@override String get confirmEmail => 'Conferma email';
	@override String get confirmPassword => 'Conferma password';
	@override String get name => 'Nome';
	@override String get surname => 'Cognome';
	@override String get backToLogin => 'Torna alla login';
	@override String get save => 'Salva';
	@override String get deleteAddressDialogDescription => 'L\'indirizzo verrà eliminato per sempre.\nClicca su Continua per eliminare.';
	@override String get deletePaymentMethodDialogDescription => 'Il metodo di pagamento verrà eliminato per sempre.\nClicca su Continua per eliminare.';
	@override String get areYourSure => 'Sei sicuro?';
	@override String get profile => 'Profilo';
	@override String get home => 'Home';
	@override String get updates => 'Aggiornamenti';
}

// Path: textFieldValidations
class _TranslationsTextFieldValidationsIt extends _TranslationsTextFieldValidationsEn {
	_TranslationsTextFieldValidationsIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get textFormFieldEmpty => 'Questo campo non può essere vuoto';
	@override String get maxLenght => 'La lunghezza massima è di @@ caratteri';
	@override String get wrongCharacters => 'Caratteri non validi.';
	@override String get weakPassword => 'Password troppo debole';
	@override String get emailAlreadyInUse => 'Questa mail è già in uso';
	@override String get invalidEmail => 'Email non valida';
	@override String get emptySpace => 'Hai inserito uno spazio vuoto nella mail';
	@override String get passwordsDontMatch => 'Le password non corrispondono';
	@override String get emailsDontMatch => 'Le email non corrispondono';
}

// Path: textFormFieldHints
class _TranslationsTextFormFieldHintsIt extends _TranslationsTextFormFieldHintsEn {
	_TranslationsTextFormFieldHintsIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get confirmNewPassword => 'Conferma la password';
	@override String get password => '\*******';
	@override String get insertNewPassword => 'Nuova password';
	@override String get insertOldPassword => 'Vecchia password';
	@override String get email => 'Es. nome.cognome@email.com';
	@override String get name => 'Nome';
	@override String get surname => 'Cognome';
	@override String get editPassword => 'Cambia password';
}

// Path: tutorial
class _TranslationsTutorialIt extends _TranslationsTutorialEn {
	_TranslationsTutorialIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get tutorialFirstMessageTitle => 'Siamo una startup specializzata\nin sviluppo mobile';
	@override String get tutorialFirstMessageDescription => 'nata dall\'incontro di Emanuel\nTesoriello e Martijn Duin';
	@override String get tutorialSecondMessageTitle => 'La nostra crew opera da tutto il\nmondo!';
	@override String get tutorialSecondMessageDescription => 'composta dai migliori sviluppatori di\ntutta Europa e sostenitrice del\nnomadismo digitale';
	@override String get tutorialThirdMessageTitle => 'Lo sviluppo Flutter è il nostro\npunto di forza';
	@override String get tutorialThirdMessageDescription => 'ma abbiamo assi nelle maniche che ci\npermettono di eccellere negli sviluppi\nreact, backend, IoT e molto altro...';
}

// Path: profilePage
class _TranslationsProfilePageIt extends _TranslationsProfilePageEn {
	_TranslationsProfilePageIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get editPersonalData => 'Modifica dati personali';
	@override String get settings => 'Impostazioni';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get changeProfileImage => 'Cambia immagine del profilo';
	@override String get username => 'Username';
	@override String get editPassword => 'Modifica password';
	@override String get name => 'Nome';
	@override String get surname => 'Cognome';
	@override String get email => 'Email';
	@override String get city => 'Città';
	@override String get genre => 'Genere';
	@override String get darkTheme => 'Tema alternativo';
	@override String get darkThemeDescription => 'Prova ora l\'app con un colore diverso!';
	@override String get accessibility => 'Accessibilità';
	@override String get accessibilityDescription => 'Lorem ipsum dolor sic amet';
	@override String get aboutMe => 'About me';
	@override String get phoneNumber => 'Numero di telefono';
	@override String get nameAndSurname => 'Nome e cognome';
	@override String get resetPassword => 'Reset password';
	@override String get changePersonalInfos => 'Modifica informazioni personali';
}

// Path: signupPage
class _TranslationsSignupPageIt extends _TranslationsSignupPageEn {
	_TranslationsSignupPageIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get signupCompleted => 'Registrazione completata!';
	@override String get signup => 'Registrati';
	@override String get acceptTermsAndConditions => 'Accetto termini e condizioni del servizio';
	@override String get privacyPolicy1 => 'Ho letto la vostra informativa sulla privacy ai sensi dell’art. 13 del GDPR. Ho compreso le finalità di cui al punto 2.A e le basi giuridiche per cui è necessario il trattamento e legittimo, anche senza il consenso dei soli dati indicati come obbligatori. In riferimento al trattamento dei miei dati personali, per cui si richiede il consenso come esplicitato nelle modalità e finalità indicate';
	@override String get privacyPolicy2B0 => 'Acconsento al trattamento di altri dati particolari necessari per i servizi richiesti';
	@override String get privacyPolicy2B1 => 'Trattamento dei dati per migliorare i servizi';
	@override String get privacyPolicy2B2 => 'Marketing e/o commerciali';
	@override String get privacyPolicy2B3 => 'Profilazione semi-automatizzata - finalizzate all\'invio di consigli sulla nutrizione e/o offerte promozionali specifiche pertinenti agli obiettivi delle diete degli interessati registrati';
	@override String get checkEmail => 'Controlla la tua mail!';
	@override String get sentToEmail => 'Abbiamo inviato una mail con un link di conferma\na questa mail:';
	@override String get checkSpam => 'Se non la ricevi entro 5 minuti,\nperfavore controlla nello Spam.';
	@override String get notReceived => 'Non hai ricevuto l\'email?';
	@override String get sendAgain => 'Invia di nuovo';
	@override String get gdpr => 'Manifestazione del consenso trattamento dati – Privacy - (GDPR 679/2016)';
	@override String get acceptPrivacy => 'Per continuare accetta i nostri Termini e condizioni e la nostra Privacy Policy';
	@override String get privacyTitle => 'Privacy e dati personali';
}

// Path: loginPage
class _TranslationsLoginPageIt extends _TranslationsLoginPageEn {
	_TranslationsLoginPageIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override String get loginPageDescription => 'Lorem ipsum dolor sic amet';
	@override String get forgotPassword => 'Hai dimenticato la password?';
	@override String get recoverPassword => 'Recupera password';
	@override String get insertEmailToRecoverPwd => 'Inserisci l\'email per cui vuoi recuperare la password.';
	@override String get recover => 'Recupera';
	@override String get newUser => 'Nuovo utente?';
	@override String get noUserFoundForThisEmail => 'Non è stato trovato nessun utente con questa email';
	@override String get wrongPasswordForThisUser => 'La password inserita non è corretta';
	@override String get notVerifiedEmail => 'Email non verificata per questo utente';
	@override String get tooManyAccessTempt => 'Attenzione hai fatto troppi tentativi di accesso. Per favore riprova più tardi.';
	@override String get errorInSendingNewPassword => 'C\'è stato un errore nell\'invio della nuova password';
	@override String get messageInSendingNewPassword => 'Abbiamo inviato un\'email per il recupero della password';
	@override String get noUserFoundForRecoverPassword => 'Nessun utente trovato per l\'email inserita';
	@override String get email => 'Email';
	@override String get password => 'Password';
	@override String get dontHaveAnAccount => 'Non hai un account?';
	@override String get signupHere => 'Registrati qui';
	@override String get orAccessWith => 'Oppure accedi con';
}

// Path: accessPage
class _TranslationsAccessPageIt extends _TranslationsAccessPageEn {
	_TranslationsAccessPageIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get doYouAlreadyHaveAnAccount => 'Hai già un account?';
	@override String get access => 'Accedi';
	@override String get title => 'Registrati e raggiungi i tuoi\nobiettivi con noi!';
	@override String get description => 'La tua crew personale al costo di un\ndipendente, a supporto del tuo\nprogetto!';
}

// Path: homePage
class _TranslationsHomePageIt extends _TranslationsHomePageEn {
	_TranslationsHomePageIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Benvenuto';
	@override String get title => 'Questo è il boilerplate della\nGeniusArchitecture!';
	@override String get subtitle => 'Questo è quello che hai a disposizione:';
}

// Path: updatesPage
class _TranslationsUpdatesPageIt extends _TranslationsUpdatesPageEn {
	_TranslationsUpdatesPageIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ecco tutti gli ultimi post by GeniusCrew';
}

// Path: postDetailPage
class _TranslationsPostDetailPageIt extends _TranslationsPostDetailPageEn {
	_TranslationsPostDetailPageIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Update';
	@override String get postedOn => 'Pubblicato il';
}

// Path: postCard
class _TranslationsPostCardIt extends _TranslationsPostCardEn {
	_TranslationsPostCardIt._(_TranslationsIt root) : this._root = root, super._(root);

	@override final _TranslationsIt _root; // ignore: unused_field

	// Translations
	@override String get postedOn => 'Pubblicato il';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'generic.next': 'Next',
			'generic.access': 'Access',
			'generic.notificationDefaultChannel': 'Incoming notifications',
			'generic.notificationDescriptionDefaultChannel': 'App updates',
			'generic.genericError': 'Unexpected error',
			'generic.genericError1': 'At the moment it is not possible to change the email!',
			'generic.logout': 'Logout',
			'generic.continueTxt': 'Continue',
			'generic.skip': 'Skip',
			'generic.login': 'Login',
			'generic.signup': 'Signup',
			'generic.cancel': 'Cancel',
			'generic.username': 'Username',
			'generic.email': 'Email',
			'generic.password': 'Password',
			'generic.confirmEmail': 'Confirm email',
			'generic.confirmPassword': 'Confirm password',
			'generic.name': 'Name',
			'generic.surname': 'Surname',
			'generic.backToLogin': 'Back to Login',
			'generic.save': 'Save',
			'generic.deleteAddressDialogDescription': 'The address will be deleted forever.\nClick Continue to delete.',
			'generic.deletePaymentMethodDialogDescription': 'The payment method will be deleted forever.\nClick Continue to delete.',
			'generic.areYourSure': 'Are you sure?',
			'generic.profile': 'Profile',
			'generic.home': 'Home',
			'generic.updates': 'Updates',
			'generic.pwdResetSuccess': 'Password changed successfully',
			'generic.pwdUpdateFailed1': 'Password change Failed. Current Password is wrong.Please check again.',
			'textFieldValidations.textFormFieldEmpty': 'This field cannot be empty',
			'textFieldValidations.maxLenght': 'The maximum length is',
			'textFieldValidations.wrongCharacters': 'Invalid characters.',
			'textFieldValidations.weakPassword': 'Password too weak',
			'textFieldValidations.emailAlreadyInUse': 'This email is already in use',
			'textFieldValidations.invalidEmail': 'Invalid email',
			'textFieldValidations.emptySpace': 'You have entered a blank space in the email',
			'textFieldValidations.passwordsDontMatch': 'Passwords do not match',
			'textFieldValidations.emailsDontMatch': 'Emails do not match',
			'textFormFieldHints.confirmNewPassword': 'Confirm Password',
			'textFormFieldHints.password': '\*******',
			'textFormFieldHints.insertNewPassword': 'New Password',
			'textFormFieldHints.insertOldPassword': 'Old Password',
			'textFormFieldHints.email': 'buynothingapp@gmail.com',
			'textFormFieldHints.name': 'Name',
			'textFormFieldHints.surname': 'Surname',
			'textFormFieldHints.editPassword': 'Edit password',
			'textFormFieldHints.listingTitle': 'Title',
			'textFormFieldHints.listingDesc': 'Description',
			'tutorial.tutorialFirstMessageTitle': 'Siamo una startup specializzata\nin sviluppo mobile',
			'tutorial.tutorialFirstMessageDescription': 'nata dall\'incontro di Emanuel\nTesoriello e Martijn Duin',
			'tutorial.tutorialSecondMessageTitle': 'La nostra crew opera da tutto il\nmondo!',
			'tutorial.tutorialSecondMessageDescription': 'composta dai migliori sviluppatori di\ntutta Europa e sostenitrice del\nnomadismo digitale',
			'tutorial.tutorialThirdMessageTitle': 'Lo sviluppo Flutter è il nostro\npunto di forza',
			'tutorial.tutorialThirdMessageDescription': 'ma abbiamo assi nelle maniche che ci\npermettono di eccellere negli sviluppi\nreact, backend, IoT e molto altro...',
			'profilePage.editPersonalData': 'Modify personal data',
			'profilePage.settings': 'Settings',
			'profilePage.privacyPolicy': 'Privacy Policy',
			'profilePage.changeProfileImage': 'Change profile picture',
			'profilePage.username': 'Username',
			'profilePage.editPassword': 'Change Password',
			'profilePage.name': 'Name',
			'profilePage.surname': 'Surname',
			'profilePage.email': 'Email',
			'profilePage.city': 'City',
			'profilePage.genre': 'Genere',
			'profilePage.darkTheme': 'Alternative theme',
			'profilePage.darkThemeDescription': 'Try the app with a different color now!',
			'profilePage.accessibility': 'Accessibility',
			'profilePage.accessibilityDescription': 'Lorem ipsum dolor sic amet',
			'profilePage.aboutMe': 'About me',
			'profilePage.phoneNumber': 'Phone Number',
			'profilePage.nameAndSurname': 'Name and Surname',
			'profilePage.resetPassword': 'Reset password',
			'profilePage.changePersonalInfos': 'Change persoanl data',
			'signupPage.signupCompleted': 'Registration completed!',
			'signupPage.signup': 'Signup',
			'signupPage.acceptTermsAndConditions': 'I accept the terms and conditions of the service',
			'signupPage.privacyPolicy1': 'I have read your privacy policy. 13 of the GDPR. I understood the purposes referred to in point 2.A and the legal bases for which the processing is necessary and legitimate, even without the consent of the data indicated as mandatory. With reference to the processing of my personal data, for which consent is required as explained in the methods and purposes indicated',
			'signupPage.privacyPolicy2B0': 'I consent to the processing of other particular data necessary for the services requested',
			'signupPage.privacyPolicy2B1': 'Data processing to improve services',
			'signupPage.privacyPolicy2B2': 'Marketing and/or commercial',
			'signupPage.privacyPolicy2B3': 'Semi-automated profiling - aimed at sending nutrition advice and/or specific promotional offers relevant to the diet goals of registered data subjects',
			'signupPage.checkEmail': 'Check your email!',
			'signupPage.sentToEmail': 'We have sent an email with a confirmation link\n to this email:',
			'signupPage.checkSpam': 'If you don\'t receive it within 5 minutes,\nplease check your spam.',
			'signupPage.notReceived': 'Didn\'t receive the email?',
			'signupPage.sendAgain': 'Resubmit',
			'signupPage.gdpr': 'Manifestation of data processing consent - Privacy - (GDPR 679/2016)',
			'signupPage.acceptPrivacy': 'To continue accept our Terms and Conditions and our Privacy Policy',
			'signupPage.privacyTitle': 'Privacy and personal data',
			'loginPage.title': 'Login',
			'loginPage.loginPageDescription': 'Lorem ipsum dolor sic amet',
			'loginPage.forgotPassword': 'Forgot password?',
			'loginPage.recoverPassword': 'Recover password',
			'loginPage.insertEmailToRecoverPwd': 'Enter the email for which you want to recover the password.',
			'loginPage.recover': 'Recover',
			'loginPage.newUser': 'New user?',
			'loginPage.noUserFoundForThisEmail': 'No users with this email were found',
			'loginPage.wrongPasswordForThisUser': 'The password entered is incorrect',
			'loginPage.notVerifiedEmail': 'Unverified email for this user',
			'loginPage.tooManyAccessTempt': 'Warning, you have made too many login attempts. Please try again later.',
			'loginPage.errorInSendingNewPassword': 'There was an error sending your new password',
			'loginPage.messageInSendingNewPassword': 'We have sent a password recovery email',
			'loginPage.noUserFoundForRecoverPassword': 'No users found for the entered email',
			'loginPage.email': 'Email',
			'loginPage.password': 'Password',
			'loginPage.dontHaveAnAccount': 'Do not have an account?',
			'loginPage.signupHere': 'Register here',
			'loginPage.orAccessWith': 'Or log in with',
			'accessPage.doYouAlreadyHaveAnAccount': 'Do you already have an account?',
			'accessPage.access': 'Log in',
			'accessPage.title': 'Register and reach your \ngoals with us!',
			'accessPage.description': 'Your personal crew at the cost of an\employee, to support your \nproject!',
			'homePage.welcome': 'Welcome',
			'homePage.title': 'This is the\nGeniusArchitecture boilerplate!',
			'homePage.subtitle': 'This is what you have available:',
			'updatesPage.title': 'Here are all the latest posts by GeniusCrew',
			'updatesPage.addLbl': 'Add Listing',
			'postDetailPage.title': 'Update',
			'postDetailPage.postedOn': 'Posted on',
			'postCard.postedOn': 'Posted on',
		};
	}
}

extension on _TranslationsIt {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'generic.next': 'Avanti',
			'generic.access': 'Accedi',
			'generic.notificationDefaultChannel': 'Notifiche in arrivo',
			'generic.notificationDescriptionDefaultChannel': 'Aggiornamenti sull\' app @@',
			'generic.genericError': 'Errore imprevisto',
			'generic.logout': 'Logout',
			'generic.continueTxt': 'Continua',
			'generic.skip': 'Salta',
			'generic.login': 'Accedi',
			'generic.signup': 'Signup',
			'generic.cancel': 'Annulla',
			'generic.username': 'Username',
			'generic.email': 'Email',
			'generic.password': 'Password',
			'generic.confirmEmail': 'Conferma email',
			'generic.confirmPassword': 'Conferma password',
			'generic.name': 'Nome',
			'generic.surname': 'Cognome',
			'generic.backToLogin': 'Torna alla login',
			'generic.save': 'Salva',
			'generic.deleteAddressDialogDescription': 'L\'indirizzo verrà eliminato per sempre.\nClicca su Continua per eliminare.',
			'generic.deletePaymentMethodDialogDescription': 'Il metodo di pagamento verrà eliminato per sempre.\nClicca su Continua per eliminare.',
			'generic.areYourSure': 'Sei sicuro?',
			'generic.profile': 'Profilo',
			'generic.home': 'Home',
			'generic.updates': 'Aggiornamenti',
			'textFieldValidations.textFormFieldEmpty': 'Questo campo non può essere vuoto',
			'textFieldValidations.maxLenght': 'La lunghezza massima è di @@ caratteri',
			'textFieldValidations.wrongCharacters': 'Caratteri non validi.',
			'textFieldValidations.weakPassword': 'Password troppo debole',
			'textFieldValidations.emailAlreadyInUse': 'Questa mail è già in uso',
			'textFieldValidations.invalidEmail': 'Email non valida',
			'textFieldValidations.emptySpace': 'Hai inserito uno spazio vuoto nella mail',
			'textFieldValidations.passwordsDontMatch': 'Le password non corrispondono',
			'textFieldValidations.emailsDontMatch': 'Le email non corrispondono',
			'textFormFieldHints.confirmNewPassword': 'Conferma la password',
			'textFormFieldHints.password': '\*******',
			'textFormFieldHints.insertNewPassword': 'Nuova password',
			'textFormFieldHints.insertOldPassword': 'Vecchia password',
			'textFormFieldHints.email': 'Es. nome.cognome@email.com',
			'textFormFieldHints.name': 'Nome',
			'textFormFieldHints.surname': 'Cognome',
			'textFormFieldHints.editPassword': 'Cambia password',
			'tutorial.tutorialFirstMessageTitle': 'Siamo una startup specializzata\nin sviluppo mobile',
			'tutorial.tutorialFirstMessageDescription': 'nata dall\'incontro di Emanuel\nTesoriello e Martijn Duin',
			'tutorial.tutorialSecondMessageTitle': 'La nostra crew opera da tutto il\nmondo!',
			'tutorial.tutorialSecondMessageDescription': 'composta dai migliori sviluppatori di\ntutta Europa e sostenitrice del\nnomadismo digitale',
			'tutorial.tutorialThirdMessageTitle': 'Lo sviluppo Flutter è il nostro\npunto di forza',
			'tutorial.tutorialThirdMessageDescription': 'ma abbiamo assi nelle maniche che ci\npermettono di eccellere negli sviluppi\nreact, backend, IoT e molto altro...',
			'profilePage.editPersonalData': 'Modifica dati personali',
			'profilePage.settings': 'Impostazioni',
			'profilePage.privacyPolicy': 'Privacy Policy',
			'profilePage.changeProfileImage': 'Cambia immagine del profilo',
			'profilePage.username': 'Username',
			'profilePage.editPassword': 'Modifica password',
			'profilePage.name': 'Nome',
			'profilePage.surname': 'Cognome',
			'profilePage.email': 'Email',
			'profilePage.city': 'Città',
			'profilePage.genre': 'Genere',
			'profilePage.darkTheme': 'Tema alternativo',
			'profilePage.darkThemeDescription': 'Prova ora l\'app con un colore diverso!',
			'profilePage.accessibility': 'Accessibilità',
			'profilePage.accessibilityDescription': 'Lorem ipsum dolor sic amet',
			'profilePage.aboutMe': 'About me',
			'profilePage.phoneNumber': 'Numero di telefono',
			'profilePage.nameAndSurname': 'Nome e cognome',
			'profilePage.resetPassword': 'Reset password',
			'profilePage.changePersonalInfos': 'Modifica informazioni personali',
			'signupPage.signupCompleted': 'Registrazione completata!',
			'signupPage.signup': 'Registrati',
			'signupPage.acceptTermsAndConditions': 'Accetto termini e condizioni del servizio',
			'signupPage.privacyPolicy1': 'Ho letto la vostra informativa sulla privacy ai sensi dell’art. 13 del GDPR. Ho compreso le finalità di cui al punto 2.A e le basi giuridiche per cui è necessario il trattamento e legittimo, anche senza il consenso dei soli dati indicati come obbligatori. In riferimento al trattamento dei miei dati personali, per cui si richiede il consenso come esplicitato nelle modalità e finalità indicate',
			'signupPage.privacyPolicy2B0': 'Acconsento al trattamento di altri dati particolari necessari per i servizi richiesti',
			'signupPage.privacyPolicy2B1': 'Trattamento dei dati per migliorare i servizi',
			'signupPage.privacyPolicy2B2': 'Marketing e/o commerciali',
			'signupPage.privacyPolicy2B3': 'Profilazione semi-automatizzata - finalizzate all\'invio di consigli sulla nutrizione e/o offerte promozionali specifiche pertinenti agli obiettivi delle diete degli interessati registrati',
			'signupPage.checkEmail': 'Controlla la tua mail!',
			'signupPage.sentToEmail': 'Abbiamo inviato una mail con un link di conferma\na questa mail:',
			'signupPage.checkSpam': 'Se non la ricevi entro 5 minuti,\nperfavore controlla nello Spam.',
			'signupPage.notReceived': 'Non hai ricevuto l\'email?',
			'signupPage.sendAgain': 'Invia di nuovo',
			'signupPage.gdpr': 'Manifestazione del consenso trattamento dati – Privacy - (GDPR 679/2016)',
			'signupPage.acceptPrivacy': 'Per continuare accetta i nostri Termini e condizioni e la nostra Privacy Policy',
			'signupPage.privacyTitle': 'Privacy e dati personali',
			'loginPage.title': 'Login',
			'loginPage.loginPageDescription': 'Lorem ipsum dolor sic amet',
			'loginPage.forgotPassword': 'Hai dimenticato la password?',
			'loginPage.recoverPassword': 'Recupera password',
			'loginPage.insertEmailToRecoverPwd': 'Inserisci l\'email per cui vuoi recuperare la password.',
			'loginPage.recover': 'Recupera',
			'loginPage.newUser': 'Nuovo utente?',
			'loginPage.noUserFoundForThisEmail': 'Non è stato trovato nessun utente con questa email',
			'loginPage.wrongPasswordForThisUser': 'La password inserita non è corretta',
			'loginPage.notVerifiedEmail': 'Email non verificata per questo utente',
			'loginPage.tooManyAccessTempt': 'Attenzione hai fatto troppi tentativi di accesso. Per favore riprova più tardi.',
			'loginPage.errorInSendingNewPassword': 'C\'è stato un errore nell\'invio della nuova password',
			'loginPage.messageInSendingNewPassword': 'Abbiamo inviato un\'email per il recupero della password',
			'loginPage.noUserFoundForRecoverPassword': 'Nessun utente trovato per l\'email inserita',
			'loginPage.email': 'Email',
			'loginPage.password': 'Password',
			'loginPage.dontHaveAnAccount': 'Non hai un account?',
			'loginPage.signupHere': 'Registrati qui',
			'loginPage.orAccessWith': 'Oppure accedi con',
			'accessPage.doYouAlreadyHaveAnAccount': 'Hai già un account?',
			'accessPage.access': 'Accedi',
			'accessPage.title': 'Registrati e raggiungi i tuoi\nobiettivi con noi!',
			'accessPage.description': 'La tua crew personale al costo di un\ndipendente, a supporto del tuo\nprogetto!',
			'homePage.welcome': 'Benvenuto',
			'homePage.title': 'Questo è il boilerplate della\nGeniusArchitecture!',
			'homePage.subtitle': 'Questo è quello che hai a disposizione:',
			'updatesPage.title': 'Ecco tutti gli ultimi post by GeniusCrew',
			'postDetailPage.title': 'Update',
			'postDetailPage.postedOn': 'Pubblicato il',
			'postCard.postedOn': 'Pubblicato il',
		};
	}
}
