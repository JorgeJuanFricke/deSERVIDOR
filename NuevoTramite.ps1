Add-Type -AssemblyName System.Windows.Forms




$myHash = @{sujeto="";propiedad="";objeto=""} 
$triple = new-object psObject -property $myhash
$triples = @($triple)


<#
$triple.sujeto = read-host -prompt "Sujeto"
$triple.propiedad = "dgt:etiqueta"
$triple.objeto = read-host -prompt "etiqueta"
$triples.add($triple)
#>


$nuevoTramite = New-Object system.Windows.Forms.Form
$nuevoTramite.Text = "Nuevo Tramite"
$nuevoTramite.TopMost = $true
$nuevoTramite.Width = 652
$nuevoTramite.Height = 444
$nuevoTramite.Add_Load({
    $Tasas = get-triples('SELECT ?Tasa WHERE ?Tasa rdf:type deOI:Tasa')
    foreach ($Tasa in $Tasas) {
        $lbtasas.Items.Add($Tasa)
    } 
    $Solicitudes = getTriples('SELECT ?Solicitud WHERE ?Solicitud rdf:type deOI:Solicitud')
    foreach ($Solicitud in $Solicitudes) {
        $lbSolicitud.Items.Add($Solicitud)
    } 

})
$groupBox = New-Object System.Windows.Forms.GroupBox #create the group box
$groupBox.Location = New-Object System.Drawing.Size(20,20) #location of the group box (px) in relation to the primary window's edges (length, height)
$groupBox.size = New-Object System.Drawing.Size(200,50) #the size in px of the group box (length, height)
$groupBox.text = "Nr of pings:" #labeling the box
$NuevoTramite.Controls.Add($groupBox) #activate the group box

$rbConductores = New-Object system.windows.Forms.RadioButton
$rbConductores.Text = "Conductores"
$rbConductores.AutoSize = $true
$rbConductores.Width = 104
$rbConductores.Height = 20
$rbConductores.location = new-object system.drawing.point(36,28)
$rbConductores.Font = "Microsoft Sans Serif,10"
$groupBox.controls.Add($rbConductores)

$rbCertificados = New-Object system.windows.Forms.RadioButton
$rbCertificados.Text = "Certificacion"
$rbCertificados.AutoSize = $true
$rbCertificados.Width = 104
$rbCertificados.Height = 20
$rbCertificados.location = new-object system.drawing.point(242,28)
$rbCertificados.Font = "Microsoft Sans Serif,10"
$groupBox.controls.Add($rbCertificados)


$rbVehiculos = New-Object system.windows.Forms.RadioButton
$rbVehiculos.Text = "Vehículos"
$rbVehiculos.AutoSize = $true
$rbVehiculos.Width = 104
$rbVehiculos.Height = 20
$rbVehiculos.location = new-object system.drawing.point(142,28)
$rbVehiculos.Font = "Microsoft Sans Serif,10"
$groupBox.controls.Add($rbVehiculos)

$rbObtencion = New-Object system.windows.Forms.RadioButton
$rbObtencion.Text = "Obtención"
$rbObtencion.AutoSize = $true
$rbObtencion.Width = 104
$rbObtencion.Height = 20
$rbObtencion.location = new-object system.drawing.point(37,58)
$rbObtencion.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($rbObtencion)

$rbRenovacion = New-Object system.windows.Forms.RadioButton
$rbRenovacion.Text = "Renovación"
$rbRenovacion.AutoSize = $true
$rbRenovacion.Width = 104
$rbRenovacion.Height = 20
$rbRenovacion.location = new-object system.drawing.point(143,58)
$rbRenovacion.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($rbRenovacion)

$rbBaja = New-Object system.windows.Forms.RadioButton
$rbBaja.Text = "Baja"
$rbBaja.AutoSize = $true
$rbBaja.Width = 104
$rbBaja.Height = 20
$rbBaja.location = new-object system.drawing.point(242,59)
$rbBaja.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($rbBaja)

$tbEtiqueta = New-Object system.windows.Forms.TextBox
$tbEtiqueta.Width = 315
$tbEtiqueta.Height = 20
$tbEtiqueta.location = new-object system.drawing.point(36,85)
$tbEtiqueta.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($tbEtiqueta)

$tbComentario = New-Object system.windows.Forms.TextBox
$tbComentario.Multiline = $true
$tbComentario.Width = 317
$tbComentario.Height = 41
$tbComentario.location = new-object system.drawing.point(35,132)
$tbComentario.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($tbComentario)

$lbtasas = New-Object system.windows.Forms.ListBox
$lbtasas.Text = "tasas"
$lbtasas.Width = 318
$lbtasas.Height = 26
$lbtasas.location = new-object system.drawing.point(36,202)
$nuevoTramite.controls.Add($lbtasas)

$label11 = New-Object system.windows.Forms.Label
$label11.Text = "Tasas"
$label11.AutoSize = $true
$label11.Width = 25
$label11.Height = 10
$label11.location = new-object system.drawing.point(35,183)
$label11.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($label11)

$label12 = New-Object system.windows.Forms.Label
$label12.Text = "Comentario"
$label12.AutoSize = $true
$label12.Width = 25
$label12.Height = 10
$label12.location = new-object system.drawing.point(37,113)
$label12.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($label12)

$label13 = New-Object system.windows.Forms.Label
$label13.Text = "Solicitud"
$label13.AutoSize = $true
$label13.Width = 25
$label13.Height = 10
$label13.location = new-object system.drawing.point(37,244)
$label13.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($label13)

$cbSolicitud = New-Object system.windows.Forms.ComboBox
$cbSolicitud.Text = "Solicitud"
$cbSolicitud.Width = 319
$cbSolicitud.Height = 20
$cbSolicitud.location = new-object system.drawing.point(35,267)
$cbSolicitud.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($cbSolicitud)

$label15 = New-Object system.windows.Forms.Label
$label15.Text = "Hoja Informativa"
$label15.AutoSize = $true
$label15.Width = 25
$label15.Height = 10
$label15.location = new-object system.drawing.point(37,306)
$label15.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($label15)

$tbHInformativa = New-Object system.windows.Forms.texbox
$tbHInformativa.Text = "Hoja Informativa"
$tbHInformativa.Width = 322
$tbHInformativa.Height = 20
$tbHInformativa.location = new-object system.drawing.point(36,326)
$tbHInformativa.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($tbHInformativa)

$bCancelar = New-Object system.windows.Forms.Button
$bCancelar.Text = "Cancelar"
$bCancelar.Width = 60
$bCancelar.Height = 30
$bCancelar.Add_Click({
#add here code triggered by the event
})
$bCancelar.location = new-object system.drawing.point(466,365)
$bCancelar.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($bCancelar)

$bAceptar = New-Object system.windows.Forms.Button
$bAceptar.Text = "Aceptar"
$bAceptar.Width = 60
$bAceptar.Height = 30
$bAceptar.Add_Click({
    get-formTramite | set-Triples

$bAceptar.location = new-object system.drawing.point(540,364)
$bAceptar.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($bAceptar)

[void]$nuevoTramite.ShowDialog()
$nuevoTramite.Dispose()





 


function get-formTramite {
    $s = $Tramite

    # clase Tramite
    $p = rdf:type
    if ($rbConductores.checked)
        if ($rbObtencion.checked) {$o = deOI:ObtencionPConduccion}
        if ($rbRenovacion.checked) {$o = deOI:RenovacionPConduccion}
        if ($rbBaja.checked) {$o = deOI:BajaPConduccion}
        if ($rbCertificaciones) {$o = deOI:CertificacionesConductores}

    if ($rbVehiculos.checked) {
        if ($rbObtencion.checked) {$o = deOI:ObtencionPCirculacion}
        if ($rbRenovacion.checked) {$o = deOI:RenovacionPCirculacion}
        if ($rbBaja.checked) {$o = deOI:BajaPCirculacion}
        if ($rbCertificaciones) {$o = deOI:CertificacionesVehiculos}

  
    $triples.add($triple)   

    # Etiqueta y Comentario
    $p = 'rdfs:label'
    $o = $tbEtiqueta.text
    $triples.add()
    $p = 'rdfs:comment'
    $o = $tbComentario.text
    $triples.add()

    # Tasas
    $Tasas = $lbTasas.SelectedItem.ToString() 
    $foreach $Tasa in $Tasas {
         $Triple.s = $Tramite
         $Triple.p = 'deOI:hasTasa'
         $Triple.o = $Tasa
         $triples.add(Triple)
    }



    # Solicitud



}


function get-Triples {
    param(string $query)



}




function set-Triples
    param([]$Triples
           $Grafo)

   $query = 'UPDATE {'
   foreach $triple in $triples {
        $query+= $triple.s + $triple.p + $triple.o
   }
   $query+= '} GRAPH' + $Grafo
   GRAPH $Contexto
   
   #lanza query 
   $url = "https://${servidor}:8080/openrdf-sesame/repositories/DGT/statements"
   Invoke-RestMethod -Method Post -Uri $url -Credential $cred -Body $body 

}    