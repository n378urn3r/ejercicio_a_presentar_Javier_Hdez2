[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$xaml = @'
<Window x:Name="Formulario" 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="MainWindow" Height="350" Width="525">
    <Grid x:Name="Ventana">
        <Label x:Name="Label1" Content="Nombre" HorizontalAlignment="Left" Margin="106,58,0,0" VerticalAlignment="Top"/>
        <Label x:Name="Label2" Content="Apellido" HorizontalAlignment="Left" Margin="106,116,0,0" VerticalAlignment="Top"/>
		<Label x:Name="Label3" Content="Acepta las condiciones de IT" HorizontalAlignment="Left" Margin="106,156,0,0" VerticalAlignment="Top"/>
        <TextBox x:Name="Text1" HorizontalAlignment="Left" Height="23" Margin="201,58,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="120" />
        <TextBox x:Name="Text2" HorizontalAlignment="Left" Height="23" Margin="201,116,0,0" TextWrapping="Wrap" Text="" VerticalAlignment="Top" Width="120"/>
		<CheckBox x:Name="Check1" HorizontalAlignment="Left" Margin="286,156,0,0" VerticalAlignment="Top"/>
        <Button x:Name="Boton2" Content="Aceptar" HorizontalAlignment="Left" Margin="95,180,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="Boton1" Content="Cancelar" HorizontalAlignment="Left" Margin="158,180,0,0" VerticalAlignment="Top" Width="75"/>
		<Button x:Name="Boton3" Content="Ver Cond. IT" HorizontalAlignment="Left" Margin="235,180,0,0" VerticalAlignment="Top" Width="75"/>
        
    </Grid>
</Window> 
'@

$reader=(New-Object System.Xml.XmlNodeReader $xaml) 
$Form=[Windows.Markup.XamlReader]::Load( $reader )

$txtText1 = $Form.FindName('Text1')

$btnBoton1 = $Form.FindName('Boton2')
$btnBoton1.Add_Click({$txtText1.Text = "Aceptar"})

function Check_Dir_and_Create ([string] $pathdir) {
	write-host ("$pathdir")
	if ( Test-Path $pathdir -PathType Container ) 
	     { "Existe $pathdir" }
	else 
	{New-Item -path  $pathdir -type Directory }

}

function Del_dir_and_create ([string] $pathdir2) {
	Check_Dir_and_Create ("$pathdir2")
	write-host ("Deletting space on $pathdir2")
	Set-Location $pathdir2
	Remove-Item -Path $pathdir2
}

Del_dir_and_create ('c:\temp')
Check_Dir_and_Create('C:\archivos\Proyectos\Visual_Studio')


Check_Dir_and_Create('C:\archivos\Proyectos\Otras_Plataformas')
Check_Dir_and_Create('C:\archivos\Desarrollos\Visual_Studio')
Check_Dir_and_Create('C:\archivos\Administración\Otras_Plataformas')
Check_Dir_and_Create('C:\archivos\Personales')


Write-Host ("(Pulse una tecla para continuar")
[string] $continuar = Read-Host
$Form.ShowDialog()


