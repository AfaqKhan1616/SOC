// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/pages/OnBoardingView/on_boarding_view.dart';
import '../ui/pages/ProviderFlow/AdditionalInfo/additional_info_view.dart';
import '../ui/pages/ProviderFlow/FacilityInfo/facility_info_view.dart';
import '../ui/pages/ProviderFlow/PersonalInfo/personal_info_view.dart';
import '../ui/pages/ProviderFlow/PricingAndPayment/pricing_payment_view.dart';
import '../ui/pages/ProviderFlow/ProfessionalInfo/professional_info_view.dart';
import '../ui/pages/ProviderFlow/RequestPending/request_pending_view.dart';
import '../ui/pages/ProviderFlow/VirtualOffice/virtual_office_view.dart';
import '../ui/pages/SelectUserTypeView/user_type_view.dart';
import '../ui/pages/SignUpView/signup_view.dart';
import '../ui/pages/SplashView/splash_view.dart';
import '../ui/pages/ZipCodeView/zip_code_view.dart';

class Routes {
  static const String splashView = '/splash-view';
  static const String onBoardingView = '/on-boarding-view';
  static const String signUpView = '/sign-up-view';
  static const String selectUserTypeView = '/select-user-type-view';
  static const String professionalInfoView = '/professional-info-view';
  static const String zipCodeView = '/zip-code-view';
  static const String personalIntoView = '/personal-into-view';
  static const String facilityInfoView = '/facility-info-view';
  static const String requestPending = '/request-pending';
  static const String pricingPaymentView = '/pricing-payment-view';
  static const String virtualOfficeView = '/';
  static const String additionalInfoView = '/additional-info-view';
  static const all = <String>{
    splashView,
    onBoardingView,
    signUpView,
    selectUserTypeView,
    professionalInfoView,
    zipCodeView,
    personalIntoView,
    facilityInfoView,
    requestPending,
    pricingPaymentView,
    virtualOfficeView,
    additionalInfoView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.onBoardingView, page: OnBoardingView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.selectUserTypeView, page: SelectUserTypeView),
    RouteDef(Routes.professionalInfoView, page: ProfessionalInfoView),
    RouteDef(Routes.zipCodeView, page: ZipCodeView),
    RouteDef(Routes.personalIntoView, page: PersonalIntoView),
    RouteDef(Routes.facilityInfoView, page: FacilityInfoView),
    RouteDef(Routes.requestPending, page: RequestPending),
    RouteDef(Routes.pricingPaymentView, page: PricingPaymentView),
    RouteDef(Routes.virtualOfficeView, page: VirtualOfficeView),
    RouteDef(Routes.additionalInfoView, page: AdditionalInfoView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    OnBoardingView: (data) {
      var args = data.getArgs<OnBoardingViewArguments>(
        orElse: () => OnBoardingViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnBoardingView(key: args.key),
        settings: data,
      );
    },
    SignUpView: (data) {
      var args = data.getArgs<SignUpViewArguments>(
        orElse: () => SignUpViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(key: args.key),
        settings: data,
      );
    },
    SelectUserTypeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SelectUserTypeView(),
        settings: data,
      );
    },
    ProfessionalInfoView: (data) {
      var args = data.getArgs<ProfessionalInfoViewArguments>(
        orElse: () => ProfessionalInfoViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfessionalInfoView(key: args.key),
        settings: data,
      );
    },
    ZipCodeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ZipCodeView(),
        settings: data,
      );
    },
    PersonalIntoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PersonalIntoView(),
        settings: data,
      );
    },
    FacilityInfoView: (data) {
      var args = data.getArgs<FacilityInfoViewArguments>(
        orElse: () => FacilityInfoViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => FacilityInfoView(key: args.key),
        settings: data,
      );
    },
    RequestPending: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RequestPending(),
        settings: data,
      );
    },
    PricingPaymentView: (data) {
      var args = data.getArgs<PricingPaymentViewArguments>(
        orElse: () => PricingPaymentViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PricingPaymentView(key: args.key),
        settings: data,
      );
    },
    VirtualOfficeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VirtualOfficeView(),
        settings: data,
      );
    },
    AdditionalInfoView: (data) {
      var args = data.getArgs<AdditionalInfoViewArguments>(
        orElse: () => AdditionalInfoViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AdditionalInfoView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// OnBoardingView arguments holder class
class OnBoardingViewArguments {
  final Key? key;
  OnBoardingViewArguments({this.key});
}

/// SignUpView arguments holder class
class SignUpViewArguments {
  final Key? key;
  SignUpViewArguments({this.key});
}

/// ProfessionalInfoView arguments holder class
class ProfessionalInfoViewArguments {
  final Key? key;
  ProfessionalInfoViewArguments({this.key});
}

/// FacilityInfoView arguments holder class
class FacilityInfoViewArguments {
  final Key? key;
  FacilityInfoViewArguments({this.key});
}

/// PricingPaymentView arguments holder class
class PricingPaymentViewArguments {
  final Key? key;
  PricingPaymentViewArguments({this.key});
}

/// AdditionalInfoView arguments holder class
class AdditionalInfoViewArguments {
  final Key? key;
  AdditionalInfoViewArguments({this.key});
}
