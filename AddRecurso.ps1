Add-Type -AssemblyName System.Windows.Forms

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