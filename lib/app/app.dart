import 'package:soc/ui/pages/ProviderFlow/AdditionalInfo/additional_info_view.dart';
import 'package:soc/ui/pages/ProviderFlow/FacilityInfo/facility_info_view.dart';
import 'package:soc/ui/pages/ProviderFlow/PersonalInfo/personal_info_view.dart';
import 'package:soc/ui/pages/ProviderFlow/PricingAndPayment/pricing_payment_view.dart';
import 'package:soc/ui/pages/ProviderFlow/ProfessionalInfo/professional_info_view.dart';
import 'package:soc/ui/pages/ProviderFlow/RequestPending/request_pending_view.dart';
import 'package:soc/ui/pages/SelectUserTypeView/user_type_view.dart';
import 'package:soc/ui/pages/SignUpView/signup_view.dart';
import 'package:soc/ui/pages/SplashView/splash_view.dart';
import 'package:soc/ui/pages/ZipCodeView/zip_code_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/pages/OnBoardingView/on_boarding_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView),
  MaterialRoute(page: OnBoardingView, initial: true),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: SelectUserTypeView),
  MaterialRoute(page: ProfessionalInfoView),
  MaterialRoute(page: ZipCodeView),
  MaterialRoute(page: PersonalIntoView),
  MaterialRoute(page: FacilityInfoView),
  MaterialRoute(page: RequestPending),
  MaterialRoute(page: PricingPaymentView),
  MaterialRoute(page: AdditionalInfoView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService),
])
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
