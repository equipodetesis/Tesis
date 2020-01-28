
import 'package:cloud_functions/cloud_functions.dart';

class Adulto{
  String motivo , historia, fecha_ultima_visita, tratamiento_recibido , dientes_perdidos , causa_dientesperdidos , experiencias_exodoncias , higiene_oral , tipo_cepillo , tecnica_cepillado ,
      frecuencia_cepillado , ayudas_higiene_extras ,cuidadoMedico,hospital,expediente,fecha_ultimo_examen_medico, medicamentos, nombredelmedico;
  List enfermedades=List<String>();

  String enfermedad_persiste="", iniciacion_enf="", curso="", tratamiento="", estadoactual="", otros_enfermedades_padecidas="", operaciones="", trans_sanguine_somet="",
  radioterapia="", vacunas_recibidas="";

  //aun no en los formularios , revision_medica a punto de considerarse inecesaria, de aqui hacia abajo no estan contemplados a subirse por ahora
  String historia_familiar,historia_personal_social,otros_sintomas,describa_revision,presionsan_max,presionsan_min,temperatura,pulsaciones,ritmo,descripcion_examenes,
  revision_medica,actitudemocional,examenfisico_caracuello,
  //examen clinico bucal, se pregunta 2 veces por higiene oral...
  region_vestibular,paladar_duro,orofaringe,piso_boca,lengua,cara_dorsal,cara_ventral,bordes,encia,dientes,prescencia_calculo,salivacion
  ;
 List revision_organos=List<String>();
  String Userid;
 Adulto();

  Adulto.fromjson(Map<String, dynamic> data):
        motivo=data["motivo_consulta"] , historia=data["historia_enfermedad_actual"],fecha_ultima_visita=data["fecha_ultima_visita"], tratamiento_recibido=data["tratamiento"] ,
        dientes_perdidos=data["dientes_perdidos"], causa_dientesperdidos=data["causa_dientes_perdidos"] , experiencias_exodoncias=data["exper_exodocias"] ,
        higiene_oral=data["higiene_oral"] , tipo_cepillo =data["tipo_cepillo"], tecnica_cepillado=data["tipo_cepillado"] ,
        frecuencia_cepillado=data["frec_cepillado"] , ayudas_higiene_extras=data["ayudas_higiene_extra"] ,
        cuidadoMedico=data["cuidado_medico"],hospital=data["hospital"],expediente=data["expediente_medico"],fecha_ultimo_examen_medico=data["ult_exam_medico"],
        medicamentos=data["medicamentos"],nombredelmedico=data["nombre_medico"],enfermedades=data["enfermedades"], enfermedad_persiste=data["enfermedad_persiste"], 
        iniciacion_enf=data["iniciacion_enf"], curso=data["curso"], tratamiento=data["tratamiento"], estadoactual=data["estadoactual"], 
        otros_enfermedades_padecidas=data["otros_enfermedades_padecidas"], operaciones=data["operaciones"], trans_sanguine_somet=data["trans_sanguine_somet"], 
        radioterapia=data["radioterapia"], vacunas_recibidas=data["vacunas_recibidas"] ;

  Map<String,dynamic> toMap()=>{
    "motivo_consulta":motivo , "historia_enfermedad_actual":historia, "fecha_ultima_visita":fecha_ultima_visita, "tratamiento":tratamiento_recibido , "dientes_perdidos":dientes_perdidos ,
    "causa_dientes_perdidos":causa_dientesperdidos , "exper_exodocias":experiencias_exodoncias ,
    "higiene_oral":higiene_oral , "tipo_cepillo":tipo_cepillo, "tipo_cepillado":tecnica_cepillado ,
    "frec_cepillado":frecuencia_cepillado , "ayudas_higiene_extra":ayudas_higiene_extras ,
    "cuidado_medico":cuidadoMedico,"hospital":hospital,"expediente_medico":expediente,"ult_exam_medico":fecha_ultimo_examen_medico,
    "medicamentos":medicamentos, "nombre_medico":nombredelmedico,"enfermedades":enfermedades, "enfermedad_persiste":enfermedad_persiste, 
        "iniciacion_enf":iniciacion_enf, "curso":curso, "tratamiento":tratamiento, "estadoactual":estadoactual, 
        "otros_enfermedades_padecidas":otros_enfermedades_padecidas, "operaciones":operaciones, "trans_sanguine_somet":trans_sanguine_somet, 
        "radioterapia":radioterapia, "vacunas_recibidas":vacunas_recibidas
  };
  Future<void> addAdult() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addExpAdulto',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Expediente adulto añadido con exito");});
  }
  Future<void> UpdateAdult() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'updateExpAdulto',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Expediente adulto actualizado con exito");});
  }
}