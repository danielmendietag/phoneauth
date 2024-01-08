import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../services/provider.dart';
import '../widgets/logo_two.dart';

enum AuthFormType { signIn, signUp, reset, otp }

class SignInPage extends StatefulWidget {
  final AuthFormType authFormType;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  SignInPage({Key? key, required this.authFormType}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState(
      email: 'daniel.mendieta@gmail.com',
      // replace with the actual email value
      password: "123456",
      // replace with the actual password value
      name: "",
      // replace with the actual name value
      phone: "+526505551212",
      // replace with the actual phone value
      otp: "123456",
      authFormType: this.authFormType);
}

class _SignInPageState extends State<SignInPage> {
  AuthFormType authFormType;

  _SignInPageState({
    required this.authFormType,
    required String email,
    required String password,
    required String name,
    required String phone,
    required String otp,
  })  : _email = email,
        _password = password,
        _phone = phone,
        _otp = otp;

  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  final String? _email, _password, _phone, _otp;

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
            await auth.signInWithEmailAndPassword(_email!, _password!);
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.signUp:
            Navigator.of(context).pushReplacementNamed('/home');
            var result = await auth.createUserWithPhone(_phone!, context);
            if (_phone == "" || result == "error") {
              setState(() {
                print('Your phone number could not be validated');
              });
            }
            break;
          case AuthFormType.reset:
            await auth.sendPasswordResetEmail(_email!);
            setState(() {
              print('A password reset link has been sent to $_email');
              authFormType = AuthFormType.signIn;
            });
            break;
          case AuthFormType.otp:
            var result = await auth.createUserWithPhone(_otp!, context);
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                width: _width,
                height: _height,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 0, top: 0),
                margin:
                    const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 150, top: 10),
                      child: buildHeaderText(),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100, top: 0),
                      child: buildSubHeaderText(),
                    ),
                    ...buildInputs(),
                    const SizedBox(
                      height: 0,
                    ),
                    Container(
                      width: _width,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: buildDescriptions(),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    ...buildButtons(),
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
      _headerText = "Welcome Back";
    } else if (authFormType == AuthFormType.signUp) {
      _headerText = "Sign Up";
    } else if (authFormType == AuthFormType.otp) {
      _headerText = "Enter Code";
    } else if (authFormType == AuthFormType.reset) {
      _headerText = "Reset password";
    } else {
      _headerText = '';
    }
    return Text(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Muli',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildSubHeaderText() {
    String _subHeaderText;
    if (authFormType == AuthFormType.signIn) {
      _subHeaderText = "Sign In";
    } else if (authFormType == AuthFormType.signUp) {
      _subHeaderText = "Phone number";
    } else if (authFormType == AuthFormType.reset) {
      _subHeaderText = "Please enter your email account";
    } else if (authFormType == AuthFormType.otp) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text("Enter the four digit code we sent to you at ${_phone}"),
      );
    } else {
      _subHeaderText = "";
    }
    return SizedBox(
      height: 20,
      width: MediaQuery.of(context).size.width,
      child: Text(
        _subHeaderText,
        maxLines: 1,
        style: TextStyle(
          color: Color(0xFF898A8D),
          fontSize: 16,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }

  Widget buildDescriptions() {
    String _descriptionText;
    if (authFormType == AuthFormType.signIn) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 0, right: 10),
        child: Container(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.crop_square),
                  iconSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('Remember me'),
              ),
            ],
          ),
        ),
      );
    } else if (authFormType == AuthFormType.signUp) {
      return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore'),
        ),
      );
    } else {
      _descriptionText = '';
    }
    return Text(
      _descriptionText,
      maxLines: 3,
      style: TextStyle(
        color: Color(0xFF595959),
        fontSize: 14,
        fontFamily: 'Mulish',
        fontWeight: FontWeight.w400,
        height: 0.10,
      ),
    );
  }

  List<Widget> buildInputs() {
    List<Widget> textFields = [];
    // if we're in the sign-up state add name
    if (authFormType == AuthFormType.signIn) {
      textFields.add(
        TextFormField(
          decoration: InputDecoration(
            label: Text(
              'Email',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5099999904632568),
                fontSize: 14,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(199, 199, 199, 0.24))),
          ),
        ),
      );
      textFields.add(
        TextFormField(
          decoration: InputDecoration(
            label: Text(
              'Password',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5099999904632568),
                fontSize: 14,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(199, 199, 199, 0.24))),
          ),
        ),
      );
    } else if (authFormType == AuthFormType.signUp) {
      textFields.add(
        TextFormField(
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w600,
          ),
          keyboardType: TextInputType.phone,
          cursorColor: Colors.green,
          onChanged: (value) {
            setState(() {
              // Avoid setting text in onChanged callback
              // phoneController.text = value;
              if (value.length == 10) {
                FocusScope.of(context).nextFocus();
              }
            });
          },
          decoration: InputDecoration(
            hintText: "Enter phone number",
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 90, 90, 90),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 90, 90, 90),
              ),
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.only(top: 12, left: 14, right: 38),
              child: InkWell(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    countryListTheme: CountryListThemeData(
                      inputDecoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 5),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        hintText: "Search",
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 198, 198, 198),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 198, 198, 198),
                          ),
                        ),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      bottomSheetHeight: 570,
                      flagSize: 20,
                      searchTextStyle: const TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onSelect: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (authFormType == AuthFormType.reset) {
      textFields.add(
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 50),
          child: Container(
            width: 321.552,
            height: 60,
            decoration: ShapeDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                borderRadius: BorderRadius.circular(63),
              ),
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFC4C4C4)),
                  borderRadius: BorderRadius.circular(63),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                    width: 321.552,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFC4C4C4)),
                            borderRadius: BorderRadius.circular(73))),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(73),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Email...',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B6B6B),
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ),
      );
    } else if (authFormType == AuthFormType.otp) {
      textFields.add(
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Pinput(
            length: 6,
            showCursor: false,
            defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(92),
                color: Color.fromRGBO(199, 199, 199, 0.24),
              ),
              textStyle: TextStyle(
                fontSize: 30,
                fontFamily: 'Muli',
                fontWeight: FontWeight.w900,
              ),
            ),
            onCompleted: (value) {
              setState(() {
                _otp!;
              });
            },
          ),
        ),
      );
    }
    return textFields;
  }

  List<Widget> buildButtons() {
    List<Widget> appButtons = [];
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;
    bool _showSocial = false;

    if (authFormType == AuthFormType.signIn) {
      // Display buttons in a column for signIn
      appButtons.add(
        Padding(
          padding: EdgeInsets.only(left: 0, top: 0),
          child: Row(
            children: <Widget>[
              Text(
                'Did you forget your password?',
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 14,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              TextButton(
                onPressed: () {
                  // from json to json to Firebase

                  Navigator.of(context).pushReplacementNamed('/reset');
                },
                child: Text(
                  'Reset Here',
                  style: TextStyle(
                    color: Color(0xFF6F6F6F),
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      appButtons.add(
        Padding(
          padding: const EdgeInsets.only(left: 50, bottom: 20, top: 10),
          child: Container(
            margin: const EdgeInsets.only(left: 0, right: 0),
            padding: const EdgeInsets.only(right: 30, left: 0),
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
                'SIGN IN',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ),
      );

      appButtons.add(
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                side: const BorderSide(
                    width: 2.0, color: Color.fromRGBO(111, 111, 111, 1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(72),
                ),
                minimumSize: const Size(280, 60),
              ),
              onPressed: () {
                // Handle the second button click
                Navigator.of(context).pushReplacementNamed('/signUp');
              },
              child: Text(
                'SIGN UP',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromARGB(110, 61, 61, 61),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (authFormType == AuthFormType.signUp) {
      // Display buttons in a row for signUp
      appButtons.add(
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/signIn');
                },
                icon: Image.asset('assets/backButton.png'),
              ),
              Container(
                width: 260,
                height: 60,
                margin: const EdgeInsets.only(left: 0, right: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(111, 111, 111, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(72),
                    ),
                    minimumSize: const Size(140, 60),
                  ),
                  onPressed: () {
                    submit();
                    Navigator.of(context).pushReplacementNamed('/otp');
                  },
                  child: Text(
                    'NEXT',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (authFormType == AuthFormType.reset) {
      appButtons.add(
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            width: 321.552,
            height: 60,
            margin: const EdgeInsets.only(left: 0, right: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(111, 111, 111, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(72),
                ),
                minimumSize: const Size(140, 60),
              ),
              onPressed: () {
                submit();
                Navigator.of(context).pushReplacementNamed('/signIn');
              },
              child: Text(
                'RESET PASSWORD',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (authFormType == AuthFormType.otp) {
      appButtons.add(
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/signIn');
                },
                icon: Image.asset('assets/backButton.png'),
              ),
              Container(
                width: 260,
                height: 60,
                margin: const EdgeInsets.only(left: 0, right: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(111, 111, 111, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(72),
                    ),
                    minimumSize: const Size(140, 60),
                  ),
                  onPressed: () {
                    submit();
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: Text(
                    'VERIFY CODE',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    // Return the list of buttons
    return appButtons;
  }

  Widget showForgotPassword(bool visible) {
    return Visibility(
      child: TextButton(
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
