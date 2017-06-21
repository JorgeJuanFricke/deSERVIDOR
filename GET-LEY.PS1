# actualiza-Ley

function actualiza-Ley {


<#
.SYNOPSIS
Actualiza rdf de leyes desde el BOE
.DESCRIPTION
para cada ley construyes url xml del boe, obtiene los metadatos y el analisis y actualiza la base de datos rdf
#>


param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True,
            HelpMessage="Código BOE de la ley a actualizar")]
    [string]$LeyBOE,
    [string]$EndPoint   
    
)
$objLey = {}
$boe = "https://www.boe.es/diario_boe/xml.php?id=BOE-A-1988-17787"

$xmlLey = [XML] (Invoke-WebRequest $boe)



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

return $objLey
    
}



<#
.SYNOPSIS
escribe propiedades leyes 
.DESCRIPTION
#>




param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$False,
            HelpMessage="Nombre del fichero exportado de calibre")]
    [string]$xmlCalibre,
    [string]$ErrorLog = 'c:\noconvertidos.txt',
    [switch]$LogErrors
    
)

Add-Type -Assembly System.Web    

$GrafoTTL = @"
function set-Ley(Ley)
    $Ley deOI:departamento $xmlLey.documento.metadatos.rango
    deOI:rangoCodigo "Real Decreto" ;

    deOI:fechaDisposicion "19850924" ;
    deOI:FechaPublicacion "19851028" ;
    deOI:fechaVigencia "19851117" ;
    deOI:fechaDerogacion "20080321" ;
    deOI:estatusLegislativo "L" ;
    deOI:origenLegislativo "Estatal" ;
    deOI:estadoConsolidacion 0 ;
    deOI:judicialmenteAnulada "N" ;
    deOI:vigenciaAgotada "S" ;
    deOI:estatusDerogacion "S" ;
    deOI:Materias = [string] ($xmlley.documento.analisis.materias.materia.innertext)
    
