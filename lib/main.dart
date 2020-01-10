
import 'package:expedientesodontologicos_app/Loggin/Loggin.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ModelosFormularios/Endodoncia.dart';
import 'principal.dart';
void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginState>(
        create: (context) => LoginState(),),
      Provider<General>(
        create: (context) => General(),),
      Provider<Endodoncia>(
        create: (context) => Endodoncia(),),
    ],
    child: MyApp()
    )
    );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<LoginState>(context).isok();
        return MaterialApp(
            title: 'Historias Clinicas',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:  FutureBuilder<bool>(
              future:Provider.of<LoginState>(context).isok() ,
              initialData: false,
            builder: (context,log){
              return log.data?principal():Loggin()??Center(child:CircularProgressIndicator(
                backgroundColor: Colors.deepOrange,
              ));
            },
            )
        );
  }

}


