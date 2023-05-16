import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formfield = GlobalKey<FormState>();
  final email_controller = TextEditingController();
  final name_controller = TextEditingController();
  final pass_controller = TextEditingController();
  final pass_confirm_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String text = "";
    return Scaffold(
      //backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
                key: _formfield,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        'assets/reg_logo.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(children: [
                        TextFormField(
                          controller: name_controller,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.black,
                          validator: (value) {
                            bool? nameValid = value?.isNotEmpty;

                            if (!nameValid!) {
                              return "This field is required";
                            }
                          },
                          decoration: const InputDecoration(
                              floatingLabelStyle:
                                  TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIconColor: Colors.black,
                              labelText: "Name",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: email_controller,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          validator: (input) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                .hasMatch(input!);
                            if (!emailValid) {
                              return "Enter Valid Email";
                            }
                          },
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.black)),
                              floatingLabelStyle:
                                  TextStyle(color: Colors.black),
                              prefixIconColor: Colors.black,
                              labelText: "Email",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: pass_controller,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (input) {
                            bool passValid = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(input!);
                            if (!passValid) {
                              return "Password should contain at least 8 characters";
                            }
                          },
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.black)),
                              floatingLabelStyle:
                                  TextStyle(color: Colors.black),
                              prefixIconColor: Colors.black,
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: pass_confirm_controller,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (input) {
                            if (is_Matched(pass_controller.value.toString(),
                                    pass_confirm_controller.value.toString()) ==
                                false) {
                              return "Password not matched!!";
                            }
                          },
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(color: Colors.black)),
                              floatingLabelStyle:
                                  TextStyle(color: Colors.black),
                              prefixIconColor: Colors.black,
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.confirmation_num)),
                        ),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          Fluttertoast.showToast(
                              msg: "Account is successfully created ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          email_controller.clear();
                          name_controller.clear();
                          pass_controller.clear();
                          pass_confirm_controller.clear();
                        } else {}
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.black),
                          //color: Colors.blue,
                          height: 50,
                          child: const Center(
                              child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    )
                  ],
                ))),
      ),
    );
  }

  bool is_Matched(String str1, String str2) {
    if (str1.compareTo(str2) == 0) {
      return true;
    }
    return false;
  }
}
