Clear-Host

Add-Type -AssemblyName System.Windows.Forms, System.Drawing

$vm_window = New-Object System.Windows.Forms.Form -Property @{
    Text            = 'Orixi: VM Management'
    Font            = New-Object System.Drawing.Font('Segoe UI', 10)
    FormBorderStyle = 'Fixed3D'
    ForeColor       = '#E1E1E1'
    BackColor       = '#234a6b'
    MaximizeBox     = $false
    StartPosition   = 'CenterScreen'
    Width           = 940
    Height          = 655
}

$title_banner = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Attention! connect to VPN or site network. Make sure to modify your own CREDENTIAL and ASSET_TAG the script as per your preference.'
    TextAlign = 'MiddleCenter'
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#ffffff'
    BackColor = '#234a6b'
    Location  = New-Object System.Drawing.Point(0, 10)
    Size      = New-Object System.Drawing.Size(920, 35)
}

$blink_timer = New-Object System.Windows.Forms.Timer -Property @{ Interval = 3000 }
$blink_timer.Add_Tick({
        $title_banner.ForeColor = if ($title_banner.ForeColor.ToArgb() -eq [System.Drawing.Color]::White.ToArgb()) { [System.Drawing.Color]::FromArgb(25, 25, 25) } else { [System.Drawing.Color]::White }
    })
$blink_timer.Start()

$machine_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Machine Name:'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(30, 71)
    Size      = New-Object System.Drawing.Size(110, 20)
}

$machine_text = New-Object System.Windows.Forms.TextBox -Property @{
    Text        = ''
    Location    = New-Object System.Drawing.Point(145, 68)
    Size        = New-Object System.Drawing.Size(275, 28)
    Font        = New-Object System.Drawing.Font('Segoe UI', 10)
    BackColor   = '#072d4b'
    ForeColor   = '#FFFFFF'
    BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
}

$machine_connect_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'CONNECT'
    Location  = New-Object System.Drawing.Point(500, 62)
    Size      = New-Object System.Drawing.Size(390, 34)
    BackColor = '#22d14e'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
}
$machine_connect_button.FlatAppearance.BorderSize = 0

$separator1 = New-Object System.Windows.Forms.Label -Property @{
    Location    = New-Object System.Drawing.Point(30, 120)
    Size        = New-Object System.Drawing.Size(860, 1)
    BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
    BackColor   = '#333333'
}

$vm_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'HARDWARE CONFIGURATION'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#007ACC'
    Location  = New-Object System.Drawing.Point(30, 145)
    Size      = New-Object System.Drawing.Size(390, 25)
}

$vm_MAOX_text = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'MAOX'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(30, 188)
    Size      = New-Object System.Drawing.Size(50, 25)
}

$vm_os_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(85, 185) # Centered with MAOX
    Size          = New-Object System.Drawing.Size(90, 28)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    Font          = New-Object System.Drawing.Font('Segoe UI', 10)
    BackColor     = '#072d4b'
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$vm_os_combobox.Items.AddRange(@('WIN', 'LIN'))
$vm_os_combobox.SelectedIndex = 0

$vm_text = New-Object System.Windows.Forms.TextBox -Property @{
    Text        = 'Put the machine name here.'
    Location    = New-Object System.Drawing.Point(190, 185)
    Size        = New-Object System.Drawing.Size(230, 28)
    Font        = New-Object System.Drawing.Font('Segoe UI', 10)
    BackColor   = '#072d4b'
    ForeColor   = '#FFFFFF'
    BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
}

$separator_mini = New-Object System.Windows.Forms.Label -Property @{
    Location    = New-Object System.Drawing.Point(30, 223)
    Size        = New-Object System.Drawing.Size(390, 1)
    BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
    BackColor   = '#333333'
}

$disk_size_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'DiskSize:'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(30, 240) 
    Size      = New-Object System.Drawing.Size(70, 25)
}

$disk_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(100, 237)
    Size          = New-Object System.Drawing.Size(60, 28)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    Font          = New-Object System.Drawing.Font('Segoe UI', 10)
    BackColor     = '#072d4b'
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$disk_combobox.Items.AddRange(@('None', '10', '20', '30', '40', '50', '60', '70', '80', '90', '100'))
$disk_combobox.SelectedIndex = 0

$disk_gb_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'GB'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#777777' 
    Location  = New-Object System.Drawing.Point(165, 240)
    Size      = New-Object System.Drawing.Size(30, 25)
}

$memory_size_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'RAMSize:'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(212, 240)
    Size      = New-Object System.Drawing.Size(70, 28)
}

$memory_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(285, 237)
    Size          = New-Object System.Drawing.Size(60, 28)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    Font          = New-Object System.Drawing.Font('Segoe UI', 10)
    BackColor     = '#072d4b'
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$memory_combobox.Items.AddRange(@('None', '1', '2', '3', '4', '5', '6', '7', '8'))
$memory_combobox.SelectedIndex = 0

$memory_gb_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'GB'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#777777'
    Location  = New-Object System.Drawing.Point(350, 240)
    Size      = New-Object System.Drawing.Size(40, 25)
}

$net_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Select Virtual Switch:'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(30, 282)
    Size      = New-Object System.Drawing.Size(220, 25)
}

$net_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(30, 310)
    Size          = New-Object System.Drawing.Size(181, 28)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    Font          = New-Object System.Drawing.Font('Segoe UI', 10)
    BackColor     = '#072d4b'
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}

$autostart_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'AutoStart'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(240, 310)
    Size      = New-Object System.Drawing.Size(70, 25)
}

$autostart_checkbox = New-Object System.Windows.Forms.CheckBox -Property @{
    Location  = New-Object System.Drawing.Point(310, 310)
    Size      = New-Object System.Drawing.Size(28, 28)
    BackColor = '#234a6b'
    ForeColor = '#2200ff'
    FlatStyle = 'Flat'
    Enabled   = $false
}

$iso_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Select ISO Image (from C:\ISO\):'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(30, 365)
    Size      = New-Object System.Drawing.Size(220, 25)
}

$iso_refresh_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'REFRESH'
    Location  = New-Object System.Drawing.Point(327, 362)
    Size      = New-Object System.Drawing.Size(93, 30)
    BackColor = '#5757ff'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 8, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$iso_refresh_button.FlatAppearance.BorderSize = 0

$iso_listbox = New-Object System.Windows.Forms.ListBox -Property @{
    Location            = New-Object System.Drawing.Point(30, 402)
    Size                = New-Object System.Drawing.Size(390, 120)
    Font                = New-Object System.Drawing.Font('Consolas', 9)
    BackColor           = '#061f21'
    ForeColor           = '#f7ff14'
    BorderStyle         = [System.Windows.Forms.BorderStyle]::FixedSingle
    Enabled             = $false
    HorizontalScrollbar = $true
    ScrollAlwaysVisible = $true
    IntegralHeight      = $false
    HorizontalExtent    = 1000
}

$create_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'CREATE'
    Location  = New-Object System.Drawing.Point(30, 545)
    Size      = New-Object System.Drawing.Size(190, 45)
    BackColor = '#0097ab'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$create_button.FlatAppearance.BorderSize = 0

$update_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'UPDATE'
    Location  = New-Object System.Drawing.Point(230, 545)
    Size      = New-Object System.Drawing.Size(190, 45)
    BackColor = '#ceab11'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$update_button.FlatAppearance.BorderSize = 0

$separator2 = New-Object System.Windows.Forms.Label -Property @{
    Location    = New-Object System.Drawing.Point(450, 145)
    Size        = New-Object System.Drawing.Size(1, 445)
    BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
    BackColor   = '#333333'
}

$search_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'VIRTUAL INVENTORY'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#007ACC'
    Location  = New-Object System.Drawing.Point(500, 145)
    Size      = New-Object System.Drawing.Size(270, 25)
}

$search_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'REFRESH'
    Location  = New-Object System.Drawing.Point(793, 142)
    Size      = New-Object System.Drawing.Size(94, 30)
    BackColor = '#5757ff'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$search_button.FlatAppearance.BorderSize = 0

$boot_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'BOOT'
    Location  = New-Object System.Drawing.Point(500, 180)
    Size      = New-Object System.Drawing.Size(93, 30)
    BackColor = '#007ACC'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 8, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$boot_button.FlatAppearance.BorderSize = 0

$reboot_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'REBOOT'
    Location  = New-Object System.Drawing.Point(598, 180)
    Size      = New-Object System.Drawing.Size(93, 30)
    BackColor = '#f1ad39'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 8, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$reboot_button.FlatAppearance.BorderSize = 0

$shutdown_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'SHUTDOWN'
    Location  = New-Object System.Drawing.Point(696, 180)
    Size      = New-Object System.Drawing.Size(93, 30)
    BackColor = '#fd8241'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 8, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$shutdown_button.FlatAppearance.BorderSize = 0

$turnoff_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'TURN OFF'
    Location  = New-Object System.Drawing.Point(794, 180)
    Size      = New-Object System.Drawing.Size(93, 30)
    BackColor = '#E65100'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 8, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$turnoff_button.FlatAppearance.BorderSize = 0

$results_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'VM List:'
    TextAlign = 'MiddleLeft'
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
    ForeColor = '#AAAAAA'
    Location  = New-Object System.Drawing.Point(500, 215)
    Size      = New-Object System.Drawing.Size(390, 20)
}

$vm_listbox = New-Object System.Windows.Forms.ListBox -Property @{
    Location            = New-Object System.Drawing.Point(500, 240)
    Size                = New-Object System.Drawing.Size(390, 280)
    Font                = New-Object System.Drawing.Font('Consolas', 10)
    BackColor           = '#061f21'
    ForeColor           = '#00ff11'
    BorderStyle         = [System.Windows.Forms.BorderStyle]::FixedSingle
    HorizontalScrollbar = $true
    ScrollAlwaysVisible = $true
    IntegralHeight      = $false
    HorizontalExtent    = 1000
}

$delete_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'PERMANENTLY DELETE VM'
    Location  = New-Object System.Drawing.Point(500, 545)
    Size      = New-Object System.Drawing.Size(390, 45)
    BackColor = '#D32F2F'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}
$delete_button.FlatAppearance.BorderSize = 0

function Reset-HardwareInputs {
    $disk_combobox.SelectedIndex = 0
    $memory_combobox.SelectedIndex = 0
    if ($net_combobox.Items.Count -gt 0) { $net_combobox.SelectedIndex = 0 }
    $autostart_checkbox.Checked = $false
    $iso_listbox.ClearSelected()
    $vm_listbox.ClearSelected()
    @($boot_button, $shutdown_button, $reboot_button, $turnoff_button, $delete_button) | ForEach-Object { $_.Enabled = $false }
    $create_button.Enabled = $false
    $update_button.Enabled = $false
}

# Selection change logic for VM ListBox (defined once at script level)
$vm_listbox.Add_SelectedIndexChanged({
        $selected = $vm_listbox.SelectedItem
        if ($null -ne $selected -and $null -ne $script:allRemoteVMs) {
            $vmName = ($selected -split ' \| ')[0].Trim()
            $vmData = $script:allRemoteVMs | Where-Object { $_.Name -eq $vmName }
            if ($vmData) {
                $autostart_checkbox.Checked = $vmData.AutoStart
            
                # Update Power button states based on VM State
                $boot_button.Enabled = ($vmData.State -ne 'Running')
                $shutdown_button.Enabled = ($vmData.State -ne 'Off')
                $reboot_button.Enabled = ($vmData.State -ne 'Off')
                $turnoff_button.Enabled = ($vmData.State -ne 'Off')
            }
            $delete_button.Enabled = $true
            & $UpdateUpdateButtonState
        }
        else {
            # Lock all inventory-related buttons if no VM is selected
            @($delete_button, $boot_button, $shutdown_button, $reboot_button, $turnoff_button) | ForEach-Object { $_.Enabled = $false }
            $update_button.Enabled = $false
        }
    })

$UpdateCreateButtonState = {
    $isOsValid = $vm_os_combobox.SelectedIndex -ge 0
    $isNameValid = -not [string]::IsNullOrWhiteSpace($vm_text.Text) -and $vm_text.Text -ne 'Put the machine name here.'
    $isDiskValid = $disk_combobox.SelectedItem -and $disk_combobox.SelectedItem -ne 'None'
    $isRamValid = $memory_combobox.SelectedItem -and $memory_combobox.SelectedItem -ne 'None'
    $isNetValid = $net_combobox.SelectedItem -and $net_combobox.SelectedItem -ne 'None'
    $isIsoValid = $iso_listbox.SelectedIndex -ge 0

    $create_button.Enabled = $isOsValid -and $isNameValid -and $isDiskValid -and $isRamValid -and $isNetValid -and $isIsoValid
}

# Validation logic to enable/disable the Update button
$UpdateUpdateButtonState = {
    $isVmSelected = $vm_listbox.SelectedIndex -ge 0
    $isDiskValid = $disk_combobox.SelectedItem -and $disk_combobox.SelectedItem -ne 'None'
    $isRamValid = $memory_combobox.SelectedItem -and $memory_combobox.SelectedItem -ne 'None'
    $isNetValid = $net_combobox.SelectedItem -and $net_combobox.SelectedItem -ne 'None'
    $isIsoValid = $iso_listbox.SelectedIndex -ge 0
    
    # Check if AutoStart has been changed from the current VM settings
    $isAutoChanged = $false
    if ($isVmSelected -and $null -ne $script:allRemoteVMs) {
        $selectedItem = $vm_listbox.SelectedItem
        $vmName = ($selectedItem -split ' \| ')[0].Trim()
        $vmData = $script:allRemoteVMs | Where-Object { $_.Name -eq $vmName }
        if ($vmData) {
            $isAutoChanged = $autostart_checkbox.Checked -ne $vmData.AutoStart
        }
    }

    $update_button.Enabled = $isVmSelected -and ($isDiskValid -or $isRamValid -or $isNetValid -or $isIsoValid -or $isAutoChanged)
}

$vm_os_combobox.Add_SelectedIndexChanged($UpdateCreateButtonState)
$vm_text.Add_TextChanged($UpdateCreateButtonState)

@($disk_combobox, $memory_combobox, $net_combobox, $iso_listbox) | ForEach-Object {
    $_.Add_SelectedIndexChanged($UpdateCreateButtonState)
    $_.Add_SelectedIndexChanged($UpdateUpdateButtonState)
}

$autostart_checkbox.Add_CheckedChanged($UpdateUpdateButtonState)

$machine_connect_button.Add_Click({
        if ($machine_connect_button.Text -like 'DISCONNECT*') {
            if ($global:HyperVSession) {
                Remove-PSSession $global:HyperVSession -ErrorAction SilentlyContinue
                $global:HyperVSession = $null
            }
            
            # Reset UI elements
            $machine_connect_button.Text = 'CONNECT'
            $machine_connect_button.BackColor = '#3ea558'
            $iso_refresh_button.Enabled = $false
            @($iso_listbox, $vm_listbox) | ForEach-Object { $_.Items.Clear() }
            @($iso_listbox, $net_combobox, $autostart_checkbox, $search_button, $boot_button, $shutdown_button, $reboot_button, $turnoff_button) | ForEach-Object { $_.Enabled = $false }
            $net_combobox.Items.Clear()
            Reset-HardwareInputs
            $machine_text.ReadOnly = $false
            
            $blink_timer.Start()

            return
        }

        if ([string]::IsNullOrWhiteSpace($machine_text.Text)) {
            [void][System.Windows.Forms.MessageBox]::Show('Invalid error, please put machine name.', 'Input Required',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
            Reset-HardwareInputs
        }

        $Comp = $machine_text.Text
        $User = 'Administrator'
        $Pass = 'Bibhu@7008'
        $secPass = ConvertTo-SecureString $Pass -AsPlainText -Force
        $creds = New-Object System.Management.Automation.PSCredential($User, $secPass)

        $machine_connect_button.Enabled = $false
        $machine_connect_button.Text = 'CONNECTING...'
        $machine_text.ReadOnly = $true

        try {
            if ($global:HyperVSession) {
                Remove-PSSession $global:HyperVSession -ErrorAction SilentlyContinue
            }

            $global:HyperVSession = New-PSSession -ComputerName $Comp -Credential $creds -Authentication Credssp -ErrorAction Stop

            $isoFiles = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
                if (Test-Path 'C:\ISO') {
                    Get-ChildItem -Path 'C:\ISO' -Filter *.iso | Select-Object -ExpandProperty Name
                }
            }
            $iso_listbox.Items.Clear()
            if ($isoFiles) { foreach ($iso in $isoFiles) { [void]$iso_listbox.Items.Add($iso) } }

            $vSwitches = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
                Get-VMSwitch | Select-Object -ExpandProperty Name
            }
            $net_combobox.Items.Clear()
            [void]$net_combobox.Items.Add('None')
            if ($vSwitches) { 
                foreach ($sw in $vSwitches) { [void]$net_combobox.Items.Add($sw) } 
            }
            $net_combobox.SelectedIndex = 0

            $iso_refresh_button.Enabled = $true
            $iso_listbox.Enabled = $true
            $net_combobox.Enabled = $true
            $autostart_checkbox.Enabled = $true
            $search_button.Enabled = $true
            $boot_button.Enabled = $true
            $shutdown_button.Enabled = $true
            $reboot_button.Enabled = $true
            $turnoff_button.Enabled = $true
            
            $blink_timer.Stop()
            $title_banner.ForeColor = [System.Drawing.Color]::White
            

            [void][System.Windows.Forms.MessageBox]::Show("Successfully connected to $Comp", 'Connected',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        
            $machine_connect_button.Text = "DISCONNECT: $Comp"
            $machine_connect_button.BackColor = '#D32F2F'
            $machine_connect_button.Enabled = $true
            Reset-HardwareInputs
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Failed background connection: $($_.Exception.Message)", 'Connection Error',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        
            $machine_connect_button.Text = 'CONNECT'
            $machine_connect_button.BackColor = '#3ea558'
            $machine_connect_button.Enabled = $true

            @($iso_refresh_button, $iso_listbox, $net_combobox, $autostart_checkbox, $search_button, $boot_button, $shutdown_button, $reboot_button, $turnoff_button) | ForEach-Object { $_.Enabled = $false }
            $machine_text.ReadOnly = $false
        }
    })

$iso_refresh_button.Add_Click({
        if (-not $global:HyperVSession) {
            [void][System.Windows.Forms.MessageBox]::Show('Please establish a remote session first.', 'Not Connected',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }

        try {
            $isoFiles = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
                if (Test-Path 'C:\ISO') {
                    Get-ChildItem -Path 'C:\ISO' -Filter *.iso | Select-Object -ExpandProperty Name
                }
            }
            $iso_listbox.Items.Clear()
            if ($isoFiles) { foreach ($iso in $isoFiles) { [void]$iso_listbox.Items.Add($iso) } }

            $vSwitches = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
                Get-VMSwitch | Select-Object -ExpandProperty Name
            }
            $net_combobox.Items.Clear()
            [void]$net_combobox.Items.Add('None')
            if ($vSwitches) { 
                foreach ($sw in $vSwitches) { [void]$net_combobox.Items.Add($sw) } 
            }
            $net_combobox.SelectedIndex = 0
            Reset-HardwareInputs
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Failed to refresh ISO list: $($_.Exception.Message)", 'Error',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    })

$create_button.Add_Click({
        if ([string]::IsNullOrWhiteSpace($vm_text.Text) -or 
            $null -eq $iso_listbox.SelectedItem -or 
            $disk_combobox.SelectedItem -eq 'None' -or 
            $memory_combobox.SelectedItem -eq 'None' -or 
            $net_combobox.SelectedItem -eq 'None') {
            
            [void][System.Windows.Forms.MessageBox]::Show('VM Name, Disk Size, RAM, ISO Selection, and Virtual Switch are required. Please ensure none of these are set to "None".', 'Input Required',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }

        $Comp = $machine_text.Text
        $User = 'Administrator'
        $Pass = 'Bibhu@7008'
        $secPass = ConvertTo-SecureString $Pass -AsPlainText -Force
        $creds = New-Object System.Management.Automation.PSCredential($User, $secPass)

        $osType = $vm_os_combobox.SelectedItem
        $vmName = $vm_text.Text
        $selectedIso = $iso_listbox.SelectedItem
        $selectedSwitch = $net_combobox.SelectedItem
        $autoStart = $autostart_checkbox.Checked
        $disk_size = [uint64]($disk_combobox.SelectedItem) * 1GB
        $memory_size = [uint64]($memory_combobox.SelectedItem) * 1GB

        try {
            $session = New-PSSession -ComputerName $Comp -Credential $creds -Authentication Credssp -ErrorAction Stop -WarningAction Ignore
            Invoke-Command -Session $session -ScriptBlock {
                param($vmName, $osType, $disk_size, $memory_size, $isoName, $switchName, $autoStart)

                $vm_full = "MAOX-$osType-$vmName"
                $iso_path = "C:\ISO\$isoName"

                if ($osType -eq 'WIN') {
                    $vm_path = "C:\Virtual Machines\Windows\$vm_full"
                }
                elseif ($osType -eq 'LIN') {
                    $vm_path = "C:\Virtual Machines\Linux\$vm_full"
                }
                else {
                    throw 'OS type must be WIN or LIN'
                }

                if (-not (Test-Path $vm_path)) { New-Item -ItemType Directory -Path $vm_path | Out-Null }
                $vhdPath = "$vm_path\$vm_full.vhdx"

                New-VHD -Path $vhdPath -Fixed -SizeBytes $disk_size -Confirm:$false
                New-VM -Name $vm_full -MemoryStartupBytes $memory_size -VHDPath $vhdPath `
                    -SwitchName $switchName -Path $vm_path -Generation 1 -BootDevice CD
                $startAction = if ($autoStart) { 'Start' } else { 'Nothing' }
                Set-VM -Name $vm_full -AutomaticStartAction $startAction
                Add-VMDvdDrive -VMName $vm_full -Path $iso_path
                Start-VM $vm_full
            } -ArgumentList $vmName, $osType, $disk_size, $memory_size, $selectedIso, $selectedSwitch, $autoStart

            Remove-PSSession $session

            [void][System.Windows.Forms.MessageBox]::Show("Successfully created VM: MAOX-$osType-$vmName", 'Success',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            Reset-HardwareInputs
            $search_button.PerformClick()
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Error creating VM: $($_.Exception.Message)", 'Error',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    })

$update_button.Add_Click({
        $selectedItem = $vm_listbox.SelectedItem
        if ($null -eq $selectedItem) {
            [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list to update.', 'No VM Selected',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }

        $vmName = ($selectedItem -split ' \| ')[0].Trim()
        $vmData = $script:allRemoteVMs | Where-Object { $_.Name -eq $vmName }

        $isDiskPicked = $disk_combobox.SelectedItem -and $disk_combobox.SelectedItem -ne 'None'
        $isRamPicked = $memory_combobox.SelectedItem -and $memory_combobox.SelectedItem -ne 'None'
        $isNetPicked = $net_combobox.SelectedItem -and $net_combobox.SelectedItem -ne 'None'
        $isIsoPicked = $null -ne $iso_listbox.SelectedItem
        $isAutoStartChanged = $null -ne $vmData -and ($autostart_checkbox.Checked -ne $vmData.AutoStart)

        if (-not ($isDiskPicked -or $isRamPicked -or $isNetPicked -or $isIsoPicked -or $isAutoStartChanged)) {
            [void][System.Windows.Forms.MessageBox]::Show('Please select at least one setting (Disk, RAM, Switch, ISO, or AutoStart) to update.', 'Selection Required',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }

        $Comp = $machine_text.Text
        $User = 'Administrator'
        $Pass = 'Bibhu@7008'
        $secPass = ConvertTo-SecureString $Pass -AsPlainText -Force
        $creds = New-Object System.Management.Automation.PSCredential($User, $secPass)

        $new_memory = if ($isRamPicked) { [uint64]($memory_combobox.SelectedItem) * 1GB } else { $null }
        $new_disk = if ($isDiskPicked) { [uint64]($disk_combobox.SelectedItem) * 1GB } else { $null }
        $selectedIso = if ($isIsoPicked) { $iso_listbox.SelectedItem } else { $null }
        $selectedSwitch = if ($isNetPicked) { $net_combobox.SelectedItem } else { $null }
        $autoStart = $autostart_checkbox.Checked

        try {
            $update_button.Enabled = $false
            $update_button.Text = 'Updating...'

            $session = New-PSSession -ComputerName $Comp -Credential $creds -Authentication Credssp -ErrorAction Stop
            Invoke-Command -Session $session -ScriptBlock {
                param($vmName, $memory, $disk, $isoName, $switchName, $autoStart)
                $vm = Get-VM -Name $vmName -ErrorAction Stop

                # Only stop VM if changing Hardware that requires it (RAM or Disk)
                $needsShutdown = ($null -ne $memory -or $null -ne $disk)
                if ($needsShutdown -and $vm.State -ne 'Off') {
                    Stop-VM -Name $vmName -TurnOff -Force -Confirm:$false -ErrorAction Stop
                }

                if ($null -ne $memory) {
                    Set-VMMemory -VMName $vmName -StartupBytes $memory -ErrorAction Stop
                }

                if ($null -ne $disk) {
                    $vhd = Get-VMHardDiskDrive -VMName $vmName | Select-Object -First 1
                    $vhdInfo = Get-VHD -Path $vhd.Path -ErrorAction Stop
                    if ($disk -gt $vhdInfo.Size) { Resize-VHD -Path $vhd.Path -SizeBytes $disk -ErrorAction Stop }
                }

                if ($isoName) {
                    $isoPath = "C:\ISO\$isoName"
                    $dvd = Get-VMDvdDrive -VMName $vmName | Select-Object -First 1
                    if ($dvd) {
                        Set-VMDvdDrive -VMDvdDrive $dvd -Path $isoPath
                    }
                    else {
                        Add-VMDvdDrive -VMName $vmName -Path $isoPath
                    }
                }

                if ($switchName) {
                    $adapter = Get-VMNetworkAdapter -VMName $vmName | Select-Object -First 1
                    if ($adapter) {
                        Connect-VMNetworkAdapter -VMNetworkAdapter $adapter -SwitchName $switchName
                    }
                }

                $startAction = if ($autoStart) { 'Start' } else { 'Nothing' }
                Set-VM -Name $vmName -AutomaticStartAction $startAction

                # Restore power state if we shut it down
                if ($needsShutdown -and $vm.State -eq 'Running') {
                    Start-VM -Name $vmName -ErrorAction Stop
                }
            } -ArgumentList $vmName, $new_memory, $new_disk, $selectedIso, $selectedSwitch, $autoStart

            Remove-PSSession $session
            [void][System.Windows.Forms.MessageBox]::Show("Successfully updated hardware for $vmName", 'Update Complete',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            Reset-HardwareInputs
            $search_button.PerformClick()
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Update failed: $($_.Exception.Message)", 'Error',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        finally {
            $update_button.Enabled = $true
            $update_button.Text = 'Update'
        }
    })

$search_button.Add_Click({
        $vm_listbox.Items.Clear()

        if (-not $global:HyperVSession) {
            [void][System.Windows.Forms.MessageBox]::Show('Please establish a remote session first.', 'Not Connected',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }

        $search_button.Enabled = $false
        $search_button.Text = '↻'
        Reset-HardwareInputs

        $script:allRemoteVMs = @() # Store for UI synchronization

        try {
            $script:allRemoteVMs = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
                Get-VM | ForEach-Object {
                    $vhd = Get-VMHardDiskDrive -VMName $_.Name | Select-Object -First 1
                    $diskSizeGB = if ($vhd) { [math]::Round((Get-VHD -Path $vhd.Path).Size / 1GB) } else { 'N/A' }
                    $ip = ($_.NetworkAdapters.IPAddresses | Where-Object { $_ -match '^\d{1,3}(\.\d{1,3}){3}$' } | Select-Object -First 1) -join ''
                    $uptime = if ($_.State -eq 'Running') { $_.Uptime.ToString("dd'd 'hh'h 'mm'm'") } else { '0s' }
                    [PSCustomObject]@{ 
                        Name      = $_.Name
                        State     = $_.State.ToString()
                        Disk      = $diskSizeGB
                        RAM       = [math]::Round($_.MemoryStartup / 1GB)
                        IP        = if ($ip) { $ip } else { 'Dynamic or No IP' }
                        Uptime    = $uptime
                        AutoStart = ($_.AutomaticStartAction -eq 'Start')
                    }
                }
            }


            foreach ($vm in $allRemoteVMs) {
                [void]$vm_listbox.Items.Add("$($vm.Name) | $($vm.State) | Disk: $($vm.Disk)GB | RAM: $($vm.RAM)GB | IP: $($vm.IP) | Up: $($vm.Uptime)")
            }
        }
        catch {
            [System.Windows.Forms.MessageBox]::Show(($_.Exception.Message), 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        finally {
            $search_button.Enabled = $true
            $search_button.Text = 'Refresh'
        }
    })

$delete_button.Add_Click({
        $selectedItem = $vm_listbox.SelectedItem

        if ($null -eq $selectedItem) {
            [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list first by clicking it.', 'No VM Selected',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }

        $rawVmName = ($selectedItem -split ' \| ')[0].Trim()

        $confirm = [System.Windows.Forms.MessageBox]::Show("Are you sure you want to completely delete '$rawVmName'? This process cannot be undone.", 'Confirm Deletion',
            [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)

        if ($confirm -eq [System.Windows.Forms.DialogResult]::Yes) {
            $Comp = $machine_text.Text
            $User = 'Administrator'
            $Pass = 'Bibhu@7008'
            $secPass = ConvertTo-SecureString $Pass -AsPlainText -Force
            $creds = New-Object System.Management.Automation.PSCredential($User, $secPass)

            try {
                $delete_button.Enabled = $false
                $delete_button.Text = 'Deleting...'

                $session = New-PSSession -ComputerName $Comp -Credential $creds -Authentication Credssp -ErrorAction Stop
                
                Invoke-Command -Session $session -ScriptBlock {
                    param($targetVm)
                    
                    $path = (Get-VM $targetVm | Get-VMHardDiskDrive).Path | Split-Path -Parent
                    Stop-VM -Name $targetVm -TurnOff -Force -ErrorAction SilentlyContinue -WarningAction Ignore
                    Remove-VM -Name $targetVm -Force -Confirm:$false -ErrorAction Stop -WarningAction Ignore
                    Remove-Item -Path $path -Recurse -Force -ErrorAction Stop -WarningAction Ignore

                } -ArgumentList $rawVmName

                Remove-PSSession $session

                [void][System.Windows.Forms.MessageBox]::Show("Successfully deleted VM: $rawVmName", 'Deleted',
                    [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
                
                $vm_listbox.Items.Remove($selectedItem)
                Reset-HardwareInputs
            }
            catch {
                [void][System.Windows.Forms.MessageBox]::Show("Failed to delete VM: $($_.Exception.Message)", 'Deletion Error',
                    [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
            finally {
                $delete_button.Enabled = $true
                $delete_button.Text = 'Delete Selected VM'
            }
        }
    })

$boot_button.Add_Click({
        $selectedItem = $vm_listbox.SelectedItem
        if ($null -eq $selectedItem) {
            [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list.', 'No VM Selected', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }
        $vmName = ($selectedItem -split ' \| ')[0].Trim()
        try {
            Invoke-Command -Session $global:HyperVSession -ScriptBlock { 
                param($name) Start-VM -Name $name -ErrorAction Stop 
            } -ArgumentList $vmName
            [void][System.Windows.Forms.MessageBox]::Show("Power on signal sent to $vmName.", 'Success', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            Reset-HardwareInputs
            $search_button.PerformClick()
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Boot failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    })

$shutdown_button.Add_Click({
        $selectedItem = $vm_listbox.SelectedItem
        if ($null -eq $selectedItem) {
            [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list.', 'No VM Selected', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }
        $vmName = ($selectedItem -split ' \| ')[0].Trim()
        try {
            Invoke-Command -Session $global:HyperVSession -ScriptBlock { 
                param($name) Stop-VM -Name $name -Confirm:$false -ErrorAction Stop 
            } -ArgumentList $vmName
            [void][System.Windows.Forms.MessageBox]::Show("Orderly shutdown signal sent to $vmName.", 'Success', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            Reset-HardwareInputs
            $search_button.PerformClick()
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Shutdown failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    })

$reboot_button.Add_Click({
        $selectedItem = $vm_listbox.SelectedItem
        if ($null -eq $selectedItem) {
            [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list.', 'No VM Selected', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }
        $vmName = ($selectedItem -split ' \| ')[0].Trim()
        try {
            Invoke-Command -Session $global:HyperVSession -ScriptBlock { 
                param($name) Restart-VM -Name $name -Confirm:$false -Force -ErrorAction Stop 
            } -ArgumentList $vmName
            [void][System.Windows.Forms.MessageBox]::Show("Reboot signal sent to $vmName.", 'Success', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            Reset-HardwareInputs
            $search_button.PerformClick()
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Reboot failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    })

$turnoff_button.Add_Click({
        $selectedItem = $vm_listbox.SelectedItem
        if ($null -eq $selectedItem) {
            [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list.', 'No VM Selected', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            return
        }
        $vmName = ($selectedItem -split ' \| ')[0].Trim()
    
        $confirm = [System.Windows.Forms.MessageBox]::Show("Are you sure you want to hard Turn Off '$vmName'? This is equivalent to pulling the power plug.", 'Confirm Turn Off',
            [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    
        if ($confirm -eq [System.Windows.Forms.DialogResult]::Yes) {
            try {
                Invoke-Command -Session $global:HyperVSession -ScriptBlock { 
                    param($name) Stop-VM -Name $name -TurnOff -Confirm:$false -ErrorAction Stop 
                } -ArgumentList $vmName
                [void][System.Windows.Forms.MessageBox]::Show("$vmName has been turned off.", 'Success', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
                Reset-HardwareInputs
                $search_button.PerformClick()
            }
            catch {
                [void][System.Windows.Forms.MessageBox]::Show("Turn off failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        }
    })

$vm_window.Controls.AddRange(@(
        $title_banner,
        $machine_label, $machine_text, 
        $machine_connect_button,
        $separator1,
        $vm_label, $vm_MAOX_text, $vm_os_combobox, $vm_text,
        $separator_mini,
        $disk_size_label, $disk_combobox, $disk_gb_label,
        $memory_size_label, $memory_combobox, $memory_gb_label,
        $net_label, $net_combobox,
        $autostart_label, $autostart_checkbox,
        $iso_label, $iso_refresh_button, $iso_listbox,
        $create_button,
        $update_button,
        $separator2, 
        $search_label, 
        $search_button, 
        $boot_button, $shutdown_button, $reboot_button, $turnoff_button,
        $results_label, $vm_listbox, 
        $delete_button
    ))

$vm_window.Add_FormClosing({ $blink_timer.Stop() })
[void]$vm_window.ShowDialog()
