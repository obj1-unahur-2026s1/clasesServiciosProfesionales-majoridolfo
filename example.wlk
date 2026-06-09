
class Profesional{
 const universidadEstudio
 method universidad(){return universidadEstudio}
 method honorarios()
 method dondeTrabajar()
 method cobrar(importe)
}
class Universidad{
  var totalDonaciones
  method provinciaUbicada()
  method honorarioRecomendado()
  method rebibirDonacion(unValor){totalDonaciones=totalDonaciones + unValor}
}
class ProfesionalesVinculado inherits Profesional{
 override method dondeTrabajar(){return [universidadEstudio.provinciaUbicada()]}
 override method honorarios(){return universidadEstudio.honorarioRecomendado()}
 override method cobrar(importe){universidadEstudio.recibirDonacion(importe/2)}

}
class ProfesionalesLitoral inherits Profesional{
   const provincias = ["entreRios","SantaFe","corrientes"]
   const asociacion
  override method dondeTrabajar(){return provincias }
  override method honorarios(){return 3000 }
  override method cobrar(importe){asociacion.recibirPago(importe)}
}
object asociacionLitorial{
  var totalPagos = 0
  method recibirPago(importe){totalPagos = totalPagos + importe}
}
class ProfesionalesLibres inherits Profesional{
  const provincias = []
  const honorarios 
  var totalRecaudado = 0
  override method dondeTrabajar(){return provincias}
  override method honorarios(){return honorarios}
  override method cobrar(importe){totalRecaudado = totalRecaudado + importe}
  method pasaDinero(otroProfesional,cantidad){
    totalRecaudado = totalRecaudado - cantidad
    otroProfesional.cobrar(cantidad)}
}
class Empresa {
  const profesionales = []
  const honorariosReferencia
  const solicitantes

  method contratar(unProfesional){return profesionales.add(unProfesional)}
  method estudiaronEn(unaUniversidad){return profesionales.count({p=>p.universidad() == unaUniversidad})}
  method profesionalesCaros(){return profesionales.filter({p=>p.honorarios()>honorariosReferencia})}
  method universidadFormadoras(){return profesionales.map({p=>p.universidad()}).asSet()}
  method profesionalBarato(){return profesionales.min({p=>p.honorarios()})}
  method profesionalesAcotado(){return profesionales.all({p=>p.dondeTrabajar().size()<=3})}
  method satisfacerSolicitante(){return solicitantes.any({s=>s.puedeSerAtendida()}) }
}
class Solicitantes{

  method puedeSerAtendida(profesional)
}
class Persona inherits Solicitantes{
  const vivienda
 override method puedeSerAtendida(profesional){ return profesional.dondeTrabajar().contains(vivienda)}
}

class Institucion inherits Solicitantes {
 const uniReconocidas
  override method puedeSerAtendida(profesional){return uniReconocidas.contains(profesional.universidad())}
}

class Club inherits Solicitantes {
  const ubicacionCedes 
  override method puedeSerAtendida(profesional){return ubicacionCedes.any({p=>profesional.dondeTrabajar().contains(p)})}//p=provincia//
}


