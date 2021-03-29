import 'package:chat_app/services/auth.dart';
import 'package:chat_app/views/chatRoomScreen.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEdditingController =
      new TextEditingController();
  TextEditingController emailTextEdditingController =
      new TextEditingController();
  TextEditingController passwordTextEdditingController =
      new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(emailTextEdditingController.text,
              passwordTextEdditingController.text)
          .then((val) {
        //print("$val.uid");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 90,
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                  validator: (val) {
                                    return val.isEmpty || val.length < 2
                                        ? "Por favor informe um usuário válido"
                                        : null;
                                  },
                                  controller: userNameTextEdditingController,
                                  style: simpleTextFieldStyle(),
                                  decoration:
                                      textFieldInputDecoration("Usuário")),
                              TextFormField(
                                  validator: (val) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
                                            .hasMatch(val)
                                        ? null
                                        : "Por favor informe uma e-mail válido.";
                                  },
                                  controller: emailTextEdditingController,
                                  style: simpleTextFieldStyle(),
                                  decoration:
                                      textFieldInputDecoration("Email")),
                              TextFormField(
                                  validator: (val) {
                                    return RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                            .hasMatch(val)
                                        ? null
                                        : "Por favor informe uma senha válida.";
                                  },
                                  controller: passwordTextEdditingController,
                                  style: simpleTextFieldStyle(),
                                  decoration:
                                      textFieldInputDecoration("Senha")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              "Esqueceu a senha?",
                              style: simpleTextFieldStyle(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            signMeUp();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color(0xff007EF4),
                                  const Color(0xff2A75BC)
                                ]),
                                borderRadius: BorderRadius.circular(30)),
                            child:
                                Text("Registrar-se", style: mediumTextStyle()),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text("Registrar-se com Google",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 17)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Já tem uma conta? ",
                              style: mediumTextStyle(),
                            ),
                            Text(
                              "Use para entrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    )),
              ),
            ),
    );
  }
}
