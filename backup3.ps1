
$Servidor = "http://10.50.208.48:8080/rdf4j-server/repositories"



                                                                                                                                                                                                                                                                                                                                                    
function Backup {
<#
.SYNOPSIS
Hace la copia de seguridad del repositorio rdf4j
.DESCRIPTION
Hace la copia de seguridad del repositorio rdf4j
.PARAMETER Repositorio
Repositorio a copiar
.PARAMETER Carpeta
Carpeta para la copia
.EXAMPLE
.EXAMPLE
#>
[CmdLetBinding()]

    param (
    [string]$Repositorio= "deOI",        
    
    [string]$Carpeta="C:/DEOI")

    <# pedir repositorio
    $Repo = Read-Host "Introduzca nombre del repositorio (enter=default)"
    # pedir solo directorio para copia en turtle por contextos (default)
    $carpeta = Read-Host "Introduzca nombre directorio a efectuar la copia (enter=default)"
    #>

    # obtener fecha actual
    $hoy = get-date -format d-M-yyyy
    write-verbose "Realizando copia repositorio $Repositorio en $Carpeta"
    # salva repositorio completo
    "$Servidor/$Repositorio/statements", $Carpeta | salva-RDF     

    # salva repositorio por contextos
    get-rdfContextos($Repositorio,$Carpeta) | Salva-rdf

}




function Restaura_deOI {
    # Pedir directorio (mostrar defecto)
    # mostrar ficheros contextos
    # Restaurar con aviso
}







# GET-Repos ---------------------------------------------------------


function Get-Repos() {

<#
.SYNOPSIS
Obtiene la lista de repositorios del servidor
.DESCRIPTION
No demasiado útil pues solo existe dos repositorios: deOI, deOAT
.PARAMETER urlServidor

.EXAMPLE
.EXAMPLE
#>
[CmdLetBinding()]

    param (
    [Parameter(Mandatory=$True)]
    [string]$urlServidor        
    )
        
    
    
     try {
         $Repos = Invoke-RestMethod "$urlServidor/repositories" 
     }

     catch {
        $MensajeError = $_.Exception.message
        write-host "ERROR Obteniendo lista de repositorios del servidor $Repo [$MensajeError]"
        return
     }

    if ($Repos) {
        write-out $Repos
       
    }
    else {
        write-host "No existen repositorios para el servidor $urlServidor"
    }
} 
 





# GET-CONTEXTOS -------------------------------------------------------------------------------

function Get-contextos() {
<#
.SYNOPSIS
Obtiene la lista de contextos del repositorio.
.DESCRIPTION
.PARAMETER repo
repositorio donde buscar los contextos/grafos
.EXAMPLE
.EXAMPLE
#>

[CmdLetBinding()]

    param (
    [Parameter(Mandatory=$True)]
    [string]$Repo)

    try {
         $grafos = Invoke-RestMethod  $url  -headers @{'Accept'='application/sparql-results+xml, */*;q=0.5'}
        }
    
    catch {
        $MensajeError = $_.Exception.message
        write-host "ERROR Obteniendo contextos [$MensajeError]"
        return
         }

    finally {
        if (-NOT $($grafos.sparql.results)) { 
            write-host "No existen contextos para el repositorio $Repo" 
            
        }

        foreach ($grafo in $grafos) {
            $url = "$urlServidor/$Repo/contexts?context=$($grafo.sparql.results.result.binding.uri)"
            WRITE-OUT $url
        }
    }
        
}






# SALVA TRIPLES ------------------------------------------------------------


function Salva-rdf() {
<#
.SYNOPSIS
Realiza la copia de seguridad de la base de datos RDF. 
.DESCRIPTION
Realiza la copia de seguridad de la base de datos RDF. Mediante REST API RDF4J Obtiene la salida RDF y la graba en un fichero 
Envia request url mediante rest api rdf4j. Control de errores mediante Try/catch. 
.PARAMETER url
url rest API para enviar al servidor RDF4J
.PARAMETER path
path en donde guardar el fichero
.EXAMPLE
.EXAMPLE
#>
[CmdLetBinding()]

    param (
    [Parameter(Mandatory=$True, ValuefromPipeline=$True)]
    [string]$url,

    [Parameter(Mandatory=$True, ValuefromPipeline=$True)]
    [string]$path        
    )
        
    begin {}
    process {

         try {
            $triples = Invoke-RestMethod $url -headers @{'Accept'='application/rdf+xml'}
         }

         catch {
           $MensajeError = $_.Exception.message
            write-host "ERROR obteniendo triples del repositorio/contexto $url [$MensajeError]"
            return
        }

        if ($triples) {
            if ($path.indexof("?context=") -ge 0) {
                $NombreFichero = $path.substring($path.indexof("?context="))
                write-verbose "grabando contexto $NombreFichero en $path"
            } 

            else {
                $path = $path.trimend("/statements")
                $Nombrefichero = $path.substring($path.indexof("repositories/")) 
                write-verbose "grabando repositorio $NombreFichero en $path"
            }
            try {
                $triples | out-file -filepath $Nombrefichero }
            catch {
                $MensajeError = $_.Exception.message
                write-host "ERROR grabando triples de $url en $Nombrefichero [$MensajeError]"
            }
         # grabar triples
      }
         else {
            write-host "No existen triples para el repositorio/contexto $url "
     }
}
}






<#
function Backup-GUI {

Add-Type -AssemblyName System.Windows.Forms
$backupRDF = New-Object system.Windows.Forms.Form
$backupRDF.Text = "Copia respaldo datos deJefa"
$backupRDF.TopMost = $true
$backupRDF.Width = 556
$backupRDF.Height = 456
$backupRDF.Add_Load({
    
    # Get-contextos($cbRepo.SelectedItem.ToString())

})



    $cbRepo = New-Object system.windows.Forms.ComboBox
    $cbRepo.Width = 294
    $cbRepo.Height = 20
  


    $cbRepo.location = new-object system.drawing.point(35,48) 
    $cbRepo.Font = "Microsoft Sans Serif,10"
    $backupRDF.controls.Add($cbRepo)

    [void] $cbRepo.Items.Add("deOI")
    [void] $cbRepo.Items.add("deOAT")
    $cbRepo.Selectedindex = 0
    $cbRepo.Add_SelectedValueChanged({
        $grafos = Get-contextos($cbRepo.SelectedItem.ToString())
        
      if ($grafos) {
       foreach ($grafo in $grafos) {
            $lbContextos.Items.Add($grafo)
       } 
      }  else {$lbContextos = "no hay contextos"}
    })
    

    
$lbContextos = New-Object system.windows.Forms.ListBox
$lbContextos.Text = "listBox"
$lbContextos.Width = 303
$lbContextos.Height = 79
$lbContextos.location = new-object system.drawing.point(35,218)
$backupRDF.controls.Add($lbContextos)

$bRestaurar = New-Object system.windows.Forms.Button
$bRestaurar.Text = "Restaurar"
$bRestaurar.Width = 75
$bRestaurar.Height = 29
$bRestaurar.location = new-object system.drawing.point(356,372)
$bRestaurar.Font = "Microsoft Sans Serif,10,style=Italic"
$backupRDF.controls.Add($bRestaurar)

$label6 = New-Object system.windows.Forms.Label
$label6.Text = "Contextos:"
$label6.AutoSize = $true
$label6.Width = 25
$label6.Height = 10
$label6.location = new-object system.drawing.point(35,195)
$label6.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label6)

$label9 = New-Object system.windows.Forms.Label
$label9.Text = "Directorio:"
$label9.AutoSize = $true
$label9.Width = 25
$label9.Height = 10
$label9.location = new-object system.drawing.point(36,141)
$label9.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label9)

$tbDirectorio = New-Object system.windows.Forms.TextBox
$tbDirectorio.Width = 299
$tbDirectorio.Height = 20
$tbDirectorio.location = new-object system.drawing.point(36,157)
$tbDirectorio.Font = "Microsoft Sans Serif,10"
$tbDirectorio.Text = "c:/deJefa/copiaSeguridad"
$backupRDF.controls.Add($tbDirectorio)

$lbContextos = New-Object system.windows.Forms.ListBox
$lbContextos.Text = "listBox"
$lbContextos.Width = 303
$lbContextos.Height = 79
$lbContextos.location = new-object system.drawing.point(35,218)
$backupRDF.controls.Add($lbContextos)

$bRestaurar = New-Object system.windows.Forms.Button
$bRestaurar.Text = "Restaurar"
$bRestaurar.Width = 75
$bRestaurar.Height = 29
$bRestaurar.location = new-object system.drawing.point(356,372)
$bRestaurar.Font = "Microsoft Sans Serif,10,style=Italic"
$backupRDF.controls.Add($bRestaurar)

$bSalvaRepo = New-Object system.windows.Forms.Button
$bSalvaRepo.Text = "Salvar repositorio"
$bSalvaRepo.Width = 180
$bSalvaRepo.Height = 30

$bSalvaRepo.Add_Click({
#add here code triggered by the event
})
$bSalvaRepo.location = new-object system.drawing.point(164,371)
$bSalvaRepo.Font = "Microsoft Sans Serif,10,style=Bold"
$backupRDF.controls.Add($bSalvaRepo)

$bSalir = New-Object system.windows.Forms.Button
$bSalir.Text = "Salir"
$bSalir.Width = 60
$bSalir.Height = 30
$bSalir.Add_Click({
    $backupRDF.close()
})
$bSalir.location = new-object system.drawing.point(457,372)
$bSalir.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($bSalir)

$tbTriples = New-Object system.windows.Forms.TextBox
$tbTriples.Width = 78
$tbTriples.Height = 20
$tbTriples.location = new-object system.drawing.point(399,44)
$tbTriples.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($tbTriples)

$label19 = New-Object system.windows.Forms.Label
$label19.Text = "Triples:"
$label19.AutoSize = $true
$label19.Width = 25
$label19.Height = 10
$label19.location = new-object system.drawing.point(400,24)
$label19.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label19)

$cbFormato = New-Object system.windows.Forms.ComboBox
$cbFormato.Text = "Formato"
$cbFormato.Width = 150
$cbFormato.Height = 20

    [void] $cbFormato.items.add("TriG")
    [void] $cbFormato.items.add("BinaryRDF")
    [void] $cbFormato.items.add("TriX")
    [void] $cbFormato.items.add("N-Triples")
    [void] $cbFormato.items.add("N-Quads")
    [void] $cbFormato.items.add("N3")
    [void] $cbFormato.items.add("RDF/XML")
    [void] $cbFormato.items.add("RDF/JSON")
    [void] $cbFormato.items.add("Turtle")
     $cbFormato.selectedindex = 4    

$cbFormato.Add_SelectedValueChanged({
#add here code triggered by the event
})
$cbFormato.location = new-object system.drawing.point(36,100)
$cbFormato.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($cbFormato)

$label21 = New-Object system.windows.Forms.Label
$label21.Text = "Formato:"
$label21.AutoSize = $true
$label21.Width = 25
$label21.Height = 10
$label21.location = new-object system.drawing.point(37,82)
$label21.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label21)


[void]$backupRDF.ShowDialog()
$backupRDF.Dispose()
}

#>

backup
