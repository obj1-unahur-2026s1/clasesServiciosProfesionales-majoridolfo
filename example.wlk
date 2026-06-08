
class Profesional{
 const universidadEstudio
 
 method universidad(){return universidadEstudio}
 method honorarios()
 method dondeTrabajar()

}
class Universidad{
  method provinciaUbicada()
  method honorarioRecomendado()
}
class ProfesionalesVinculado inherits Profesional{
 override method dondeTrabajar(){return [universidadEstudio.provinciaUbicada()]}
 override method honorarios(){return universidadEstudio.honorarioRecomendado() }
}
class ProfesionalesLitoral inherits Profesional{
   const provincias = ["entreRios","SantaFe","corrientes"]
  override method dondeTrabajar(){return provincias }
  override method honorarios(){return 3000 }
}
class ProfesionalesLibres inherits Profesional{
  var provincias = []
  var honorarios 
  override method dondeTrabajar(){return provincias}
  override method honorarios(){return honorarios }
}
class Empresa {
  const profesionales = []
  const honorariosReferencia

  method contratar(unProfesional){return profesionales.add(unProfesional)}
  method estudiaronEn(unaUniversidad){return profesionales.count({p=>p.universidad() == unaUniversidad})}
  method profesionalesCaros(){return profesionales.filter({p=>p.honorarios()>honorariosReferencia})}
  method universidadFormadoras(){return profesionales.map({p=>p.universidad()}).asSet()}
  method profesionalBarato(){return profesionales.min({p=>p.honorarios()})}
  method profesionalesAcotado(){return profesionales.all({p=>p.dondeTrabajar().size()<=3})}
}