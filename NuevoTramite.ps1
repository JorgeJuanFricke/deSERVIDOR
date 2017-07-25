Add-Type -AssemblyName System.Windows.Forms

$urldeOI = "http://10.50.208.48:8080/rdf4j-server/repositories/deOI"
$urlRepos = "http://10.50.208.48:8080/rdf4j-server/repositories"

$myHash = @{sujeto="";propiedad="";objeto=""} 
$triple = new-object psObject -property $myhash
$triples = @($triple)



$nuevoTramite = New-Object system.Windows.Forms.Form
$nuevoTramite.Text = "Nuevo Tramite"
$nuevoTramite.TopMost = $true
$nuevoTramite.Width = 652
$nuevoTramite.Height = 444

# CARGAR COMBOS Y LISTOBOX


 
    
$nuevoTramite.Add_Load({
$query = @"
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX deOI: <http://github.com/georgedelajungla/deOI/deOI#>
SELECT ?Tasa WHERE ?Tasa rdf:type deOI:Tasa
"@
    $data = query-rdfData($query)
    $Tasas = $data.results.bindings.Tasa.value
    foreach ($Tasa in $Tasas) {
        $lbtasas.Items.Add($Tasa)
    } 
$query = @"
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX deOI: <http://github.com/georgedelajungla/deOI/deOI#>
SELECT ?Solicitud WHERE ?Solicitud rdf:type deOI:Solicitud
"@


    $data = query-rdfData($query)
    $Solicitudes = $data.results.bindings.Solicitud.value
    foreach ($Solicitud in $Solicitudes) {
        $lbSolicitud.Items.Add($Solicitud)
    } 

})

$cbClase = New-Object system.windows.Forms.ComboBox
$cbClase.Text = "Solicitud"
$cbClase.Width = 20
$cbClase.Height = 20
$cbClase.location = new-object system.drawing.point(35,267)
$cbClase.Font = "Microsoft Sans Serif,10"
$cbClase.items.Add("deOI:ObtencionPConduccion")
$cbClase.items.Add("deOI:RenovacionPConduccion")
$cbClase.items.Add("deOI:BajaPConduccion")
$cbClase.items.Add("deOI:CertificacionesConductores")
$cbClase.items.Add("deOI:ObtencionPCirculacion")
$cbClase.items.Add("deOI:RenovacionPCirculacion")
$cbClase.items.Add("deOI:BajaPCirculacion")
$cbClase.items.Add("deOI:CertificacionesVehiculos")
$nuevoTramite.controls.Add($cbClase)


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

$tbHInformativa = New-Object system.windows.Forms.textbox
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
    get-formTramite | update-Triples})

$bAceptar.location = new-object system.drawing.point(540,364)
$bAceptar.Font = "Microsoft Sans Serif,10"
$nuevoTramite.controls.Add($bAceptar)

[void]$nuevoTramite.ShowDialog()
$nuevoTramite.Dispose()





 


function get-formTramite {
    $Triples.clear()
    $Triple.sujeto = $Tramite

    # clase Tramite
    $Triple.predicado = 'rdf:type'
    $Triple.objeto = $cbClase.SelectedItems.ToString()
    $triples.add($triple)   

    # Etiqueta y Comentario
    $Triple.predicado = 'rdfs:label'
    $Triple.objeto = $tbEtiqueta.text
    $triples.add()
    $Triple.predicado = 'rdfs:comment'
    $Triple.objeto = $tbComentario.text
    $triples.add()

    # Tasas
    $Tasas = $lbTasas.SelectedItems.ToString()  
    foreach($Tasa in $Tasas) {
         $Triple.sujeto = $Tramite
         $Triple.predicado = 'deOI:hasTasa'
         $Triple.objeto = $Tasa
         $triples.add($Triple)
    }

    # Solicitud
    $Triple.sujeto = $Tramite
    $Triple.predicado = 'deOI:hasSolicitud'
    $Triple.objeto = $tbSolicitud.Text
    $triples.add($Triple)

    # Hoja requisitos
    $Triple.sujeto = $Tramite
    $Triple.predicado = 'deOI:hasHojaInformativa'
    $Triple.objeto = $tbHInformativa.Text
    $triples.add($Triple)


}

function query-rdfdata {
<#
.SYNOPSIS
    envia query al servidor
.DESCRIPTION
#>


[CmdLetBinding()]


param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
    [string]$query

    )
   
    $Equery = [System.Web.HttpUtility]::UrlEncode($query)
    $body = "query=$Equery"
    $header = @{Accept='SPARQL/JSON'}

 
    $a = Invoke-RestMethod  $urldeOI -method post -body $body -Contenttype application/x-www-form-urlencoded -headers @{'Accept'='application/json'}


    write-out  $a.results.bindings.url.value
}









function update-Triples {
    <#
.SYNOPSIS
    envia update al servidor
.DESCRIPTION
#>


[CmdLetBinding()]


param (
    [Parameter(Mandatory=$True,
            ValueFromPipeline=$True)]
            $Triples

    )
   

    
     $prefijos = @"
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX deOI: <http://github.com/georgedelajungla/deOI/deOI#>

"@      
   $update = $prefijos
   $update += 'UPDATE {'
   foreach ($triple in $triples) {
        $update += $triple.sujeto + $triple.predicado + $triple.objeto
   }
   $update += '} GRAPH' + $Grafo

    $Eupdate = [System.Web.HttpUtility]::UrlEncode($update)
       
    $Eupdate = [System.Web.HttpUtility]::UrlEncode($Update)
        
        
        
    $eUpdate="update=$eupdate"
    $eupdate
        
    Invoke-RestMethod $uri -method post -body $EUpdate -Contenttype 'application/x-www-form-urlencoded' -headers @{'Accept'='application/json'}
      


}    