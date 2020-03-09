class Cirugia{
  String antec_pato_madre, antec_pato_abuelama, antec_pato_abueloma, antec_pato_padre, antec_pato_abuelapa, antec_pato_abuelopa, grupo_sanguineo,
  factor_rh, inmunizaciones_infancia, inmunizaciones_adulto, regimen_alimenticio, condiciones_habitacionales, enfermedades_infancia,
  antecedentes_traumaticos, antecedentes_quirurgicos, transfuciones, radio_quimioterapia, experiencia_anestesia, clasificacion_asa, frecuencia_cardiaca,
  tension_arterial, frecuencia_resipiratoria, temperatura, peso, talla, constitucion_fisica, craneo_tipo, exostosis, endostosis,
  asimetrias_transversales, asimetrias_longitudinales, enoftalmo, exoftalmo, movilidad, midriasis, miosis, reflejo_pupilar, nariz,
  color_piel, palida, cianotica, enrojecida, manchas, hipotonico, hipertonico, espasticos, ganglios_linfaticos, labios, carrillos, paladar_duro,
  paladar_blando, orafaringe, piso_boca, lengua, encia, dientes, padecimiento_actual, interpretacion_radiografica, hemoglobina, hematocrito,
  neutrofilos, linfocitos, eosinofilos, basofilos, monocitos, hemoglobina_glucolisada, glicemia, otros_sangre, tiempo_sangrado, tiempo_coagulacion,
  cuenta_plaquetas, tiempo_protombina, tiempo_tromboplastina, inr, maxilar_superior, maxilar_inferior, diagnostico, pronostico, tratamiento,
  antisepsia, anestesia, incision, diseccion_mucoperiostica, osteotomia_ostectomia, operacion, cuidados_herida, sutura, primeras_24h,
  despues_24h, incidentes, analgesicos, antibioticos, ansioliticos, otros_medicamentos, nombre_cirujano, nombre_ayudante, nombre_instrumentista,
  nombre_asistente, hora_inicio, hora_termino, valor_tratamiento, retiro_sutura, estado_postquirurgico, dado_alta;

  List adicciones = List(), alergias = List(), digestivo = List(), respiratorio = List(), cardiovascular = List(), genitourinario = List(), endocrino = List(), hematologico = List(), neurologico = List(), musculo_esqueleto = List(),
  inmunologico = List(), articulacion_temporomandibular = List(), radiografia = List(), analisis_laboratorio = List(), tratamiento_digestivo = List(), tratamiento_respiratorio = List(),
  tratamiento_cardiovascular = List(), tratamiento_genitourinario = List(), tratamiento_endocrino = List(), tratamiento_hematologicas = List(),tratamiento_neurologico = List(),
  tratamiento_musculo_esqueleto = List(), tratamiento_inmulogico = List(), tratamiento_tegumentario = List();
  void fromJson(Map<String, dynamic> data) {
    antec_pato_madre=data["antec_pato_madre"]; antec_pato_abuelama=data["antec_pato_abuelama"]; antec_pato_abueloma=data["antec_pato_abueloma"]; antec_pato_padre=data["antec_pato_padre"];
    antec_pato_abuelapa=data["antec_pato_abuelapa"]; antec_pato_abuelopa=data["antec_pato_abuelopa"]; grupo_sanguineo=data[" grupo_sanguineo"];
    factor_rh=data["factor_rh"]; inmunizaciones_infancia=data["inmunizaciones_infancia"]; inmunizaciones_adulto=data["inmunizaciones_adulto"];
    regimen_alimenticio=data[" grupo_sanguineo"]; condiciones_habitacionales=data[" condiciones_habitacionales"]; enfermedades_infancia=data["enfermedades_infancia"];
    antecedentes_traumaticos=data["antecedentes_traumaticos"]; antecedentes_quirurgicos=data["antecedentes_quirurgicos"]; transfuciones=data["transfuciones"]; radio_quimioterapia=data["radio_quimioterapia"];
    experiencia_anestesia=data["experiencia_anestesia"]; clasificacion_asa=data["clasificacion_asa"]; frecuencia_cardiaca=data["frecuencia_cardiaca"];
    tension_arterial=data["tension_arterial"]; frecuencia_resipiratoria=data["frecuencia_resipiratoria"]; temperatura=data["temperatura"];
    peso=data["peso"]; talla=data["talla"]; constitucion_fisica=data["constitucion_fisica"]; craneo_tipo=data["craneo_tipo"]; exostosis=data["exostosis"]; endostosis=data["endostosis"];
    asimetrias_transversales=data["asimetrias_transversales"]; asimetrias_longitudinales=data["asimetrias_longitudinales"]; enoftalmo=data["enoftalmo"]; exoftalmo=data["exoftalmo"]; movilidad=data["movilidad"]; midriasis=data["midriasis"]; miosis=data["miosis"]; reflejo_pupilar=data["reflejo_pupilar"]; nariz=data["nariz"];
    color_piel=data["color_piel"]; palida=data[" palida"]; cianotica=data["cianotica"]; enrojecida=data["enrojecida"]; manchas=data["manchas"]; hipotonico=data["hipotonico"]; hipertonico=data["hipertonico"]; espasticos=data["espasticos"]; ganglios_linfaticos=data["ganglios_linfaticos"]; labios=data["labios"]; carrillos=data["carrillos"]; paladar_duro=data[" paladar_duro"];
    paladar_blando=data["paladar_blando"]; orafaringe=data["orafaringe"]; piso_boca=data["piso_boca"]; lengua=data["lengua"]; encia=data["encia"];
    dientes=data["dientes"]; padecimiento_actual=data["padecimiento_actual"]; interpretacion_radiografica=data["interpretacion_radiografica"]; hemoglobina=data["hemoglobina"]; hematocrito=data[" hematocrito"];
    neutrofilos=data["  neutrofilos"]; linfocitos=data["linfocitos"]; eosinofilos=data["eosinofilos"]; basofilos=data["basofilos"]; monocitos=data["monocitos"]; hemoglobina_glucolisada=data["hemoglobina_glucolisada"]; glicemia=data["glicemia"]; otros_sangre=data["otros_sangre"]; tiempo_sangrado=data["tiempo_sangrado"]; tiempo_coagulacion=data["tiempo_coagulacion"];
    cuenta_plaquetas=data["cuenta_plaquetas"]; tiempo_protombina=data["tiempo_protombina"]; tiempo_tromboplastina=data["tiempo_tromboplastina"]; inr=data["inr"];
    maxilar_superior=data["maxilar_superior"]; maxilar_inferior=data["maxilar_inferior"]; diagnostico=data["diagnostico"]; pronostico=data["pronostico"]; tratamiento=data["tratamiento"];
    antisepsia=data["antisepsia"]; anestesia=data["anestesia"]; incision=data["incision"]; diseccion_mucoperiostica=data["diseccion_mucoperiostica"];
    osteotomia_ostectomia=data["osteotomia_ostectomia"]; operacion=data["operacion"];cuidados_herida=data["cuidados_herida"]; sutura=data["sutura"]; primeras_24h=data["primeras_24h"];
    despues_24h=data["despues_24h"]; incidentes=data["incidentes"]; analgesicos=data["analgesicos"]; antibioticos=data["antibioticos"]; ansioliticos=data["ansioliticos"]; otros_medicamentos=data["otros_medicamentos"]; nombre_cirujano=data["nombre_cirujano"]; nombre_ayudante=data["nombre_ayudante"]; nombre_instrumentista=data["nombre_instrumentista"];
    nombre_asistente=data["nombre_asistente"]; hora_inicio=data["hora_inicio"]; hora_termino=data["hora_termino"]; valor_tratamiento=data["valor_tratamiento"]; retiro_sutura=data["retiro_sutura"]; estado_postquirurgico=data["estado_postquirurgico"]; dado_alta=data["dado_alta"];
    adicciones = data["adicciones"]; alergias = data["adicciones"]; digestivo = data["adicciones"]; respiratorio = data["adicciones"]; cardiovascular = data["adicciones"];
    genitourinario = data["adicciones"]; endocrino = data["adicciones"]; hematologico = data["adicciones"]; neurologico = data["adicciones"]; musculo_esqueleto = data["adicciones"];
    inmunologico = data["adicciones"]; articulacion_temporomandibular = data["adicciones"]; radiografia = data["adicciones"]; analisis_laboratorio = data["adicciones"]; tratamiento_digestivo = data["adicciones"]; tratamiento_respiratorio = data["adicciones"];
    tratamiento_cardiovascular = data["adicciones"]; tratamiento_genitourinario = data["adicciones"]; tratamiento_endocrino = data["adicciones"]; tratamiento_hematologicas = data["adicciones"];tratamiento_neurologico = data["adicciones"];
    tratamiento_musculo_esqueleto = data["adicciones"]; tratamiento_inmulogico = data["adicciones"]; tratamiento_tegumentario = data["adicciones"];
  }

}