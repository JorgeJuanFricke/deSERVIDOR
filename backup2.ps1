
Add-Type -AssemblyName System.Windows.Forms
$urlRepos = "http://10.50.208.48:8080/rdf4j-server/repositories"



function fbackup-Repo {
    #Set-PSDebug  

<#
.SYNOPSIS
    Descarga los grafos en varios formatos para salvaguardarlos
.COMMENT
    hacerlo en modo texto primero y luego con ventana
    --- bajarse todo el repositorio ---
    GET /rdf4j-server/repositories/mem-rdf/statements HTTP/1.1
    
    Accept: application/rdf+xml
    ---- bajarse un contexto ----
    GET /rdf4j-server/repositories/mem-rdf/statements?context=_:n1234x5678 HTTP/1.1


    ----- SUBIR CONTEXTO Y REPOSITORIO -----
    
    Accept: application/rdf+xml
    --- obtener el numero de triples ---
    GET /rdf4j-server/repositories/mem-rdf/size HTTP/1.1

    get tamaño contexto
    GET /rdf4j-server/repositories/mem-rdf/size?context=%3Curn:x-local:graph1%3E HTTP/1.1
    
    get contextos todos
    GET /rdf4j-server/repositories/mem-rdf/contexts HTTP/1.1
#>   

    
# FORM ----------------------------------------------------------

    $backupRDF = New-Object system.Windows.Forms.Form
    $backupRDF.Text = "Copia respaldo datos deJefa"
    $backupRDF.TopMost = $true
    $backupRDF.Width = 556
    $backupRDF.Height = 456

    $backupRDF.Add_Load({
        #add here code triggered by the event
    })




# COMBO REPOSITORIOS

    
    
# COMBO FORMATOS

$cbFormato = New-Object system.windows.Forms.ComboBox
$cbFormato.Width = 150
$cbFormato.Height = 20

$cbFormato.location = new-object system.drawing.point(38,252)
$cbFormato.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($cbFormato)


    $cbFormato.items.add("TriG")
    $cbFormato.items.add("BinaryRDF")
    $cbFormato.items.add("TriX")
    $cbFormato.items.add("N-Triples")
    $cbFormato.items.add("N-Quads")
    $cbFormato.items.add("N3")
    $cbFormato.items.add("RDF/XML")
    $cbFormato.items.add("RDF/JSON")
    $cbFormato.items.add("Turtle")
    $cbFormato.selectedindex = 4    
    
    $cbFormato.Add_SelectedValueChanged({
        #Construir URL 
    })


# COMBO CONTEXTOS

    $cbContexto = New-Object system.windows.Forms.ComboBox
    $cbContexto.Text = "cbContexto"
    $cbContexto.Width = 293
    $cbContexto.Height = 20
    $cbContexto.location = new-object system.drawing.point(36,108)
    $cbContexto.Font = "Microsoft Sans Serif,10"
    $backupRDF.controls.Add($cbContexto)
    $cbContexto.Add_SelectedValueChanged({
        #add here code triggered by the event
    })

# ETIQUETAS


$label4 = New-Object system.windows.Forms.Label
$label4.Text = "Repositorio:"
$label4.AutoSize = $true
$label4.Width = 25
$label4.Height = 10
$label4.location = new-object system.drawing.point(33,25)
$label4.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label4)

$label6 = New-Object system.windows.Forms.Label
$label6.Text = "Contexto"
$label6.AutoSize = $true
$label6.Width = 25
$label6.Height = 10
$label6.location = new-object system.drawing.point(36,91)
$label6.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label6)


$label9 = New-Object system.windows.Forms.Label
$label9.Text = "Fichero:"
$label9.AutoSize = $true
$label9.Width = 25
$label9.Height = 10
$label9.location = new-object system.drawing.point(37,155)
$label9.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label9)

$label19 = New-Object system.windows.Forms.Label
$label19.Text = "Triples:"
$label19.AutoSize = $true
$label19.Width = 25
$label19.Height = 10
$label19.location = new-object system.drawing.point(400,24)
$label19.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label19)



$label21 = New-Object system.windows.Forms.Label
$label21.Text = "Formato:"
$label21.AutoSize = $true
$label21.Width = 25
$label21.Height = 10
$label21.location = new-object system.drawing.point(38,230)
$label21.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label21)




$cbFichero = New-Object system.windows.Forms.Texbox
$cbFichero.Text = "tbFichero"
$cbFichero.Width = 300
$cbFichero.Height = 20
$cbFichero.location = new-object system.drawing.point(36,176)
$cbFichero.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($cbFichero)










# BOTONES -----------------------------------------------------------

$bRestauraContexto = New-Object system.windows.Forms.Button
$bRestauraContexto.Text = "Restaurar contexto"
$bRestauraContexto.Width = 80
$bRestauraContexto.Height = 30
$bRestauraContexto.Add_Click({
#add here code triggered by the event
})
$bRestauraContexto.location = new-object system.drawing.point(36,373)
$bRestauraContexto.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($bRestauraContexto)

$bRestauraRepo = New-Object system.windows.Forms.Button
$bRestauraRepo.Text = "Restaurar repositorio"
$bRestauraRepo.Width = 80
$bRestauraRepo.Height = 30
$bRestauraRepo.Add_Click({
#add here code triggered by the event
})
$bRestauraRepo.location = new-object system.drawing.point(121,372)
$bRestauraRepo.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($bRestauraRepo)


$bSalvaRepo = New-Object system.windows.Forms.Button
$bSalvaRepo.Text = "Salvar repositorio"
$bSalvaRepo.Width = 120
$bSalvaRepo.Height = 30
$bSalvaRepo.Add_Click({
#add here code triggered by the event
})
$bSalvaRepo.location = new-object system.drawing.point(317,371)
$bSalvaRepo.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($bSalvaRepo)

$bSalvaContexto = New-Object system.windows.Forms.Button
$bSalvaContexto.Text = "Salvar contexto"
$bSalvaContexto.Width = 80
$bSalvaContexto.Height = 30
$bSalvaContexto.Add_Click({
#add here code triggered by the event
})
$bSalvaContexto.location = new-object system.drawing.point(207,374)
$bSalvaContexto.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($bSalvaContexto)

$bSalir = New-Object system.windows.Forms.Button
$bSalir.Text = "Salir"
$bSalir.Width = 60
$bSalir.Height = 30
$bSalir.Add_Click({
#add here code triggered by the event
})

$bSalir.location = new-object system.drawing.point(445,371)
$bSalir.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($bSalir)







$tbTriples = New-Object system.windows.Forms.TextBox
$tbTriples.Width = 78
$tbTriples.Height = 20
$tbTriples.location = new-object system.drawing.point(399,44)
$tbTriples.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($tbTriples)





[void]$backupRDF.ShowDialog()
$backupRDF.Dispose()

}






fbackup-Repo

# EVENTOS COMBOS ----------------------------------------------------





function Get-contextos() {
    parameters $Repo
 $Repo = 
      
    # contextos

    $urlContextos = $urlRepos+"/$Repo"+"/contexts"
    $urlContextos
    $Contextos = Invoke-RestMethod  $urlContextos  -headers @{'Accept'='application/sparql-results+xml, */*;q=0.5'}
    $Contextos
    foreach ($Contexto in $Contextos) {
        $cbContexto.Items.Add($Contexto)
    } 
}