<# SET SANCIONES

 GRABAR desde LIBREOFFICE como csv y marcar editar configuración, luego seleccionar unicode y recortar al inicio.
 luego, hacer pipeline del fichero a setRdfInventario

#>

Add-Type -Assembly System.Web

 $Columnas = @["Norma", "Articulo", "Apartado", "OPC", "PTOS", "Calificacion", "HechoInfringido", "importe" ,"Responsable", "Comentario", "Materia"] ;

$ColToLeyBOE = @{
    Col= "CIR/nLSV", Ley = "<codigoboe>"
    Col= "CON/nLSV", Ley = "<CODIGOBOE>"
}


function Set-RDFSanciones {
<#
.SYNOPSIS
Escribe las clases y tipos de sanciones en un fichero para posteriormente subirlo al RDF endpoint. 

.DESCRIPTION
#>


    param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
    [string]$Items

    
    )
    
    BEGIN {

    write-verbose "Actualizando Sanciones"
    $servidor = "http://10.50.208.48:8080/rdf4j-server"
    $url = "${servidor}/repositories/deOATMEM/statements"
    ## PEDIR CREDENCIALES
    $cred = Get-Credential
    ## ESCRIBIR CABECERA
    $Cabecera = "PREFIX deOAT: <http://dgt.es/oltf/deOAT/deOAT#>"  
    $Cabecera += "<${servidor}]/sanciones.owl>"
    $Cabecera += "a dataset"
    $Cabecera += ""


    }



    PROCESS {
    
    foreach ($item in $Items) {
        $item
        Write-Verbose "escribiendo recurso $($item.dni)"
        ## buscar ley codigos boe
        ## Crear uri sancion
        # codigoleyboe+articulo+parrafo
        $Sancion = "
            <sujeto> DATE NOW()
            a deOI:Sancion ;
            deOI:hasLey '$($_.substring'
            deOI:hasArticulo
            deOI:hasParrafo
            rdfs:label 'substring($(_.hasHechoInfringido,60)'
            rdfs:comment '$($_.hasHechoInfringido)'
            deOI:hasOPC '
            deOI:hasPTOS
            deOI:hasCalificacion
            deOI:hasImporte
            deOI:hasResponsable
            deOI:hasMateria
            skos:note comentario .

        "
        
        
       
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

 ## $Names = @( $A | gm -type NoteProperty | select -ExpandProperty Name )
Import-Csv ~/desktop/Permisos.csv | Set-RDFPersmisos -Verbose 
