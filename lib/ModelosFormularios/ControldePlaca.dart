import 'package:cloud_functions/cloud_functions.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Diente.dart';

class ControldePlaca{
  double porcentaje=0.0;
  int totaldientes=0;
  String Fecha="",userid="",clienteid="";
  List<Diente> arriba=List(),abajo=List();
  List cara_arriba=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
      cara_inferior=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
      cara_izquierda=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
      cara_derecha=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];

  Map<String,dynamic> toMap()=>{
    "UserID":userid,
    "ClienteID":clienteid,
    "Fecha":Fecha,
    "Dientes totales":totaldientes,
    "Porcentaje de superficies afectadas":porcentaje,
    "Caras_superior":cara_arriba,
    "Caras_inferior":cara_inferior,
    "Caras_derechas":cara_derecha,
    "Caras_izquier":cara_izquierda
};

  void fromjson(Map<String, dynamic> data){
    userid=data["UserID"];
    clienteid=data["ClienteID"];
    Fecha=data["Fecha"];
    totaldientes=data[ "Dientes totales"];
    porcentaje=double.parse(data["Porcentaje de superficies afectadas"].toString());
    cara_arriba=data["Caras_superior"];
    cara_inferior=data["Caras_inferior"];
    cara_derecha=data["Caras_derechas"];
    cara_izquierda=data["Caras_izquier"];
  }
  Future<void> addControldeplaca() async {


    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addControlPlacas',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Listo con exito");});
  }





}