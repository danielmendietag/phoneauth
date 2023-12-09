import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/provider.dart';
import '../widgets/logo_two.dart';

enum AuthFormType { signIn, signUp, reset, phone, otp }

class SignInPage extends StatefulWidget {
  final AuthFormType authFormType;

  SignInPage({Key? key, required this.authFormType}) : super(key: key);

  @override
  _SignInPageState createState() =>
      _SignInPageState(authFormType: this.authFormType);
}

class _SignInPageState extends State<SignInPage> {
  AuthFormType authFormType;

  @override
  void initState() {
    super.initState();
  }

  _SignInPageState({required this.authFormType});

  final formKey = GlobalKey<FormState>();
  late String _email, _password, _name, _phone, _otp;

  void switchFormState(String state) {
    formKey.currentState?.reset();
    if (state == "signUp") {
      setState(() {
        authFormType = AuthFormType.signUp;
      });
    } else if (state == 'home') {
      Navigator.of(context).pop();
    } else {
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  bool validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context)!.auth;
        switch (authFormType) {
          case AuthFormType.signIn:
            await auth.signInWithEmailAndPassword(_email, _password);
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.signUp:
            await auth.createUserWithEmailAndPassword(_email, _password, _name);
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.reset:
            await auth.sendPasswordResetEmail(_email);
            setState(() {
              print('A password reset link has been sent to $_email');
              authFormType = AuthFormType.signIn;
            });
            break;
          case AuthFormType.phone:
            Navigator.of(context).pushReplacementNamed('/home');
            var result = await auth.createUserWithPhone(_phone, context);
            if (_phone == "" || result == "error") {
              setState(() {
                print('Your phone number could not be validated');
              });
            }
            break;
          case AuthFormType.otp:
            var result = await auth.createUserWithPhone(_otp, context);
            if (_otp == "" || result == null) {
              print('Your OTP Code is incorrect, try again');
            } else {
              print('You have succesfully created your account');
            }
        }
      } catch (e) {
        setState(() {
          print("${e}");
        });
      }
    }
  }

  Country selectedCountry = Country(
    phoneCode: "52",
    countryCode: "MX",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Mexico",
    example: "Mexico",
    displayName: "Mexico",
    displayNameNoCountryCode: "MX",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: _height,
        width: _width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF000000),
              Color(0xFF3A6433),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LogoTwoWidget(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 0, top: 0),
                margin:
                    const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    buildHeaderText(),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Phone number',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5099999904632568),
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    ...buildInputs(),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    ...buildButtons(),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     IconButton(
                    //       focusColor: Colors.transparent,
                    //       splashColor: Colors.transparent,
                    //       icon: Image.asset('assets/backButton1.png'),
                    //       onPressed: () {
                    //         Navigator.of(context)
                    //             .pushReplacementNamed('/welcome');
                    //       },
                    //     ),
                    //     ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor:
                    //             const Color.fromRGBO(111, 111, 111, 1),
                    //         shape: RoundedRectangleBorder(
                    //           side: const BorderSide(
                    //             color: Color.fromRGBO(199, 199, 199, 0.24),
                    //           ),
                    //           borderRadius: BorderRadius.circular(72),
                    //         ),
                    //         minimumSize: const Size(260, 60),
                    //       ),
                    //       onPressed: () {},
                    //       child: const Text(
                    //         'NEXT',
                    //         style: TextStyle(
                    //           fontFamily: 'Mulish',
                    //           fontSize: 18,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildHeaderText() {
    String _headerText;
    if (authFormType == AuthFormType.signIn) {
      _headerText = "Sign In";
    } else if (authFormType == AuthFormType.signUp) {
      _headerText = "Sign Up";
    } else if (authFormType == AuthFormType.phone) {
      _headerText = "Enter your phone number";
    } else if (authFormType == AuthFormType.otp) {
      _headerText = "Verify OTP";
    } else {
      _headerText = "Sign Out";
    }
    return Text(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Muli',
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> buildInputs() {
    List<TextFormField> textFields = [];

    // if we're in the sign-up state add name
    if (authFormType == AuthFormType.signIn) {
      textFields.add(TextFormField(
        style: TextStyle(fontSize: 22.0),
        decoration: InputDecoration(
          hintText: 'Email',
          labelStyle: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.51),
            fontFamily: 'Muil',
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(199, 199, 199, 0.24),
            ),
          ),
        ),
      ));
    }
    return textFields;
  }

  List<Widget> buildButtons() {
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;
    bool _showSocial = false;

    if (authFormType == AuthFormType.signIn) {
      _switchButtonText = 'SIGN IN';
      _newFormState = 'signIn';
      _submitButtonText = 'SIGN IN';
      _showForgotPassword = true;
    } else if (authFormType == AuthFormType.phone) {
      _switchButtonText = "Enter phone number";
      _newFormState = "signIn";
      _submitButtonText = "Send phone number";
      _showSocial = false;
    } else if (authFormType == AuthFormType.reset) {
      _switchButtonText = "Return to Sign In";
      _newFormState = 'reset';
      _submitButtonText = "Reset password";
      _showSocial = false;
    } else if (authFormType == AuthFormType.otp) {
      _switchButtonText = "Enter OTP Code";
      _newFormState = "otp";
      _submitButtonText = "Send phone number";
      _showSocial = false;
    } else {
      _switchButtonText = "Have an Account? Sign In";
      _newFormState = "signIn";
      _submitButtonText = "Sign Up";
    }
    return [
      Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        padding: const EdgeInsets.only(right: 0, left: 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(111, 111, 111, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(72),
            ),
            minimumSize: const Size(280, 60),
          ),
          onPressed: () {
            submit();
          },
          child: Text(
            _submitButtonText,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color.fromRGBO(255, 255, 255, 1)),
          ),
        ),
      ),
      showForgotPassword(_showForgotPassword),

    ];
  }
  Widget showForgotPassword(bool visible) {
    return Visibility(
      child: ElevatedButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            authFormType = AuthFormType.reset;
          });
        },
      ),
      visible: visible,
    );
  }
}
