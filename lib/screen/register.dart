import 'package:abc/bloc/register_bloc.dart';
import 'package:abc/screen/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // global key for form value
  // assign it to the form 1
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // set state for confirm password visible
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final bloc =
        Provider.of<RegisterBloc>(context, listen: false); // bloc provider
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        // at last wrap with form widget
        key: _formKey, // form GlobalKey 1
        child: Container(
          // alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            // widget to prevent overflow (imp)
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Icon(Icons.app_registration_sharp),
                Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                const SizedBox(
                  height: 20,
                ),

                // field 1 : name
                StreamBuilder<Object>(
                    stream: bloc.registerName,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                          labelText: 'Name',
                          errorText: snapshot.error?.toString(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (value) => bloc.changeRegisterName,
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),

                // field 2 : email
                StreamBuilder<Object>(
                    stream: bloc.registerEmail,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                          labelText: 'Email',
                          errorText: snapshot.error?.toString(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (value) => bloc.changeRegisterEmail,
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),

                // field 3 : contact
                StreamBuilder<Object>(
                    stream: bloc.registerMobile,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter Mobile',
                          labelText: 'Mobile',
                          errorText: snapshot.error?.toString(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (value) => bloc.changeRegisterMobile,
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),

                // field 5 : password
                StreamBuilder<Object>(
                    stream: bloc.registerPassword,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          errorText: snapshot.error?.toString(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: bloc.changeRegisterPassword,
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),

                // field 6 : Confirm password
                StreamBuilder<Object>(
                    stream: bloc.registerCnfPassword,
                    builder: (context, snapshot) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: isVisible ? true : false,
                        //condition for eye button
                        decoration: InputDecoration(
                          hintText: 'Enter Confirm Password',
                          labelText: 'Confirm Password',
                          errorText: snapshot.error?.toString(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: isVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) => bloc.changeRegisterCnfPassword,
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                // button <creating a method>
                _buildButton(),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Already Registered?',
                          style: TextStyle(color: Colors.black)),
                      WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Colors.blueAccent),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // navigate to login screen
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // creating a method
  Widget _buildButton() {
    final bloc = Provider.of<RegisterBloc>(context, listen: false);
    return StreamBuilder<Object>(
      stream: bloc.isValid,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: snapshot.hasError ? null : () {
            // TODO : Login Here
          },
          child: Container(
            height: 55,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: snapshot.hasError ? Colors.grey : Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
        );
      }
    );
  }
}
