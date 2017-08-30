<# MODULO SERVIDOR deJEFA #>



Add-Type -Assembly System.Web

<#
Módulo con las funciones para el servidor 
#>
$urldeOI = "http://10.50.208.48:8080/rdf4j-server/repositories/deOI"
$urlRepos = "http://10.50.208.48:8080/rdf4j-server/repositories"




# Añade los menus
$Inventario = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("Inventario",$null,$null)
$Inventario.Submenus.add("Consulta",{C:\PW\Ernesto.ps1}, $null)
$Inventario.Submenus.add("Añadir", {C:\PW\Ernesto.ps1}, $null)
$Inventario.Submenus.add("Importar inventario",$null, $null)
$Inventario.Submenus.add("Exportar inventario", $null, $null)
$Tareas = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("Tareas",$null, $null)
$Tareas.Submenus.Add("Mantenimiento Tareas",$null, $null)
$Tareas.Submenus.Add("Imprimir tarea", $null, $null)
$deOI = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("deOI", $null, $null)
$deOI.Submenus.Add("Backup deOI", {Backup-deOI}, $null)
$deOI.Submenus.Add("Actualizar leyes", {Actualiza-Leyes}, $null)
$deOI.Submenus.Add("Importar sanciones", {Importa-Sanciones}, $null)
$deOI.Submenus.Add("Añadir trámite", {C:\usuarios\42795331\deServidor\NuevoTramite}, $null)
$psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("borrar menú",{$psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.clear()},$null)













function Actualiza-Leyes {
<#
.SYNOPSIS
Actualiza propiedades de leyes obteniéndolas del BOE
#>

    
    "BOE-A-1985-22259" | Get-xmlLeyBOE  -verbose
 }


function Importa-Sanciones {
    write-host "no hace nada"
}








# -----------------------------------------------------------------------------

function Renueva-Comunitario {

$IE = new-object -ComObject 'InternetExplorer.Application'
$IE 
$IE.navigate('http://intranet.trafico.es/') 
$CurrentDoc = $IE.Document
$CurrentDoc
$CurrentDoc  | select-object Type, Name

}





function Get-RDFLeyes {
<#
.SYNOPSIS
Obtiene los códigos BOE de la leyes a actualizar desde el RdfServer
#>
$query = @"
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX deOI: <http://github.com/georgedelajungla/deOI/deOI#>
SELECT ?ley WHERE {?ley rdf:type deOI:Ley }  
"@
$Equery = [System.Web.HttpUtility]::UrlEncode($query)
$body = "query=$Equery"
$header = @{Accept='SPARQL/JSON'}

 
 $a = Invoke-RestMethod  $urldeOI -method post -body $body -Contenttype application/x-www-form-urlencoded -headers @{'Accept'='application/json'}
 $a.results.bindings.ley.value





   
    
    

   

  }







function Get-RdfRepositorios {

<#
.SYNOPSIS
Obtiene los metadatos en xml de leyes desde el BOE y los pasa como objetos PW
.DESCRIPTION
para cada ley con id del boe construye la url xml , obtiene los metadatos y el analisis y actualiza la base de datos rdf
.PARAMETRO                                                                                                                                                                                                               $LeyBoe
#>

    $webClient = New-Object System.Net.WebClient
    $webClient.Headers.add('accept','application/json')
    $a = $webClient.DownloadString($RdfRepos)
    $p = convertFrom-Json $a
    
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
            HelpMessage="Código BOE de la ley a actualizar")]
    [string]$LeyBOE        
   
    
    )

BEGIN {  
    $urlBoeXml = "https://www.boe.es/diario_boe/xml.php?id="
    Write-Verbose "Error log será c:\PWLOGS\logsLEYbOE" 
    $Credencial = get-Credential
    $headers = @{'Accept-Charset'='iso-8859-1'}
    }

PROCESS {
   
     foreach ($Ley in $LeyBoe) {
        # Quitar namespace a leyBoe
        $pos = $Ley.IndexOf("#")
        $Ley = $Ley.Substring($pos+1)
        $LeyXml = $urlBoeXml + $Ley
        
        $xmlLey = [xml] (Invoke-WebRequest $LeyXml -credential $Credencial -headers $headers)
        $objLey = @{}

                
        $objLey.Codigo = $Ley
        $objLey.departamento = $xmlLey.documento.metadatos.departamento.innertext
        $objLey.rango = $xmlLey.documento.metadatos.rango.innertext
        $objLey.fechaDisposicion = $xmlLey.documento.metadatos.fecha_disposicion
        $objLey.fechaPublicacion = $xmlLey.documento.metadatos.fecha_publicacion
        $objLey.fechaVigencia = $xmlLey.documento.metadatos.fecha_vigencia
        $objLey.fechaDerogacion =  $xmlLey.documento.metadatos.fecha_Derogacion
        $objLey.estatusLegislativo = $xmlLey.documento.metadatos.estatus_legislativo
        $objLey.origenLegislativo = $xmlLey.documento.metadatos.origen_legislativo.innertext
        $objLey.estadoConsolidacion = $xmlLey.documento.metadatos.estado_consolidacion.innertext
        $objLey.judicialmenteAnulada = $xmlLey.documento.metadatos.fecha_disposicion
        $objLey.vigenciaAgotada = $xmlLey.documento.metadatos.vigenciaAgotada.innertext
                $objLey.estatusDerogacion = $xmlLey.documento.metadatos.estatus_derogacion
        $objLey.materias =  $xmlLey.documento.analisis.materias.materia.innertext
        
        Write-Output $objLey
        
        }
    }

END {}
    
}










function Set-RDFLey {

<#
.SYNOPSIS
escribe propiedades de leyes contenidas en el objeto PW en el RDF endpoint
.DESCRIPTION
#>


[CmdLetBinding()]


param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
    [string]$ObjLey

    )


BEGIN {
    $Contexto = "http://github.com/georgedelajungla/deOI/LEYES.ttl"
    $uri = $urldeOI+"/statements"
    write-verbose "Actualizando contexto leyes en el repositorio deOI"
    $uri

}


PROCESS {
    foreach ($Ley in $ObjLey) {
        $Ley.fechadisposicion        
 
$Update = @"
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX deOI: <http://github.com/georgedelajungla/deOI/deOI#>  
INSERT DATA 
    {GRAPH <deOI:prueba>
{ <deOI:$($_.Codigo)> 
deOI:departamento '$($_.Departamento)' ;
deOI:rangoCodigo '$($_.rango)' ;
deOI:fechaDisposicion '$($_.fechadisposicion)' ;
deOI:FechaPublicacion '$($_.fechaPublicacion)' ;
deOI:fechaVigencia '$($_.fechaVigencia)' ;
deOI:fechaDerogacion '$($_.fechaderogacion)' ;
deOI:estatusLegislativo '$($_.estatuslegislativo)' ;
deOI:origenLegislativo '$($_.origenLegislativo)' ;
deOI:estadoConsolidacion '$($_.estadoConsolidacion)' ;
deOI:judicialmenteAnulada '$($_.judicialmenteAnulada)' ;
deOI:vigenciaAgotada '$($_.vigenciaAgotada)' ;
deOI:estatusDerogacion '$($_.estatusDerogacion)' . } 
}
"@      


        # ACTUALIZAR PROPIEDADES

        $Eupdate = [System.Web.HttpUtility]::UrlEncode($Update)
        
        
        
        $eUpdate="update=$eupdate"
        $eupdate
        
        Invoke-RestMethod $uri -method post -body $EUpdate -Contenttype 'application/x-www-form-urlencoded' -headers @{'Accept'='application/json'}
      

     
     
        # ACTUALIZAR MATERIAS
        #deOI:Materias ($('$_.Materias')) . }
    
      }             
    }

END {}

}

Renueva-Comunitario

