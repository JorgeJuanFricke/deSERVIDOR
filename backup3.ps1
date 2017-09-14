
$urlRepos = "http://10.50.208.48:8080/rdf4j-server/repositories"



                                                                                                                                                                                                                                                                                                                                                    
function Backup_deOI {
    # pedir solo directorio para copia en turtle por contextos (default)
    # crear subdirectorio deOI+FECHA
    # obtener y mostrar todos los contextos a grabar
    # mostrar la fecha de la última copia
    # pedir confirmar copia (mediante avanzado)
    # hacer la copia, en formato contexto+fecha.ttl
    parameter()


}


function Restaura_deOI {
    # Pedir directorio (mostrar defecto)
    # mostrar ficheros contextos
    # Restaurar con aviso
}



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


function Get-contextos() {


[CmdLetBinding()]

    param (
    [Parameter(Mandatory=$True)]
    [string]$Repo        
    )
        
    $urlContextos = $urlRepos+"/$Repo"+"/contexts"
    
     try {
         $grafos = Invoke-RestMethod  $urlContextos  -headers @{'Accept'='application/sparql-results+xml, */*;q=0.5'}
     }

     catch {
        $MensajeError = $_.Exception.message

       write-host "ERROR Obteniendo contextos [$MensajeError]"
       return
     }

    if ($grafos.sparql.results) {
        return $grafos.sparql.results.result.binding.uri
    }
    else {
        write-host "No existen contextos para el repositorio $Repo"
    }
}

backup
