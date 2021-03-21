import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignUp> {
  TextEditingController userNameTextEdditingController =
      new TextEditingController();
  TextEditingController emailTextEdditingController =
      new TextEditingController();
  TextEditingController passwordTextEdditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 90,
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      controller: userNameTextEdditingController,
                      style: simpleTextFieldStyle(),
                      decoration: textFieldInputDecoration("Usuário")),
                  TextField(
                      controller: emailTextEdditingController,
                      style: simpleTextFieldStyle(),
                      decoration: textFieldInputDecoration("Email")),
                  TextField(
                      controller: passwordTextEdditingController,
                      style: simpleTextFieldStyle(),
                      decoration: textFieldInputDecoration("Senha")),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "Esqueceu a senha?",
                        style: simpleTextFieldStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC)
                        ]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("Registrar-se", style: mediumTextStyle()),
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
                        style: TextStyle(color: Colors.black87, fontSize: 17)),
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
