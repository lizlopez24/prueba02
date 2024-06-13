import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba02/screens/LoginScreen.dart';

void main() {
  runApp(RegistroApp());
}

class RegistroApp extends StatelessWidget {
  const RegistroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Cuerpo(context),
    );
    Container();
  }
}

Widget Cuerpo(context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/vector-premium/fondo-degradado-delicado_652136-32.jpg'),
            fit: BoxFit.cover)),
    child: Center(
      child: (Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text("Registro de Usuario", style: TextStyle(fontSize: 25))),
          Usuario(),
          Correo(),
          Password(),
          Btn1(context)
        ],
      )),
    ),
  );
}

final TextEditingController _usuario = TextEditingController();
Widget Usuario() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _usuario,
        decoration: InputDecoration(
          hintText: "Ingrese su nickname",
        ),
      ));
}

final TextEditingController _correo = TextEditingController();
Widget Correo() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _correo,
        decoration: InputDecoration(
          hintText: "Ingrese su correo",
        ),
        keyboardType: TextInputType.emailAddress,
      ));
}

final TextEditingController _contrasenia = TextEditingController();
Widget Password() {
  return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _contrasenia,
        decoration: InputDecoration(
          hintText: "Ingrese su contraseña",
        ),
        keyboardType: TextInputType.visiblePassword,
      ));
}

Widget Btn1(context) {
  return (FilledButton(
      onPressed: () {
      guardarUsuario();
      registro(context);
      },
      child: Text("Registrarse"),
      style:
          ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.amber))));
}

Future<void> registro(context) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _correo.text,
    password: _contrasenia.text,
  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginApp()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

}

Future<void> guardarUsuario() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/"+_usuario.text);
await ref.set({
  "correo": _correo.text
});
}