# actualiza-Ley



function Actualiza-Leyes {
    


<#
.SYNOPSIS
Actualiza propiedades de leyes obteniendolas del BOE
#>

Get-CodigoLeyBoe | Get-xmlLeyBOE | set-RDFLey
}








function Get-xmlLeyBOE {
    


<#
.SYNOPSIS
Obtiene los metadatos en xml de leyes desde el BOE y los pasa como objetos PW
.DESCRIPTION
para cada ley con id del boe construye la url xml , obtiene los metadatos y el analisis y actualiza la base de datos rdf
.PARAMETRO $LeyBoe
#>



[CmdLetBinding()]

param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True,
            HelpMessage="CÃ³digo BOE de la ley a actualizar")]
    [string]$LeyBOE,

    [string]$EndPoint = "",

    [string}$urlBoe = "www.boe.es" ,

    [switch]$LogError
    
)

BEGIN {
  
  Write-Verbose "Error log será "c:\PWLOGS\logsLEYbOE"
  
}

PROCESS {
    Write-verbose "entrando en process con $leyBoe"
    foreach ($Ley in $LeyBoe)
    $urlXmlBOE = $urlBoe + $leyBoe
    $xmlLey = [XML] (Invoke-WebRequest $urlXmlBOE)
    $objLey = @{}

    $objLey.Codigo = $Ley
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


    
    write-Output $objLey

END {}
    
}







function Get-RDFCodigoLey {

<#
.SYNOPSIS
obtiene lista de códigos del boe de las leyes introducidas en el endpoint RDF
.DESCRIPTION
ñlkjñlkj
.PARAMETER endPoint
url servidor web y repositorio donde residen las leyes. Posee valor por defecto
#>


param (
    [Parameter(Mandatory=$False,
            ValueFromPipeline=$True)]
    string $endPoint = "DGT71543:8080/repositorie/deOI" 
)

    BEGIN {
     write-verbose "se utiliza el endPoint $endPoint"
    }


    PROCESS {
        query = 'SELECT ?Ley WHERE {?Ley rdf:type deOI:Ley. }'
        Try {
            Invoke-WebRequest(update RDF4J)
        }
        Catch {
            write-warning "error accediendo endpoint"
        }
    }
    
}







function Set-RDFLey{

<#
.SYNOPSIS
escribe propiedades de leyes contenidas en el objeto PW en el RDF endpoint
.DESCRIPTION
#>




param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
    [string]$ObjLey,

    [string]$ErrorLog = 'c:\noconvertidos.txt',
    [switch]$LogErrors
    
)

BEGIN 
    write-verbose "Actualizando leyes"
    
}



PROCESS {
    foreach ($Ley in $ObjLey) {
        $query = "Update {
        '$($Ley.Codigo)'
        deOI:departamento '$($Ley.Departamento)' ;
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
        }" 
        Invoke-WebRequest(update RDF4J)

        # Next, allow the use of self-signed SSL certificates.

        [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

        # Create variables to store the values consumed by the Invoke-RestMethod command. The search variable contents are later embedded in the body variable.

        $servidor = "DGT79159"
        $url = "https://${servidor}:8080/openrdf-sesame/repositories/DGT/statements"
        $query = "SELECT ?p ?o WHERE {?s ?p ?o} LIMIT 50"



        $body = @{
             search = $search
             output_mode = "csv"
             earliest_time = "-2d@d"
             latest_time = "-1d@d"
        }


        Invoke-RestMethod -Method Post -Uri $url -Credential $cred -Body $body 

                   
}



}

# EJECUTA
# PIPELINE
"https://www.boe.es/diario_boe/xml.php?id=BOE-A-1988-17787" | get-LeyBoe | set-LeyRDF