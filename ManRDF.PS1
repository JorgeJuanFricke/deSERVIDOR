Add-Type -AssemblyName System.Windows.Forms



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