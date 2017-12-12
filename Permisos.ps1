<# SET PERMISOS

 GRABAR desde LIBREOFFICE como csv y marcar editar configuración, luego seleccionar unicode y recortar al inicio.
 luego, hacer pipeline del fichero a setRdfInventario

#>

Add-Type -Assembly System.Web




function Set-RDFPermisos {
<#
.SYNOPSIS
Escribe el los permisos de los funcionarios de la jpt/olt en el repositorio deOAT del RDF endpoint. 
Los errores por pantalla.
.DESCRIPTION
#>


    param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
    [string]$Items

    
    )
    
    BEGIN {

    write-verbose "Actualizando Permisos"
    $servidor = "http://10.50.208.48:8080/rdf4j-server"
    $url = "${servidor}/repositories/deOATMEM/statements"
    ## PEDIR CREDENCIALES
    $cred = Get-Credential
    $Update = "PREFIX deOAT: <http://dgt.es/oltf/deOAT/deOAT#>"  
    $Update += "INSERT DATA { GRAPH <http://dgt.es/oltf/deOAT/permisos.ttl> {"


    }



    PROCESS {
    
    foreach ($item in $Items) {
        $item
        Write-Verbose "escribiendo recurso $($item.dni)"
        
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

 $Names = @( $A | gm -type NoteProperty | select -ExpandProperty Name )
Import-Csv ~/desktop/Permisos.csv | Set-RDFPersmisos -Verbose 
