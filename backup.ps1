Add-Type -AssemblyName System.Windows.Forms

$backupRDF = New-Object system.Windows.Forms.Form
$backupRDF.Text = "Copia respaldo datos deJefa"
$backupRDF.TopMost = $true
$backupRDF.Width = 556
$backupRDF.Height = 456

$label2 = New-Object system.windows.Forms.Label
$label2.Text = "Repositorio:"
$label2.AutoSize = $true
$label2.Width = 25
$label2.Height = 10
$label2.location = new-object system.drawing.point(40,25)
$label2.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label2)

$label3 = New-Object system.windows.Forms.Label
$label3.Text = "Contexto:"
$label3.AutoSize = $true
$label3.Width = 25
$label3.Height = 10
$label3.location = new-object system.drawing.point(40,74)
$label3.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label3)

$listView4 = New-Object system.windows.Forms.ListView
$listView4.Text = "listView"
$listView4.Width = 303
$listView4.Height = 78
$listView4.location = new-object system.drawing.point(37,208)
$backupRDF.controls.Add($listView4)

$comboBox6 = New-Object system.windows.Forms.ComboBox
$comboBox6.Text = "comboBox"
$comboBox6.Width = 291
$comboBox6.Height = 20
$comboBox6.location = new-object system.drawing.point(41,44)
$comboBox6.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($comboBox6)

$comboBox8 = New-Object system.windows.Forms.ComboBox
$comboBox8.Text = "comboBox"
$comboBox8.Width = 150
$comboBox8.Height = 20
$comboBox8.location = new-object system.drawing.point(37,183)
$comboBox8.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($comboBox8)

$label9 = New-Object system.windows.Forms.Label
$label9.Text = "Carpeta"
$label9.AutoSize = $true
$label9.Width = 25
$label9.Height = 10
$label9.location = new-object system.drawing.point(40,159)
$label9.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label9)

$label2 = New-Object system.windows.Forms.Label
$label2.Text = "Repositorio:"
$label2.AutoSize = $true
$label2.Width = 25
$label2.Height = 10
$label2.location = new-object system.drawing.point(40,25)
$label2.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label2)

$label3 = New-Object system.windows.Forms.Label
$label3.Text = "Contexto:"
$label3.AutoSize = $true
$label3.Width = 25
$label3.Height = 10
$label3.location = new-object system.drawing.point(40,74)
$label3.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label3)

$listView4 = New-Object system.windows.Forms.ListView
$listView4.Text = "listView"
$listView4.Width = 303
$listView4.Height = 78
$listView4.location = new-object system.drawing.point(37,208)
$backupRDF.controls.Add($listView4)

$comboBox6 = New-Object system.windows.Forms.ComboBox
$comboBox6.Text = "comboBox"
$comboBox6.Width = 291
$comboBox6.Height = 20
$comboBox6.location = new-object system.drawing.point(41,44)
$comboBox6.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($comboBox6)

$comboBox8 = New-Object system.windows.Forms.ComboBox
$comboBox8.Text = "comboBox"
$comboBox8.Width = 150
$comboBox8.Height = 20
$comboBox8.location = new-object system.drawing.point(37,183)
$comboBox8.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($comboBox8)

$label9 = New-Object system.windows.Forms.Label
$label9.Text = "Carpeta"
$label9.AutoSize = $true
$label9.Width = 25
$label9.Height = 10
$label9.location = new-object system.drawing.point(40,159)
$label9.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label9)

$button10 = New-Object system.windows.Forms.Button
$button10.Text = "Exportar"
$button10.Width = 60
$button10.Height = 30
$button10.location = new-object system.drawing.point(326,366)
$button10.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($button10)

$button11 = New-Object system.windows.Forms.Button
$button11.Text = "Importar"
$button11.Width = 60
$button11.Height = 30
$button11.location = new-object system.drawing.point(254,365)
$button11.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($button11)

$button12 = New-Object system.windows.Forms.Button
$button12.Text = "Salir"
$button12.Width = 60
$button12.Height = 30
$button12.location = new-object system.drawing.point(424,366)
$button12.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($button12)

$textBox15 = New-Object system.windows.Forms.TextBox
$textBox15.Width = 78
$textBox15.Height = 20
$textBox15.location = new-object system.drawing.point(399,44)
$textBox15.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($textBox15)

$listBox18 = New-Object system.windows.Forms.ListBox
$listBox18.Text = "listBox"
$listBox18.Width = 293
$listBox18.Height = 34
$listBox18.location = new-object system.drawing.point(41,96)
$backupRDF.controls.Add($listBox18)

$label19 = New-Object system.windows.Forms.Label
$label19.Text = "Triples:"
$label19.AutoSize = $true
$label19.Width = 25
$label19.Height = 10
$label19.location = new-object system.drawing.point(400,24)
$label19.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label19)

$comboBox20 = New-Object system.windows.Forms.ComboBox
$comboBox20.Text = "comboBox"
$comboBox20.Width = 150
$comboBox20.Height = 20
$comboBox20.location = new-object system.drawing.point(36,332)
$comboBox20.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($comboBox20)

$label21 = New-Object system.windows.Forms.Label
$label21.Text = "Formato:"
$label21.AutoSize = $true
$label21.Width = 25
$label21.Height = 10
$label21.location = new-object system.drawing.point(35,310)
$label21.Font = "Microsoft Sans Serif,10"
$backupRDF.controls.Add($label21)

[void]$backupRDF.ShowDialog()
$backupRDF.Dispose()