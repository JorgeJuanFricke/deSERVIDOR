## MODULO MANTENIMIENTO DATOS RDF 


Add-Type -AssemblyName System.Windows.Forms
<#
 FORM OAT

 modulo para navegar por los datos enlazados


#>
function inicializa-form {}
function get-RDF {}
function post-RDF {}
function get-Inventario {}




function genera-form {
$Form = New-Object system.Windows.Forms.Form
$Form.Text = "datos enlazados del Operador de apoyo técnico"
$Form.TopMost = $true
$Form.Width = 1082
$Form.Height = 722

$tree = New-Object system.windows.Forms.treeView
$tree.Text = "listView"
$tree.Width = 215
$tree.Height = 526
$tree.location = new-object system.drawing.point(21,30)
$Form.controls.Add($tree)

$tbEtiqueta = New-Object system.windows.Forms.TextBox
$tbEtiqueta.Width = 488
$tbEtiqueta.Height = 20
$tbEtiqueta.location = new-object system.drawing.point(264,35)
$tbEtiqueta.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($tbEtiqueta)

$grid = New-Object system.windows.Forms.datagrid
$grid.Text = "listView"
$grid.Width = 488
$grid.Height = 486
$grid.location = new-object system.drawing.point(263,72)
$grid.headerforecolor = [system.drawing.color]::FromArgb(255,0,0)
$grid.name = "grid"
$grid.datamember = ""
$grid.Tabindex = 0
$grid.
$Form.controls.Add($grid)

[void]$Form.ShowDialog()
$Form.Dispose()
}

genera-form