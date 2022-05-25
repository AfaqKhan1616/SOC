import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soc/ui/pages/ZipCodeView/zip_code_view_model.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_button.dart';
import 'package:soc/ui/widgets/smart_widgets/soc_text_field.dart';
import 'package:soc/utils/size_config.dart';
import 'package:stacked/stacked.dart';

class ZipCodeView extends StatefulWidget {
  const ZipCodeView({Key? key}) : super(key: key);
  @override
  State<ZipCodeView> createState() => _ZipCodeViewState();
}

class _ZipCodeViewState extends State<ZipCodeView> {
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      setState(() {
        _markers.add(const Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(55.851141, -4.237958)));
      });
    }

    return ViewModelBuilder<ZipCodeViewModel>.reactive(
        viewModelBuilder: () => ZipCodeViewModel(),
        builder: (context, model, child) {
          SizeConfig().init(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          topImage(),
                          zipText(),
                          textField(),
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            markers: _markers,
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(55.851141, -4.237958), zoom: 15),
                          ),
                        ),
                        continueButton(context, model)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget topImage() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/zip_code_image.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        height: getProportionateScreenHeight(100),
        width: getProportionateScreenWidth(100),
      ),
    );
  }

  Widget zipText() {
    return const Text(
      "Enter your zip code",
      style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
    );
  }

  Widget textField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SocTextField(
        // labelText: "Password*",
        // validator: model.validatePassword,
        placeholder: "Zip code",
        // touchableIcon: true,
        isPassword: false,
        onChanged: (value) => {},
        // errorText: model.passwordError,
      ),
    );
  }

  Widget continueButton(BuildContext context, ZipCodeViewModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: SizedBox(
          height: getProportionateScreenHeight(50),
          child: SocButton(
            onPressed: () {
              model.onSubmit();
              // Navigator.pushNamed(context, Routes.home);
            },
            text: "Continue",
          ),
        ),
      ),
    );
  }
}
