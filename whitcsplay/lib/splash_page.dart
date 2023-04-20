import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _afterBuild(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Image.asset('assets/images/finalplay1.jpg'),
      ),
    );
  }

  void _afterBuild(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.blue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      )),
      builder: (builderContext) {
        return SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/LoginOrReg');
                  },
                child: const Text('REGISTER OR LOGIN '),
                
              ),
            ),
          ),
        );
      },
    );
  }
}
