<# INVENTARIO.TTL
 GRABAR desde LIBREOFFICE como csv y marcar editar configuración, luego seleccionar unicode 
 luego, hacer pipeline del fichero a setRdfInventario

#>

Add-Type -Assembly System.Web




function Set-RDFInventario {
<#
.SYNOPSIS
Escribe el inventario de la jpt/olt en el repositorio deOAT del RDF endpoint. 
Los errores por pantalla.
.DESCRIPTION
#>


    param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
    [string]$Items

    
    )
    
    BEGIN {

    write-verbose "Actualizando Inventario"
    $servidor = "http://10.50.208.48:8080/rdf4j-server"
    $url = "${servidor}/repositories/deOATMEM/statements"
    ## PEDIR CREDENCIALES
    $cred = Get-Credential
    $Update = "PREFIX deOAT: <http://github.com/georgedelajungla/deOAT/deOAT#>"  
    $Update += "INSERT DATA { GRAPH <deOAT:Inventario.ttl> {"


    }



    PROCESS {
    
    foreach ($item in $Items) {
        $item
        Write-Verbose "escribiendo recurso $($item.Equipo)"
        
        $Update += "
           <deOAT:'$($_.Equipo)'>
            deOAT:Estado '$($_.Estado)' ;
            deOAT:Serie '$($_.Serie)' ;
            deOAT:Categoria '$($_.Categoria)' ;
            deOAT:Marca '$($_.Marca)' ;
            deOAT:Modelo '$($_.Modelo)' ;
            deOAT:Departamento '$($_.Departamento)' ;
            deOAT:Usuario '$($_.Usuario )' . "
        
        
       
    } ## foreach                 
    } ## process
 
 
END {   
        $Update += "}}" 
        $Update     
        $Eupdate = [System.Web.HttpUtility]::UrlEncode($Update)
        
        $body = "update=$EUpdate"
        

 
    $a = Invoke-RestMethod  $url -method post -body $body -Credential $cred  -timeoutsec 40 
   
    }
}

Import-Csv ~/desktop/351oltf.csv | Set-RDFInventario -Verbose 
