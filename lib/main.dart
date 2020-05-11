
import 'package:expedientesodontologicos_app/Loggin/Loggin.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'ModelosFormularios/Adulto.dart';
import 'ModelosFormularios/Endodoncia.dart';
import 'principal.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginState>(
        create: (context) => LoginState(),),
      Provider<General>(
        create: (context) => General(),),
      Provider<Adulto>(
        create: (context) => Adulto(),),
      Provider<Cirugia>(
        create: (context) => Cirugia(),)
    ],
    child: MyApp()
    )
    );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
        return GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
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
          ),
        );
  }

}


