// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const PHONE_AUTH = _Paths.PHONE_AUTH;
  static const VERIFY_OTP = _Paths.VERIFY_OTP;
  static const REGISTER_USER = _Paths.REGISTER_USER;
  static const ABOUT_US = _Paths.ABOUT_US;
  static const PROFILE = _Paths.PROFILE;
  static const FAQ_SUPPORT = _Paths.FAQ_SUPPORT;
  static const TICKET_DETAILS = _Paths.TICKET_DETAILS;
  static const TICKET_LISTING = _Paths.TICKET_LISTING;
  static const NAVIGATION = _Paths.NAVIGATION;
  static const HOME = _Paths.HOME;
  static const BUS_LISTING = _Paths.BUS_LISTING;
  static const CITIES_SEARCH = _Paths.CITIES_SEARCH;
  static const SEAT_SELECTION = _Paths.SEAT_SELECTION;
  static const PASSENGER_DETAILS = _Paths.PASSENGER_DETAILS;
  static const BOARD_DROP_POINTS_LISTING = _Paths.BOARD_DROP_POINTS_LISTING;
  static const PASSENGER_LISTING = _Paths.PASSENGER_LISTING;
  static const WALLET_LISTING = _Paths.WALLET_LISTING;
  static const OFFER_LISTING = _Paths.OFFER_LISTING;
  static const OFFER_DETAILS = _Paths.OFFER_DETAILS;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const PHONE_AUTH = '/phone_auth';
  static const VERIFY_OTP = '/verify_otp';
  static const REGISTER_USER = '/register_user';
  static const ABOUT_US = '/about_us';
  static const PROFILE = '/profile';
  static const FAQ_SUPPORT = '/faq_support';
  static const TICKET_DETAILS = '/ticket_details';
  static const TICKET_LISTING = '/ticket_listing';
  static const NAVIGATION = '/navigation';
  static const HOME = '/home';
  static const BUS_LISTING = '/bus_listing';
  static const CITIES_SEARCH = '/cities_search';
  static const SEAT_SELECTION = '/seat_selection';
  static const PASSENGER_DETAILS = '/passenger_details';
  static const BOARD_DROP_POINTS_LISTING = '/board_drop_points_listing';
  static const PASSENGER_LISTING = '/passenger_listing';
  static const WALLET_LISTING = '/wallet_listing';
  static const OFFER_LISTING = '/offer_listing';
  static const OFFER_DETAILS = '/offer_details';
  static const EDIT_PROFILE = '/edit_profile';
}
