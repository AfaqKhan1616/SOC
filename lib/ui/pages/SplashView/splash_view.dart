import 'package:flutter/material.dart';
import 'package:soc/ui/pages/SplashView/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        //onModelReady: (model) => model.onModelReady(),
        viewModelBuilder: () => SplashViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: drawCircles(10, Colors.yellow),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: drawCircles(20, Colors.blue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 300),
                    child: drawCircles(15, Colors.yellow),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: drawCircles(20, Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 280),
                    child: drawCircles(13, Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: drawCircles(20, Colors.red),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/class.png",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.33,
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                        const Text(
                          "Schools",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Of Childcare",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: drawCircles(10, Colors.yellow),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: drawCircles(15, Colors.blue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 280),
                    child: drawCircles(25, Colors.yellow),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: drawCircles(20, Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 350),
                    child: drawCircles(17, Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: drawCircles(15, Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: drawCircles(10, Colors.yellow),
                  ),
                  ElevatedButton(
                    onPressed: model.openApp,
                    child: Text("Open App"),
                  ),
                  ElevatedButton(
                    onPressed: model.openWebView,
                    child: Text("Open Webview"),
                  ),
                ],
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: _incrementCounter,
            //   tooltip: 'Increment',
            //   child: const Icon(Icons.add),
            // ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }

  Widget drawCircles(double height, Color color) {
    return Container(
      width: height,
      height: height,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
