
import 'package:cloud_functions/cloud_functions.dart';
import 'package:expedientesodontologicos_app/model/model.dart';
import 'package:flutter/foundation.dart';

class Adulto{
  String  historia, fecha_ultima_visitatemp, tratamiento_recibido , dientes_perdidos , causa_dientesperdidos , experiencias_exodoncias , higiene_oral , tipo_cepillo , tecnica_cepillado ,
      frecuencia_cepillado , ayudas_higiene_extras ,hospital,expediente,fecha_ultimo_examen_medico, medicamentos, nombredelmedico;
  List enfermedades=List<String>();

  String enfermedad_persiste="", iniciacion_enf="", curso="", tratamiento="", estadoactual="", otros_enfermedades_padecidas="", vacunas_recibidas="",clienteid,desc_operacion;
  bool cambiado,cuidadoMedico;
  //aun no en los formularios , revision_medica a punto de considerarse inecesaria, de aqui hacia abajo no estan contemplados a subirse por ahora
  String historia_familiar,historia_personal_social,otros_sintomas,describa_revision,presionsan_max,presionsan_min,temperatura,pulsaciones,ritmo,descripcion_examenes,
  revision_medica,actitudemocional,examenfisico_caracuello,motivotemp,nivel_higiene_oral,
  //examen clinico bucal, se pregunta 2 veces por higiene oral...
  region_vestibular,paladar_duro,paladar_blando,orofaringe,piso_boca,lengua,cara_dorsal,cara_ventral,bordes,encia,dientes,prescencia_calculo,salivacion
  ;
 List revision_organos=List<String>(),sometido=List<String>(),fecha_ultima_visita= List<String>();
 List motivo=List<String>();
// operaciones=data["operaciones"]; trans_sanguine_somet=data["trans_sanguine_somet"];
//    radioterapia=data["radioterapia"]  estas variables fueron eliminadas y esto queda como recordatorio por si las moscas
  String Userid;
 Adulto();
void clear(){
  motivo = List<String>();
  historia="";fecha_ultima_visita= List<String>(); tratamiento_recibido="" ;
  dientes_perdidos=""; causa_dientesperdidos="" ;experiencias_exodoncias="" ;
  higiene_oral="";tipo_cepillo ="";tecnica_cepillado="" ;
  frecuencia_cepillado="" ; ayudas_higiene_extras="" ; nivel_higiene_oral = "";
  cuidadoMedico=false;hospital="";expediente="";fecha_ultimo_examen_medico="";
  medicamentos="";nombredelmedico="";enfermedades=List<String>(); enfermedad_persiste="";
  iniciacion_enf=""; curso=""; tratamiento=""; estadoactual="";
  otros_enfermedades_padecidas=""; sometido=List<String>(); vacunas_recibidas="";clienteid="";cambiado=false;
  historia_familiar="";historia_personal_social=""; otros_sintomas = "";describa_revision="";presionsan_max="";presionsan_min="";
  temperatura="";pulsaciones="";ritmo="";descripcion_examenes="";
  revision_medica="";actitudemocional="";examenfisico_caracuello="";
  region_vestibular="";paladar_duro="";paladar_blando="";orofaringe="";piso_boca="";lengua="";cara_dorsal="";
  cara_ventral="";bordes="";encia="";dientes="";prescencia_calculo="";salivacion="";revision_organos=List<String>(); fecha_ultima_visitatemp = "";
  desc_operacion = "";
}
 void addmotivosyfecha(mot,fecha){
  motivo=mot;fecha_ultima_visita=fecha;
 }
  void fromjson(Map<String, dynamic> data) {
    motivo=List.from(data["motivo_consulta"]);
    historia=data["historia_enfermedad_actual"];fecha_ultima_visita=List.from(data["fecha_ultima_visita"]); tratamiento_recibido=data["tratamiento_recibido"] ;
    dientes_perdidos=data["dientes_perdidos"]; causa_dientesperdidos=data["causa_dientes_perdidos"] ;experiencias_exodoncias=data["exper_exodocias"] ;
    higiene_oral=data["higiene_oral"] ;tipo_cepillo =data["tipo_cepillo"];tecnica_cepillado=data["tipo_cepillado"] ;
    frecuencia_cepillado=data["frec_cepillado"] ; ayudas_higiene_extras=data["ayudas_higiene_extra"] ;
    cuidadoMedico=data["cuidado_medico"];hospital=data["hospital"];expediente=data["expediente_medico"];fecha_ultimo_examen_medico=data["ult_exam_medico"];
    medicamentos=data["medicamentos"];nombredelmedico=data["nombre_medico"];enfermedades=List.from(data["enfermedades"]); enfermedad_persiste=data["enfermedad_persiste"];
    iniciacion_enf=data["iniciacion_enf"]; curso=data["curso"]; tratamiento=data["tratamiento"]; estadoactual=data["estadoactual"];
    otros_enfermedades_padecidas=data["otros_enfermedades_padecidas"]; sometido=List.from(data["sometido_a"]); vacunas_recibidas=data["vacunas_recibidas"];clienteid=data["ClienteID"];
    historia_familiar=data["historia_familiar"];historia_personal_social=data["historia_personal_social"];otros_sintomas=data["otros_sintomas"];
    describa_revision=data["describa_revision"];presionsan_max=data["presionsan_max"];presionsan_min=data["presionsan_min"];
    temperatura=data["temperatura"];pulsaciones=data["pulsaciones"];ritmo=data["ritmo"];descripcion_examenes=data["descripcion_examenes"];
    revision_medica=data["revision_medica"];actitudemocional=data["actitudemocional"];examenfisico_caracuello=data["examenfisico_caracuello"];
    region_vestibular=data["region_vestibular"];paladar_duro=data["paladar_duro"];paladar_blando=data["paladar_blando"];orofaringe=data["orofaringe"];
    piso_boca=data["piso_boca"];lengua=data["lengua"];cara_dorsal=data["cara_dorsal"];
    cara_ventral=data["cara_ventral"];bordes=data["bordes"];encia=data["encia"];dientes=data["dientes"];prescencia_calculo=data["prescencia_calculo"];salivacion=data["salivacion"];
    revision_organos=List.from(data["RevisiondeOrganos"]); nivel_higiene_oral = data["nivel_higiene_oral"]; desc_operacion = data["desc_operacion"];
  }
  Map<String,dynamic> toMap()=>{
     "historia_enfermedad_actual":historia, "fecha_ultima_visita":fecha_ultima_visita, "tratamiento_recibido":tratamiento_recibido , "dientes_perdidos":dientes_perdidos ,
    "causa_dientes_perdidos":causa_dientesperdidos , "exper_exodocias":experiencias_exodoncias ,
    "higiene_oral":higiene_oral , "tipo_cepillo":tipo_cepillo, "tipo_cepillado":tecnica_cepillado ,
    "frec_cepillado":frecuencia_cepillado , "ayudas_higiene_extra":ayudas_higiene_extras ,
    "cuidado_medico":cuidadoMedico,"hospital":hospital,"expediente_medico":expediente,"ult_exam_medico":fecha_ultimo_examen_medico,
    "medicamentos":medicamentos, "nombre_medico":nombredelmedico,"enfermedades":enfermedades, "enfermedad_persiste":enfermedad_persiste,
    "iniciacion_enf":iniciacion_enf, "curso":curso, "tratamiento":tratamiento, "estadoactual":estadoactual,
    "otros_enfermedades_padecidas":otros_enfermedades_padecidas, "vacunas_recibidas":vacunas_recibidas,"ClienteID":clienteid,"UserID":Userid,
    "historia_familiar":historia_familiar,"historia_personal_social":historia_personal_social,"otros_sintomas":otros_sintomas,
  "describa_revision":describa_revision,"presionsan_max":presionsan_max,"presionsan_min":presionsan_min,
  "temperatura":temperatura,"pulsaciones":pulsaciones,"ritmo":ritmo,"descripcion_examenes":descripcion_examenes,
  "revision_medica":revision_medica,"actitudemocional":actitudemocional,"examenfisico_caracuello":examenfisico_caracuello,
  "region_vestibular":region_vestibular,"paladar_duro":paladar_duro,"paladar_blando":paladar_blando,"orofaringe":orofaringe,
  "piso_boca":piso_boca,"lengua":lengua,"cara_dorsal":cara_dorsal,
  "cara_ventral":cara_ventral,"bordes":bordes,"encia":encia,"dientes":dientes,"prescencia_calculo":prescencia_calculo,"salivacion":salivacion,
    "RevisiondeOrganos":revision_organos,"motivo_consulta":motivo,"sometido_a":sometido, "nivel_higiene_oral":nivel_higiene_oral, "desc_operacion":desc_operacion
};
  Future<void> addAdult() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addExpAdulto',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Expediente adulto añadido con exito"+motivo.last.toString());});
  }
  Future<void> UpdateAdult() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'updateExpAdulto',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print(motivo.last.toString());});
  }

}