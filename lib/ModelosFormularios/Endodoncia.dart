import 'package:cloud_functions/cloud_functions.dart';

class Endodoncia{
  String Desde_cuando_aparecio_el_dolor,
      Dimen_vertical_oclusion, Dimen_vertical_reposo,
      Discontinuidad_de_la_lamina_pura, Ensancha_del_espacio_del_Ligamiento_preden, Lateralidad_D,
      Lateralidad_Iz,Lesiones_Periapicales, Lesiones_de_furca, MotivoConsulta, Observaciones,
      Oclusion_metrica,Reabsorcion_Horizontal_Avanzada, Reabsorcion_Horizontal_Moderada, Reabsorcion_Horizontal_incipiente,
      Reabsorcion_Irregular, Reabsorcion_Vertical_Avanzada, Reabsorcion_Vertical_Moderada, Reabsorcion_Vertical_incipiente,
      Relacion1_1, Relacion1_2, Relacion2_1, Relacion_Molar_derecha, Relacion_Molar_izquierda, Relacion_canina_derecha,
      Relacion_canina_izquierda, aumenta_a_los_cambios_posturales_el_dolor,
      es_espontaneo_el_dolor, es_provocado, es_pulsatin_agudo_o_tenue, intermitente_o_constante_el_dolor,
      linea_media_dentariatra,localizado_o_irradiado_el_dolor, mord_cruzada,
      otrossintomas_de_dolor, protrusiva ,se_alivia_con_analgesicos, sobremor_horizon, sobremor_verti,userid;


  Endodoncia.set(this.Desde_cuando_aparecio_el_dolor, this.Dimen_vertical_oclusion,
      this.Dimen_vertical_reposo, this.Discontinuidad_de_la_lamina_pura,
      this.Ensancha_del_espacio_del_Ligamiento_preden, this.Lateralidad_D,
      this.Lateralidad_Iz, this.Lesiones_Periapicales, this.Lesiones_de_furca,
      this.MotivoConsulta, this.Observaciones, this.Oclusion_metrica,
      this.Reabsorcion_Horizontal_Avanzada,
      this.Reabsorcion_Horizontal_Moderada,
      this.Reabsorcion_Horizontal_incipiente, this.Reabsorcion_Irregular,
      this.Reabsorcion_Vertical_Avanzada, this.Reabsorcion_Vertical_Moderada,
      this.Reabsorcion_Vertical_incipiente, this.Relacion1_1, this.Relacion1_2,
      this.Relacion2_1, this.Relacion_Molar_derecha,
      this.Relacion_Molar_izquierda, this.Relacion_canina_derecha,
      this.Relacion_canina_izquierda,
      this.aumenta_a_los_cambios_posturales_el_dolor,
      this.es_espontaneo_el_dolor, this.es_provocado,
      this.es_pulsatin_agudo_o_tenue, this.intermitente_o_constante_el_dolor,
      this.linea_media_dentariatra, this.localizado_o_irradiado_el_dolor,
      this.mord_cruzada, this.otrossintomas_de_dolor, this.protrusiva,
      this.se_alivia_con_analgesicos, this.sobremor_horizon,
      this.sobremor_verti);

  void set(Desde_cuando_aparecio_el_dolor,
      Dimen_vertical_oclusion,Dimen_vertical_reposo,
      Discontinuidad_de_la_lamina_pura,
      Ensancha_del_espacio_del_Ligamiento_preden,Lateralidad_D,
      Lateralidad_Iz, Lesiones_Periapicales, Lesiones_de_furca,
      MotivoConsulta, Observaciones, Oclusion_metrica,
      Reabsorcion_Horizontal_Avanzada,
      Reabsorcion_Horizontal_Moderada,
      Reabsorcion_Horizontal_incipiente, Reabsorcion_Irregular,
      Reabsorcion_Vertical_Avanzada, Reabsorcion_Vertical_Moderada,
      Reabsorcion_Vertical_incipiente, Relacion1_1, Relacion1_2,
      Relacion2_1, Relacion_Molar_derecha,
      Relacion_Molar_izquierda, Relacion_canina_derecha,
      Relacion_canina_izquierda,
      aumenta_a_los_cambios_posturales_el_dolor,
      es_espontaneo_el_dolor, es_provocado,
      es_pulsatin_agudo_o_tenue, intermitente_o_constante_el_dolor,
      linea_media_dentariatra, localizado_o_irradiado_el_dolor,
      mord_cruzada, otrossintomas_de_dolor, protrusiva,
      se_alivia_con_analgesicos, sobremor_horizon,
      sobremor_verti){
        Endodoncia.set(Desde_cuando_aparecio_el_dolor, Dimen_vertical_oclusion, Dimen_vertical_reposo,
            Discontinuidad_de_la_lamina_pura, Ensancha_del_espacio_del_Ligamiento_preden, Lateralidad_D, Lateralidad_Iz,
            Lesiones_Periapicales, Lesiones_de_furca, MotivoConsulta, Observaciones, Oclusion_metrica, Reabsorcion_Horizontal_Avanzada,
            Reabsorcion_Horizontal_Moderada, Reabsorcion_Horizontal_incipiente, Reabsorcion_Irregular, Reabsorcion_Vertical_Avanzada,
            Reabsorcion_Vertical_Moderada, Reabsorcion_Vertical_incipiente, Relacion1_1, Relacion1_2, Relacion2_1, Relacion_Molar_derecha,
            Relacion_Molar_izquierda, Relacion_canina_derecha, Relacion_canina_izquierda, aumenta_a_los_cambios_posturales_el_dolor,
            es_espontaneo_el_dolor, es_provocado, es_pulsatin_agudo_o_tenue, intermitente_o_constante_el_dolor, linea_media_dentariatra,
            localizado_o_irradiado_el_dolor, mord_cruzada, otrossintomas_de_dolor, protrusiva, se_alivia_con_analgesicos, sobremor_horizon,
            sobremor_verti);

      }
      Map<String,dynamic> toMap()=>{
        "Desde_cuando_aparecio_el_dolor":Desde_cuando_aparecio_el_dolor, "Dimen_vertical_oclusion":Dimen_vertical_oclusion,
        "Dimen_vertical_reposo":Dimen_vertical_reposo, "Discontinuidad_de_la_lamina_pura":Discontinuidad_de_la_lamina_pura,
        "Ensancha_del_espacio_del_Ligamiento_preden":Ensancha_del_espacio_del_Ligamiento_preden, "Lateralidad_D":Lateralidad_D, "Lateralidad_Iz":Lateralidad_Iz,
        "Lesiones_Periapicales":Lesiones_Periapicales, "Lesiones_de_furca":Lesiones_de_furca, "MotivoConsulta":MotivoConsulta,
        "Observaciones":Observaciones, "Oclusion_metrica":Oclusion_metrica, "Reabsorcion_Horizontal_Avanzada":Reabsorcion_Horizontal_Avanzada,
        "Reabsorcion_Horizontal_Moderada":Reabsorcion_Horizontal_Moderada, "Reabsorcion_Horizontal_incipiente":Reabsorcion_Horizontal_incipiente,
        "Reabsorcion_Irregular":Reabsorcion_Irregular, "Reabsorcion_Vertical_Avanzada":Reabsorcion_Vertical_Avanzada,
        "Reabsorcion_Vertical_Moderada":Reabsorcion_Vertical_Moderada, "Reabsorcion_Vertical_incipiente":Reabsorcion_Vertical_incipiente,
        "Relacion1_1":Relacion1_1,"Relacion1_2":Relacion1_2, "Relacion2_1":Relacion2_1, "Relacion_Molar_derecha":Relacion_Molar_derecha,
        "Relacion_Molar_izquierda":Relacion_Molar_izquierda,"Relacion_canina_derecha":Relacion_canina_derecha,"Relacion_canina_izquierda":Relacion_canina_izquierda,
        "aumenta_a_los_cambios_posturales_el_dolor":aumenta_a_los_cambios_posturales_el_dolor,
        "es_espontaneo_el_dolor":es_espontaneo_el_dolor, "es_provocado":es_provocado, "es_pulsatin_agudo_o_tenue":es_pulsatin_agudo_o_tenue,
        "intermitente_o_constante_el_dolor":intermitente_o_constante_el_dolor, "linea_media_dentariatra":linea_media_dentariatra,
        "localizado_o_irradiado_el_dolor":localizado_o_irradiado_el_dolor, "mord_cruzada":mord_cruzada,"otrossintomas_de_dolor":otrossintomas_de_dolor, "protrusiva":protrusiva,
        "se_alivia_con_analgesicos":se_alivia_con_analgesicos, "sobremor_horizon":sobremor_horizon,
        "sobremor_verti":sobremor_verti
      };
  Future<void> addCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCliente',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Ingresado con exito");});
  }
  Future<void> updateCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'updateCliente',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Ingresado con exito");});
  }




}