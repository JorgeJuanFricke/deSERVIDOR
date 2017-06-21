# SET-RDFLEYES.PS1

function Set-RDFLeyes {


<#
.SYNOPSIS
Actualiza propiedades rdf de leyes obtenidas desde el BOE
.DESCRIPTION
para cada ley construyes url xml del boe, obtiene los metadatos y las materias y actualiza la base de datos rdf
#>


param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True,
            HelpMessage="Código BOE de la ley a actualizar")]
    [string]$LeyBOE,
    [string]$EndPoint   
    
)

fechaGenerado = get-date

$Prefijos = @"
PREFIX prov:<http://www.w3.org/ns/prov#>
PREFIX foaf:<http://xmlns.com/foaf/0.1/>
PREFIX deOI:<http://github.com/georgedelajungla/deOI/deOI#
PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd:<http://www.w3.org/2001/XMLSchema#>
PREFIX owl:<http://www.w3.org/2002/07/owl#>
PREFIX skos:<http://www.w3.org/2004/02/skos/core#>
"@

$Ley = @"
    $LeyBoe
    deOI:departamento "$xmlLey.documento.metadatos.departamento" ;
    deOI:rango "$xmlLey.documento.metadatos.rango" ;
    deOI:fechaDisposicion "$xmlLey.documento.metadatos.fecha_disposicion" ;
    deOI:fechaPublicacion "$xmlLey.documento.metadatos.fecha_publicacion" ;
    deOI:fechaVigencia "$xmlLey.documento.metadatos.fecha_vigencia" ;
    deOI:fechaDerogacion "$xmlLey.documento.metadatos.fecha_Derogacion" ;
    deOI:estatusLegislativo "$xmlLey.documento.metadatos.estatus_legislativo" ;
    deOI:origenLegislativo "$xmlLey.documento.metadatos.origen_legislativo" ;
    deOI:estadoConsolidacion "$xmlLey.documento.metadatos.estado_consolidacion" ;
    deOI:judicialmenteAnulada "$xmlLey.documento.metadatos.fecha_disposicion" ;
    deOI:vigenciaAgotada "$xmlLey.documento.metadatos.vigenciaAgotada" ;
    deOI:estatusDerogacion "$xmlLey.documento.metadatos.estatus_derogacion" ;
    deOI:materias "$xmlLey.documento.analisis.materias.materia.innertext" .
    prov:generatedAtTime "$FechaGenerado" ;
    prov:wasAttributedTo deOI:jjuan ;
    prov:wasGeneratedWith "función Powershell actualiza-Ley " .
"@  

    
$objLey = {}
$EndPoint = "https://www.boe.es/diario_boe/xml.php?id=BOE-A-1988-17787"

$xmlLey = [XML] (Invoke-WebRequest $boe)

process

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


    ForEach-Object {
        $id = [System.Web.HttpUtility]::UrlEncode($_.title.sort) 
        $titulo = $_.title.sort
        $autor =  $_.authors.author 
        $editor = if ($_.publisher) {$_.publisher} else {"Desconocido"}
        $size = $_.size
        $url =  [System.Web.HttpUtility]::UrlEncode($_.formats.format)     
        $tags = $_.tags.tag
        $fechaPubl = $_.pubdate 
        $fechaModi = $_.pubdate
        $cover =if ($_.cover) {$_.cover} else {"Sin portada"}        
        $FechaGenerado = get-date


       
        out-file -Append -filepath C:\users\usuario\desktop\documentos.ttl -InputObject $LibroTTL 
       
}


