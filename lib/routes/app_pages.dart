// ignore_for_file: constant_identifier_names
import '../features/edit_profile/bindings/edit_profile_binding.dart';
import '../features/edit_profile/views/edit_profile_view.dart';
import '../features/offer_details/bindings/offer_details_binding.dart';
import '../features/offer_details/views/offer_details_view.dart';
import '../features/offer_listing/bindings/offer_listing_binding.dart';
import '../features/offer_listing/views/offer_listing_view.dart';
import '../features/wallet_listing/bindings/wallet_listing_binding.dart';
import '../features/wallet_listing/views/wallet_listing_view.dart';
import '../features/passenger_listing/bindings/passenger_listing_binding.dart';
import '../features/passenger_listing/views/passenger_listing_view.dart';
import '../features/board_drop_points_listing/bindings/board_drop_points_listing_binding.dart';
import '../features/board_drop_points_listing/views/board_drop_points_listing_view.dart';
import '../features/passenger_details/bindings/passenger_details_binding.dart';
import '../features/passenger_details/views/passenger_details_view.dart';
import '../features/seat_selection/bindings/seat_selection_binding.dart';
import '../features/seat_selection/views/seat_selection_view.dart';
import '../features/cities_search/bindings/cities_search_binding.dart';
import '../features/cities_search/views/cities_search_view.dart';
import '../features/bus_listing/bindings/bus_listing_binding.dart';
import '../features/bus_listing/views/bus_listing_view.dart';
import '../features/home/bindings/home_binding.dart';
import '../features/home/views/home_view.dart';
import '../features/navigation/bindings/navigation_binding.dart';
import '../features/navigation/views/navigation_view.dart';
import '../features/ticket_listing/bindings/ticket_listing_binding.dart';
import '../features/ticket_listing/views/ticket_listing_view.dart';

import 'package:get/get.dart';
import '../features/ticket_details/bindings/ticket_details_binding.dart';
import '../features/ticket_details/views/ticket_details_view.dart';
import '../features/faq_support/bindings/faq_support_binding.dart';
import '../features/faq_support/views/faq_support_view.dart';
import '../features/profile/bindings/profile_binding.dart';
import '../features/profile/views/profile_view.dart';
import '../features/about_us/bindings/about_us_binding.dart';
import '../features/about_us/views/about_us_view.dart';
import '../features/register_user/bindings/register_user_binding.dart';
import '../features/register_user/views/register_user_view.dart';
import '../features/verify_otp/bindings/verify_otp_binding.dart';
import '../features/verify_otp/views/verify_otp_view.dart';
import '../features/phone_auth/bindings/phone_auth_binding.dart';
import '../features/phone_auth/views/phone_auth_view.dart';
import '../features/splash/bindings/splash_binding.dart';
import '../features/splash/views/splash_view.dart';
import 'middleware/auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVIGATION;
  static const SPLASH = Routes.SPLASH;
  static const FAQ_SUPPORT = Routes.FAQ_SUPPORT;
  static const PHONE_AUTH = Routes.PHONE_AUTH;
  static const TICKET_DETAILS = Routes.TICKET_DETAILS;
  static const TICKET_LISTING = Routes.TICKET_LISTING;
  static const PROFILE = Routes.PROFILE;
  static const NAVIGATION = Routes.NAVIGATION;
  static const HOME = Routes.HOME;
  static const BUS_LISTING = Routes.BUS_LISTING;
  static const CITIES_SEARCH = Routes.CITIES_SEARCH;
  static const SEAT_SELECTION = Routes.SEAT_SELECTION;
  static const PASSENGER_DETAILS = Routes.PASSENGER_DETAILS;
  static const BOARD_DROP_POINTS_LISTING = Routes.BOARD_DROP_POINTS_LISTING;
  static const PASSENGER_LISTING = Routes.PASSENGER_LISTING;
  static const WALLET_LISTING = Routes.WALLET_LISTING;
  static const OFFER_LISTING = Routes.OFFER_LISTING;
  static const OFFER_DETAILS = Routes.OFFER_DETAILS;
  static const ABOUT_US = Routes.ABOUT_US;
  static const VERIFY_OTP = Routes.VERIFY_OTP;
  static const EDIT_PROFILE = Routes.EDIT_PROFILE;
  static const REGISTER_USER = Routes.REGISTER_USER;
  static final routes = [
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.OFFER_DETAILS,
      page: () => OfferDetailsView(),
      binding: OfferDetailsBinding(),
    ),
    GetPage(
      name: _Paths.OFFER_LISTING,
      page: () => OfferListingView(),
      binding: OfferListingBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_LISTING,
      page: () => WalletListingView(),
      binding: WalletListingBinding(),
    ),
    GetPage(
      name: _Paths.PASSENGER_LISTING,
      page: () => PassengerListingView(),
      binding: PassengerListingBinding(),
    ),
    GetPage(
      name: _Paths.BOARD_DROP_POINTS_LISTING,
      page: () => BoardDropPointsListingView(),
      binding: BoardDropPointsListingBinding(),
    ),
    GetPage(
      name: _Paths.PASSENGER_DETAILS,
      page: () => PassengerDetailsView(),
      binding: PassengerDetailsBinding(),
      // middlewares: [
      //   AuthMiddleware(),
      // ],
    ),
    GetPage(
      name: _Paths.SEAT_SELECTION,
      page: () => SeatSelectionView(),
      binding: SeatSelectionBinding(),
      // middlewares: [
      //   AuthMiddleware(),
      // ],
    ),
    GetPage(
      name: _Paths.CITIES_SEARCH,
      page: () => CitiesSearchView(),
      binding: CitiesSearchBinding(),
    ),
    GetPage(
      name: _Paths.BUS_LISTING,
      page: () => BusListingView(),
      binding: BusListingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.TICKET_LISTING,
      page: () => TicketListingView(),
      binding: TicketListingBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.TICKET_DETAILS,
      page: () => TicketDetailsView(),
      binding: TicketDetailsBinding(),
    ),
    GetPage(
      name: _Paths.FAQ_SUPPORT,
      page: () => FaqSupportView(),
      binding: FaqSupportBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_USER,
      page: () => RegisterUserView(),
      binding: RegisterUserBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_AUTH,
      page: () => PhoneAuthView(),
      binding: PhoneAuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
