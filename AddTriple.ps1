0A
Add-Type -AssemblyName System.Windows.Forms



function get-RDF {}
function post-RDF {}



























function genera-FormRDF {

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Form"
$Form.TopMost = $true
$Form.Width = 700
$Form.Height = 603

$label5 = New-Object system.windows.Forms.Label
$label5.Text = "Repositorio:"
$label5.AutoSize = $true
$label5.Width = 25
$label5.Height = 10
$label5.location = new-object system.drawing.point(35,40)
$label5.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label5)

$cbRepositorio = New-Object system.windows.Forms.ComboBox
$cbRepositorio.Text = "comboBox"
$cbRepositorio.Width = 229
$cbRepositorio.Height = 20
$cbRepositorio.location = new-object system.drawing.point(183,43)
$cbRepositorio.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($cbRepositorio)

$label7 = New-Object system.windows.Forms.Label
$label7.Text = "Recurso:"
$label7.AutoSize = $true
$label7.Width = 25
$label7.Height = 10
$label7.location = new-object system.drawing.point(36,89)
$label7.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label7)

$cbRecurso = New-Object system.windows.Forms.ComboBox
$cbRecurso.Text = "comboBox"
$cbRecurso.Width = 230
$cbRecurso.Height = 20
$cbRecurso.location = new-object system.drawing.point(182,86)
$cbRecurso.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($cbRecurso)

$grid = New-Object system.windows.Forms.ListView
$grid.Text = "listView"
$grid.Width = 601
$grid.Height = 246
$grid.location = new-object system.drawing.point(31,148)
$Form.controls.Add($grid)

$bAddRecurso = New-Object system.windows.Forms.Button
$bAddRecurso.Text = "Añadir recurso"
$bAddRecurso.Width = 142
$bAddRecurso.Height = 27
$bAddRecurso.location = new-object system.drawing.point(31,421)
$bAddRecurso.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($bAddRecurso)

$bAddTriple = New-Object system.windows.Forms.Button
$bAddTriple.Text = "Añadir Propiedad"
$bAddTriple.Width = 175
$bAddTriple.Height = 31
$bAddTriple.location = new-object system.drawing.point(197,419)
$bAddTriple.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($bAddTriple)

$bSalir = New-Object system.windows.Forms.Button
$bSalir.Text = "Salir"
$bSalir.Width = 60
$bSalir.Height = 30
$bSalir.location = new-object system.drawing.point(493,419)
$bSalir.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($bSalir)

[void]$Form.ShowDialog()
$Form.Dispose()
}

function genera-FormRecurso {

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Form"
$Form.TopMost = $true
$Form.Width = 548
$Form.Height = 447

$textBox2 = New-Object system.windows.Forms.TextBox
$textBox2.Width = 378
$textBox2.Height = 20
$textBox2.location = new-object system.drawing.point(42,121)
$textBox2.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox2)

$textBox3 = New-Object system.windows.Forms.TextBox
$textBox3.Multiline = $true
$textBox3.Width = 377
$textBox3.Height = 116
$textBox3.location = new-object system.drawing.point(44,188)
$textBox3.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox3)

$textBox4 = New-Object system.windows.Forms.TextBox
$textBox4.Width = 222
$textBox4.Height = 20
$textBox4.location = new-object system.drawing.point(182,55)
$textBox4.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox4)

$label5 = New-Object system.windows.Forms.Label
$label5.Text = "Recurso ..................:"
$label5.AutoSize = $true
$label5.Width = 25
$label5.Height = 10
$label5.location = new-object system.drawing.point(43,54)
$label5.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label5)

$label6 = New-Object system.windows.Forms.Label
$label6.Text = "Etiqueta:"
$label6.AutoSize = $true
$label6.Width = 25
$label6.Height = 10
$label6.location = new-object system.drawing.point(44,98)
$label6.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label6)

$label7 = New-Object system.windows.Forms.Label
$label7.Text = "Descripción:"
$label7.AutoSize = $true
$label7.Width = 25
$label7.Height = 10
$label7.location = new-object system.drawing.point(45,163)
$label7.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label7)

$bAceptar = New-Object system.windows.Forms.Button
$bAceptar.Text = "Aceptar"
$bAceptar.Width = 132
$bAceptar.Height = 34
$bAceptar.location = new-object system.drawing.point(66,355)
$bAceptar.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($bAceptar)

$bCancelar = New-Object system.windows.Forms.Button
$bCancelar.Text = "Cancelar"
$bCancelar.Width = 149
$bCancelar.Height = 32
$bCancelar.location = new-object system.drawing.point(219,354)
$bCancelar.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($bCancelar)

[void]$Form.ShowDialog()
$Form.Dispose()
}


function Genera-FormTriple {

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Form"
$Form.TopMost = $true
$Form.Width = 500
$Form.Height = 524

$label2 = New-Object system.windows.Forms.Label
$label2.Text = "Sujeto:"
$label2.AutoSize = $true
$label2.Width = 25
$label2.Height = 10
$label2.location = new-object system.drawing.point(52,66)
$label2.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label2)

$textBox3 = New-Object system.windows.Forms.TextBox
$textBox3.Width = 206
$textBox3.Height = 20
$textBox3.location = new-object system.drawing.point(51,88)
$textBox3.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox3)

$label4 = New-Object system.windows.Forms.Label
$label4.Text = "Propiedad:"
$label4.AutoSize = $true
$label4.Width = 25
$label4.Height = 10
$label4.location = new-object system.drawing.point(49,154)
$label4.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label4)

$comboBox5 = New-Object system.windows.Forms.ComboBox
$comboBox5.Text = "comboBox"
$comboBox5.Width = 210
$comboBox5.Height = 20
$comboBox5.location = new-object system.drawing.point(49,179)
$comboBox5.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($comboBox5)

$label6 = New-Object system.windows.Forms.Label
$label6.Text = "Objeto:"
$label6.AutoSize = $true
$label6.Width = 25
$label6.Height = 10
$label6.location = new-object system.drawing.point(52,260)
$label6.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label6)

$textBox7 = New-Object system.windows.Forms.TextBox
$textBox7.Width = 209
$textBox7.Height = 20
$textBox7.location = new-object system.drawing.point(50,285)
$textBox7.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($textBox7)

$bGrabar = New-Object system.windows.Forms.Button
$bGrabar.Text = "Grabar"
$bGrabar.Width = 113
$bGrabar.Height = 27
$bGrabar.location = new-object system.drawing.point(54,377)
$bGrabar.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($bGrabar)

$bCancelar = New-Object system.windows.Forms.Button
$bCancelar.Text = "Cancelar"
$bCancelar.Width = 149
$bCancelar.Height = 31
$bCancelar.location = new-object system.drawing.point(184,375)
$bCancelar.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($bCancelar)

$button10 = New-Object system.windows.Forms.Button
$button10.Width = 60
$button10.Height = 30
$button10.location = new-object system.drawing.point(50,19)
$button10.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($button10)

[void]$Form.ShowDialog()
$Form.Dispose()
}
genera-FormRecurso
genera-FormRDF
Genera-FormTriple
