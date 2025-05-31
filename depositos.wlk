import bicis.* 
class Deposito {
    const bicis = []

    method agregarBicis(listaDeBicis){
        if(listaDeBicis.any({b=>b.contains(b)})) {
            //self.error("No se pueden agregar bicis repetidas")
            throw new Exception(message="No se pueden agregar bicis repetidas")
        }
        if(listaDeBicis.any({b=>listaDeBicis.occurrencesOf(b)> 1})) {
            self.error("Hay bicis repetidas en la lista")
        }
        
        bicis.addAll(listaDeBicis)
    }

    // 1. Bicis rápidas: velocidad de crucero mayor a 25
    method bicisRapidas() = bicis.filter({ b => b.velocidadCrucero() > 25 })

    method marcasSinRepetidos() {
    const marcas = bicis.map({ b => b.marca() })
    const marcasUnicas = marcas.asSet()
    if (marcas.size() != marcasUnicas.size()) {
        throw new Exception(message = "Hay marcas repetidas en el depósito")
    }
    return marcasUnicas
}

    // 3. Es nocturno: todas las bicis tienen luz
    method esNocturno() = bicis.all({ b => b.tieneLuz() })

    // 4. Tiene bici para llevar al menos 'kilos'
    method tieneBiciParaLlevar(kilos) = bicis.any({ b => b.carga() > kilos })

      // 1. Marca de la bici más rápida
    method marcaBiciMasRapida() {
        if (bicis.isEmpty()) {
            throw new Exception(message = "El depósito está vacío")
        }
        bicis.max({ b => b.velocidadCrucero() }).marca()
    }

    // 2. Carga total de las bicis largas (> 170 cm)
    method cargaTotalBicisLargas() = 
        bicis.filter({ b => b.largo() > 170 }).sum({ b => b.carga() })

     // 3. Cantidad de bicis sin accesorios
    method cantidadBicisSinAccesorios() = 
        bicis.count({ b => b.accesorios().isEmpty() })

}