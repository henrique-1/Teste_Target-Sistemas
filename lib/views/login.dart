import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_target_sistemas/app/openBrowser.dart';
import 'package:teste_target_sistemas/views/lista.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  final _passwordForm = GlobalKey<FormState>();
  final _userForm = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.cyan.shade900,
                Colors.cyan.shade800,
                Colors.green
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              // Expanded(
              //   flex: 1,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 8,
              //           vertical: 4,
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(left: 10, bottom: 2),
              //               child: Text(
              //                 "Usuário",
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //             TextFormField(
              //               key: _userForm,
              //               inputFormatters: [
              //                 LengthLimitingTextInputFormatter(20),
              //               ],
              //               autovalidateMode:
              //                   AutovalidateMode.onUserInteraction,
              //               validator: (value) {
              //                 if (value!.endsWith(" ")) {
              //                   return "A usuário não pode terminar com espaço em branco";
              //                 }

              //                 return null;
              //               },
              //               controller: usuarioController,
              //               decoration: const InputDecoration(
              //                 fillColor: Colors.white,
              //                 filled: true,
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(8),
              //                   ),
              //                   borderSide: BorderSide(color: Colors.white),
              //                 ),
              //                 enabledBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(8),
              //                   ),
              //                   borderSide: BorderSide(color: Colors.white),
              //                 ),
              //                 focusedBorder: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(8),
              //                   ),
              //                   borderSide: BorderSide(color: Colors.white),
              //                 ),
              //                 contentPadding: EdgeInsets.only(top: 20),
              //                 isDense: true,
              //                 prefixIcon: Icon(
              //                   Icons.person,
              //                   size: 26,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 8,
              //           vertical: 4,
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(left: 10, bottom: 2),
              //               child: Text(
              //                 "Senha",
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //             TextFormField(
              //               inputFormatters: [
              //                 LengthLimitingTextInputFormatter(20),
              //                 FilteringTextInputFormatter.allow(
              //                     RegExp("[0-9a-zA-Z ]")),
              //               ],
              //               obscureText: _isObscure,
              //               key: _passwordForm,
              //               autovalidateMode:
              //                   AutovalidateMode.onUserInteraction,
              //               validator: (value) {
              //                 if (value!.endsWith(" ")) {
              //                   return "A senha não pode terminar com espaço em branco";
              //                 }

              //                 if (value.length < 2) {
              //                   return "A senha deve possuir ao menos 2 caracteres";
              //                 }

              //                 return null;
              //               },
              //               controller: senhaController,
              //               decoration: InputDecoration(
              //                 fillColor: Colors.white,
              //                 filled: true,
              //                 border: const OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(8),
              //                   ),
              //                   borderSide: BorderSide(color: Colors.white),
              //                 ),
              //                 enabledBorder: const OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(8),
              //                   ),
              //                   borderSide: BorderSide(color: Colors.white),
              //                 ),
              //                 focusedBorder: const OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(8),
              //                   ),
              //                   borderSide: BorderSide(color: Colors.white),
              //                 ),
              //                 contentPadding: const EdgeInsets.only(top: 20),
              //                 isDense: true,
              //                 prefixIcon: const Icon(
              //                   Icons.lock,
              //                   size: 26,
              //                   color: Colors.black,
              //                 ),
              //                 suffixIcon: IconButton(
              //                   icon: Icon(
              //                     _isObscure
              //                         ? Icons.visibility
              //                         : Icons.visibility_off,
              //                   ),
              //                   onPressed: () {
              //                     setState(() {
              //                       _isObscure = !_isObscure;
              //                     });
              //                   },
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(top: 16),
              //         child: ElevatedButton.icon(
              //           onPressed: () {
              //             print(_passwordForm);
              //             print(_userForm);
              //           },
              //           icon: const Icon(
              //             Icons.login,
              //             color: Colors.white,
              //           ),
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.green,
              //             maximumSize: const Size(200, 50),
              //             minimumSize: const Size(175, 50),
              //           ),
              //           label: const Text(
              //             "Entrar",
              //             style: TextStyle(
              //               fontSize: 20,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                flex: 1,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 2),
                              child: Text(
                                "Usuário",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextFormField(
                              key: _userForm,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.endsWith(" ")) {
                                  return "A usuário não pode terminar com espaço em branco";
                                }

                                return null;
                              },
                              controller: _userController,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                contentPadding: EdgeInsets.only(top: 20),
                                isDense: true,
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 26,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 2),
                              child: Text(
                                "Senha",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9a-zA-Z ]")),
                              ],
                              obscureText: _isObscure,
                              key: _passwordForm,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.endsWith(" ")) {
                                  return "A senha não pode terminar com espaço em branco";
                                }

                                if (value.length < 2) {
                                  return "A senha deve possuir ao menos 2 caracteres";
                                }

                                return null;
                              },
                              controller: _passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                contentPadding: const EdgeInsets.only(top: 20),
                                isDense: true,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 26,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('username', _userController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext ctx) =>
                                          const Lista()));
                            }
                          },
                          icon: const Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            maximumSize: const Size(200, 50),
                            minimumSize: const Size(175, 50),
                          ),
                          label: const Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () => launchPolicy("https://www.google.com.br"),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Política de privacidade",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
