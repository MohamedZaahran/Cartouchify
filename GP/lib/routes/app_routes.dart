import 'package:hierosecret/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:hierosecret/presentation/onboarding_screen/binding/onboarding_binding.dart';
import 'package:hierosecret/presentation/big_size_background_screen/big_size_background_screen.dart';
import 'package:hierosecret/presentation/big_size_background_screen/binding/big_size_background_binding.dart';
import 'package:hierosecret/presentation/regular_screen/regular_screen.dart';
import 'package:hierosecret/presentation/regular_screen/binding/regular_binding.dart';
import 'package:hierosecret/presentation/register_screen/register_screen.dart';
import 'package:hierosecret/presentation/register_screen/binding/register_binding.dart';
import 'package:hierosecret/presentation/register_wrong_inputs_screen/register_wrong_inputs_screen.dart';
import 'package:hierosecret/presentation/register_wrong_inputs_screen/binding/register_wrong_inputs_binding.dart';
import 'package:hierosecret/presentation/login_screen/login_screen.dart';
import 'package:hierosecret/presentation/login_screen/binding/login_binding.dart';
import 'package:hierosecret/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:hierosecret/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:hierosecret/presentation/forgot_password_email_sent_screen/forgot_password_email_sent_screen.dart';
import 'package:hierosecret/presentation/forgot_password_email_sent_screen/binding/forgot_password_email_sent_binding.dart';
import 'package:hierosecret/presentation/forgot_password_verified_email_screen/forgot_password_verified_email_screen.dart';
import 'package:hierosecret/presentation/forgot_password_verified_email_screen/binding/forgot_password_verified_email_binding.dart';
import 'package:hierosecret/presentation/home_onboarding_screen/home_onboarding_screen.dart';
import 'package:hierosecret/presentation/home_onboarding_screen/binding/home_onboarding_binding.dart';
import 'package:hierosecret/presentation/scanning_screen/scanning_screen.dart';
import 'package:hierosecret/presentation/scanning_screen/binding/scanning_binding.dart';
import 'package:hierosecret/presentation/scanning_screen_black_screen/scanning_screen_black_screen.dart';
import 'package:hierosecret/presentation/scanning_screen_black_screen/binding/scanning_screen_black_binding.dart';
import 'package:hierosecret/presentation/home_container_screen/home_container_screen.dart';
import 'package:hierosecret/presentation/home_container_screen/binding/home_container_binding.dart';
import 'package:hierosecret/presentation/profile_screen/profile_screen.dart';
import 'package:hierosecret/presentation/profile_screen/binding/profile_binding.dart';
import 'package:hierosecret/presentation/name_generator_screen/name_generator_screen.dart';
import 'package:hierosecret/presentation/name_generator_screen/binding/name_generator_binding.dart';
import 'package:hierosecret/presentation/explore_places_screen/explore_places_screen.dart';
import 'package:hierosecret/presentation/explore_places_screen/binding/explore_places_binding.dart';
import 'package:hierosecret/presentation/last_scanned_screen/last_scanned_screen.dart';
import 'package:hierosecret/presentation/last_scanned_screen/binding/last_scanned_binding.dart';
import 'package:hierosecret/presentation/learn_heiroglyphs_screen/learn_heiroglyphs_screen.dart';
import 'package:hierosecret/presentation/learn_heiroglyphs_screen/binding/learn_heiroglyphs_binding.dart';
import 'package:hierosecret/presentation/name_generator_screen_result_screen/name_generator_screen_result_screen.dart';
import 'package:hierosecret/presentation/name_generator_screen_result_screen/binding/name_generator_screen_result_binding.dart';
import 'package:hierosecret/presentation/place_screen/place_screen.dart';
import 'package:hierosecret/presentation/place_screen/binding/place_binding.dart';
import 'package:hierosecret/presentation/scanned_screen/scanned_screen.dart';
import 'package:hierosecret/presentation/scanned_screen/binding/scanned_binding.dart';
import 'package:hierosecret/presentation/home_one_screen/home_one_screen.dart';
import 'package:hierosecret/presentation/home_one_screen/binding/home_one_binding.dart';
import 'package:hierosecret/presentation/home_page/home_page.dart';
import 'package:hierosecret/presentation/home_page/binding/home_page_binding.dart';
import 'package:hierosecret/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:hierosecret/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String bigSizeBackgroundScreen = '/big_size_background_screen';

  static const String regularScreen = '/regular_screen';

  static const String registerScreen = '/register_screen';

  static const String registerWrongInputsScreen =
      '/register_wrong_inputs_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String forgotPasswordEmailSentScreen =
      '/forgot_password_email_sent_screen';

  static const String forgotPasswordVerifiedEmailScreen =
      '/forgot_password_verified_email_screen';

  static const String homeOnboardingScreen = '/home_onboarding_screen';

  static const String scanningScreen = '/scanning_screen';

  static const String scanningScreenBlackScreen =
      '/scanning_screen_black_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String profileScreen = '/profile_screen';

  static const String nameGeneratorScreen = '/name_generator_screen';

  static const String explorePlacesScreen = '/explore_places_screen';

  static const String lastScannedScreen = '/last_scanned_screen';

  static const String learnHeiroglyphsScreen = '/learn_heiroglyphs_screen';

  static const String nameGeneratorScreenResultScreen =
      '/name_generator_screen_result_screen';

  static const String placeScreen = '/place_screen';

  static const String scannedScreen = '/scanned_screen';

  static const String homeOneScreen = '/home_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: bigSizeBackgroundScreen,
      page: () => BigSizeBackgroundScreen(),
      bindings: [
        BigSizeBackgroundBinding(),
      ],
    ),
    GetPage(
      name: regularScreen,
      page: () => RegularScreen(),
      bindings: [
        RegularBinding(),
      ],
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      bindings: [
        RegisterBinding(),
      ],
    ),
    GetPage(
      name: registerWrongInputsScreen,
      page: () => RegisterWrongInputsScreen(),
      bindings: [
        RegisterWrongInputsBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordEmailSentScreen,
      page: () => ForgotPasswordEmailSentScreen(),
      bindings: [
        ForgotPasswordEmailSentBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordVerifiedEmailScreen,
      page: () => ForgotPasswordVerifiedEmailScreen(),
      bindings: [
        ForgotPasswordVerifiedEmailBinding(),
      ],
    ),
    GetPage(
      name: homeOnboardingScreen,
      page: () => HomeOnboardingScreen(),
      bindings: [
        HomeOnboardingBinding(),
      ],
    ),
    GetPage(
      name: scanningScreen,
      page: () => ScanningScreen(),
      bindings: [
        ScanningBinding(),
      ],
    ),
    GetPage(
      name: scanningScreenBlackScreen,
      page: () => ScanningScreenBlackScreen(),
      bindings: [
        ScanningScreenBlackBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: homePage,
      page: () =>
          HomePage(fullName: "Default Full Name", userID: "Default User ID"),
      bindings: [
        HomePageBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: nameGeneratorScreen,
      page: () => NameGeneratorScreen(),
      bindings: [
        NameGeneratorBinding(),
      ],
    ),
    GetPage(
      name: explorePlacesScreen,
      page: () => ExplorePlacesScreen(),
      bindings: [
        ExplorePlacesBinding(),
      ],
    ),
    GetPage(
      name: lastScannedScreen,
      page: () => LastScannedScreen(),
      bindings: [
        LastScannedBinding(),
      ],
    ),
    GetPage(
      name: learnHeiroglyphsScreen,
      page: () => LearnHeiroglyphsScreen(),
      bindings: [
        LearnHeiroglyphsBinding(),
      ],
    ),
    GetPage(
      name: nameGeneratorScreenResultScreen,
      page: () => NameGeneratorScreenResultScreen(),
      bindings: [
        NameGeneratorScreenResultBinding(),
      ],
    ),
    GetPage(
      name: placeScreen,
      page: () => PlaceScreen(),
      bindings: [
        PlaceBinding(),
      ],
    ),
    GetPage(
      name: scannedScreen,
      page: () => ScannedScreen(),
      bindings: [
        ScannedBinding(),
      ],
    ),
    GetPage(
      name: homeOneScreen,
      page: () => HomeOneScreen(),
      bindings: [
        HomeOneBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => OnboardingScreen(),
      bindings: [
        OnboardingBinding(),
      ],
    )
  ];
}
