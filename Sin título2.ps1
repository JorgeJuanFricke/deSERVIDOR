
Add-Type -AssemblyName System.Windows.Forms
$treeView1 = New-Object System.Windows.Forms.TreeView 
$treeview1
$System_Drawing_Size = New-Object System.Drawing.Size 
$System_Drawing_Size.Width = 224 
$System_Drawing_Size.Height = 563 
$treeView1.Size = $System_Drawing_Size 
$treeView1.Name = "treeView1" 
$System_Drawing_Point = New-Object System.Drawing.Point 
$System_Drawing_Point.X = 13 
$System_Drawing_Point.Y = 37 
$treeView1.Location = $System_Drawing_Point 
$treeView1.DataBindings.DefaultDataSourceUpdateMode = 0 
$treeView1.TabIndex = 0 
$form1.Controls.Add($treeView1)