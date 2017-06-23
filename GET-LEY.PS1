# actualiza-Ley

function Get-LeyBOE {


<#
.SYNOPSIS
Obtiene xml de leyes desde el BOE
.DESCRIPTION
para cada ley construyes url xml del boe, obtiene los metadatos y el analisis y actualiza la base de datos rdf
#>


param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True,
            HelpMessage="Código BOE de la ley a actualizar")]
    [string]$LeyBOE,

    [string]$EndPoint = 
    
)

BEGIN {
   
  
}

PROCESS {

    foreach (LeyBOE in Leyes)
    $xmlLey = [XML] (Invoke-WebRequest $LeyBOE)



    $objLey.departamento = $xmlLey.documento.metadatos.departamento
    $objLey.rango = $xmlLey.documento.metadatos.rango
    $objLey.fechaDisposicion = $xmlLey.documento.metadatos.fecha_disposicion
    $objLey.fechaPublicacion = $xmlLey.documento.metadatos.fecha_publicacion
    $objLey.fechaVigencia = $xmlLey.documento.metadatos.fecha_vigencia
    $objLey.fechaDerogacion =  $xmlLey.documento.metadatos.fecha_Derogacion
    $objLey.estatusLegislativo = $xmlLey.documento.metadatos.estatus_legislativo
    $objLey.origenLegislativo = $xmlLey.documento.metadatos.origen_legislativo
    $objLey.estadoConsolidacion = $xmlLey.documento.metadatos.estado_consolidacion
    $objLey.judicialmenteAnulada = $xmlLey.documento.metadatos.fecha_disposicion
    $objLey.vigenciaAgotada = $xmlLey.documento.metadatos.vigenciaAgotada
    $objLey.estatusDerogacion = $xmlLey.documento.metadatos.estatus_derogacion
    $objLey.materias =  $xmlLey.documento.analisis.materias.materia.innertext


    $objLey = PsObject -...

END {}
    
}






function Set-LeyRDF {

<#
.SYNOPSIS
escribe propiedades leyes en el RDF endpoint
.DESCRIPTION
#>




param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
    [string]$xmlCalibre,

    [string]$ErrorLog = 'c:\noconvertidos.txt',
    [switch]$LogErrors
    
)

BEGIN {
$GrafoTTL = @"
Update {
    $LeyBoe 
        deOI:departamento $objLey.Departamento ;
        deOI:rangoCodigo $objLey.rango ;
        deOI:fechaDisposicion $objLey.fechadisposicion ;
        deOI:FechaPublicacion $objley.fechaPublicacion ;
        deOI:fechaVigencia $objley.fechaVigencia ;
        deOI:fechaDerogacion $objley.fechaderogacion ;
        deOI:estatusLegislativo $objley.estatuslegislativo ;
        deOI:origenLegislativo $objley.origenLegislativo ;
        deOI:estadoConsolidacion $objley.estadoConsolidacion ;
        deOI:judicialmenteAnulada $objley.judicialmenteAnulada ;
        deOI:vigenciaAgotada $objley.vigenciaAgotada ;
        deOI:estatusDerogacion $objley.estatusDerogacion ;
        deOI:Materias = $objley.Materias .
    }
    WHERE {} 
}
"@


PROCESS {
    foreach (Ley in Leyes) {
        query = $GrafoTTL($LeyBOE)
        Invoke-WebRequest(update RDF4J)

    
}



}

# EJECUTA
# PIPELINE
"https://www.boe.es/diario_boe/xml.php?id=BOE-A-1988-17787" | get-LeyBoe | set-LeyRDF