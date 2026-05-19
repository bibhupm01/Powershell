#

###############################################################################
#                                                                             # 
# Developed by Bibhu, meet me at https://www.linkedin.com/in/it-drives-bibhu/ #
#                                                                             #
###############################################################################

Clear-Host

Add-Type -AssemblyName System.Windows.Forms, System.Drawing

# Professional Color Palette
$theme_bg = '#252526'        
$theme_surface = '#2D2D30'   
$theme_accent = '#0078D4'   
$theme_text = '#F5F5F5'     
$theme_text_dim = '#9BA1A6'
$theme_input_bg = '#2D2D2D'
$theme_input_fg = '#FFFFFF'
$theme_border = '#333333'
$theme_success = '#28A745'
$theme_danger = '#DC3545'
$theme_warning = '#FF8C00'

$vm_window = New-Object System.Windows.Forms.Form -Property @{
    Text            = 'ORIXI: VM Management'
    Font            = New-Object System.Drawing.Font('Segoe UI', 9)
    FormBorderStyle = 'FixedSingle'
    ForeColor       = $theme_text
    BackColor       = $theme_bg
    MaximizeBox     = $false
    StartPosition   = 'CenterScreen'
    Width           = 940
    Height          = 900
}

$header_panel = New-Object System.Windows.Forms.Panel -Property @{
    BackColor = $theme_accent
    Dock      = 'Top'
    Height    = 60
}
$header_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = '[ MANDATORY ] CONNECT TO VPN OR SITE NETWORK | CREATE FOLDERS (C:\Virtual Machines) AND (C:\ISO)'
    Font            = New-Object System.Drawing.Font('Segoe UI Semibold', 12)
    ForeColor = '#FFFFFF'
    TextAlign = 'MiddleLeft'
    Dock      = 'Fill'
    Padding   = New-Object System.Windows.Forms.Padding(20, 0, 0, 0)
}
$header_panel.Controls.Add($header_label)

$conn_group = New-Object System.Windows.Forms.GroupBox -Property @{
    Text      = 'Remote Session Configuration'
    Location  = New-Object System.Drawing.Point(20, 65)
    Size      = New-Object System.Drawing.Size(885, 100)
    ForeColor = $theme_accent
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
    FlatStyle = 'Flat'
}

$machine_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Target Host'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(15, 30)
    Size      = New-Object System.Drawing.Size(100, 20)
    Font      = New-Object System.Drawing.Font('Segoe UI', 9)
}

$machine_text = New-Object System.Windows.Forms.TextBox -Property @{
    Location    = New-Object System.Drawing.Point(15, 55)
    Size        = New-Object System.Drawing.Size(250, 25)
    BackColor   = $theme_input_bg
    ForeColor   = $theme_input_fg
    BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
}

$user_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Username'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(275, 30)
    Size      = New-Object System.Drawing.Size(160, 20)
    Font      = New-Object System.Drawing.Font('Segoe UI', 9)
}

$user_text = New-Object System.Windows.Forms.TextBox -Property @{
    Location    = New-Object System.Drawing.Point(280, 52)
    Size        = New-Object System.Drawing.Size(160, 25)
    BackColor   = $theme_input_bg
    ForeColor   = $theme_input_fg
    BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
}

$pass_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Credentials'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(455, 30)
    Size      = New-Object System.Drawing.Size(150, 20)
    Font      = New-Object System.Drawing.Font('Segoe UI', 9)
}

$pass_text = New-Object System.Windows.Forms.TextBox -Property @{
    Location              = New-Object System.Drawing.Point(455, 55)
    Size                  = New-Object System.Drawing.Size(150, 25)
    BackColor             = $theme_input_bg
    ForeColor             = $theme_input_fg
    BorderStyle           = [System.Windows.Forms.BorderStyle]::FixedSingle
    UseSystemPasswordChar = $true
}

$machine_connect_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'Connect to Host'
    Location  = New-Object System.Drawing.Point(670, 48)
    Size      = New-Object System.Drawing.Size(200, 35)
    BackColor = $theme_success
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI Semibold', 9)
}
$machine_connect_button.FlatAppearance.BorderSize = 0

$conn_group.Controls.AddRange(@($machine_label, $machine_text, $user_label, $user_text, $pass_label, $pass_text, $machine_connect_button))

# Provisioning Group
$config_group = New-Object System.Windows.Forms.GroupBox -Property @{
    Text      = 'Provision New Asset'
    Location  = New-Object System.Drawing.Point(20, 180)
    Size      = New-Object System.Drawing.Size(885, 255)
    ForeColor = $theme_accent
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
    FlatStyle = 'Flat'
}

$vm_label_header = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'System Identity'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(15, 30)
    Size      = New-Object System.Drawing.Size(150, 20)
}
$config_group.Controls.Add($vm_label_header)

$vm_MAOX_text = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'MAOX'
    TextAlign = 'MiddleCenter'
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(15, 55)
    Size      = New-Object System.Drawing.Size(50, 25)
}

$vm_os_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(70, 55)
    Size          = New-Object System.Drawing.Size(75, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$vm_os_combobox.Items.AddRange(@('WIN', 'LIN'))
$vm_os_combobox.SelectedIndex = 0

$prov_vm_text = New-Object System.Windows.Forms.TextBox -Property @{
    Text        = 'Put_A_NewHostname'
    Location    = New-Object System.Drawing.Point(150, 55)
    Size        = New-Object System.Drawing.Size(270, 25)
    BackColor   = $theme_input_bg
    ForeColor   = '#FFFFFF'
    BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
}

$disk_size_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'diskOS(GB)'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(15, 105)
    Size      = New-Object System.Drawing.Size(90, 20)
}

$prov_disk_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(15, 125)
    Size          = New-Object System.Drawing.Size(85, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$prov_disk_combobox.Items.AddRange(@('None', '10', '20', '30', '40', '50', '60', '70', '80', '90', '100'))
$prov_disk_combobox.SelectedIndex = 0

$memory_size_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Memory(GB)'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(115, 105)
    Size      = New-Object System.Drawing.Size(90, 20)
}

$prov_memory_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(115, 125)
    Size          = New-Object System.Drawing.Size(85, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$prov_memory_combobox.Items.AddRange(@('None', '1', '2', '3', '4', '5', '6', '7', '8'))
$prov_memory_combobox.SelectedIndex = 0

$net_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Virtual Switch'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(450, 30)
    Size      = New-Object System.Drawing.Size(150, 20)
}

$prov_net_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(450, 55)
    Size          = New-Object System.Drawing.Size(420, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}

$autostart_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Auto-Start VM'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(215, 125)
    Size      = New-Object System.Drawing.Size(100, 20)
}

$prov_autostart_checkbox = New-Object System.Windows.Forms.CheckBox -Property @{
    Location  = New-Object System.Drawing.Point(320, 125)
    Size      = New-Object System.Drawing.Size(20, 20)
    FlatStyle = 'Flat'
    Enabled   = $false
    ForeColor = '#FFFFFF'
}

$iso_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Media Source'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(450, 105)
    Size      = New-Object System.Drawing.Size(200, 20)
}

$prov_iso_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(450, 125)
    Size          = New-Object System.Drawing.Size(420, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}
[void]$prov_iso_combobox.Items.Add('None')

$vhd_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Existing VHD/X'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(15, 185)
    Size      = New-Object System.Drawing.Size(150, 20)
}

$prov_vhd_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(15, 205)
    Size          = New-Object System.Drawing.Size(405, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}
[void]$prov_vhd_combobox.Items.Add('None')

$create_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'PROVISION VM'
    Location  = New-Object System.Drawing.Point(720, 190)
    Size      = New-Object System.Drawing.Size(150, 45)
    BackColor = $theme_accent
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI Semibold', 10)
    Enabled   = $false
}

$prov_reset_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'REFRESH'
    Location  = New-Object System.Drawing.Point(545, 190)
    Size      = New-Object System.Drawing.Size(160, 45)
    BackColor = '#4B4B4B'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI Semibold', 9)
    Enabled   = $false
}

$config_group.Controls.AddRange(@(
        $vm_MAOX_text, $vm_os_combobox, $prov_vm_text,
        $disk_size_label, $prov_disk_combobox,
        $memory_size_label, $prov_memory_combobox,
        $net_label, $prov_net_combobox,
        $autostart_label, $prov_autostart_checkbox,
        $iso_label, $prov_iso_combobox,
        $vhd_label, $prov_vhd_combobox,
        $prov_reset_button,
        $create_button
    ))

$inv_group = New-Object System.Windows.Forms.GroupBox -Property @{
    Text      = 'Management & Inventory'
    Location  = New-Object System.Drawing.Point(20, 450)
    Size      = New-Object System.Drawing.Size(885, 400)
    ForeColor = '#00FF88'
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
    FlatStyle = 'Flat'
}

$boot_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'START'
    Location  = New-Object System.Drawing.Point(15, 25)
    Size      = New-Object System.Drawing.Size(90, 35)
    BackColor = $theme_success
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}

$reboot_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'REBOOT'
    Location  = New-Object System.Drawing.Point(115, 25)
    Size      = New-Object System.Drawing.Size(90, 35)
    BackColor = $theme_warning
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}

$shutdown_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'SHUT'
    Location  = New-Object System.Drawing.Point(215, 25)
    Size      = New-Object System.Drawing.Size(90, 35)
    BackColor = $theme_danger
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}

$turnoff_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'KILL'
    Location  = New-Object System.Drawing.Point(315, 25)
    Size      = New-Object System.Drawing.Size(90, 35)
    BackColor = '#BF4F00'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
    Enabled   = $false
}

$vm_listview = New-Object System.Windows.Forms.ListView -Property @{
    Location      = New-Object System.Drawing.Point(15, 70)
    Size          = New-Object System.Drawing.Size(480, 265)
    Font          = New-Object System.Drawing.Font('Segoe UI', 8)
    BackColor     = '#0A0A0A'
    ForeColor     = '#00FF41'
    BorderStyle   = [System.Windows.Forms.BorderStyle]::FixedSingle
    View          = 'Details'
    FullRowSelect = $true
    MultiSelect   = $false
    HeaderStyle   = 'Nonclickable'
}

[void]$vm_listview.Columns.Add('VM Name', 110)
[void]$vm_listview.Columns.Add('Status', 65)
[void]$vm_listview.Columns.Add('Disk', 70)
[void]$vm_listview.Columns.Add('RAM', 45)
[void]$vm_listview.Columns.Add('IP Address', 80)
[void]$vm_listview.Columns.Add('Uptime', 40)

$update_section_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Selected VM Configuration'
    ForeColor = $theme_accent
    Location  = New-Object System.Drawing.Point(515, 25)
    Size      = New-Object System.Drawing.Size(200, 20)
    Font      = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Bold)
}

$upd_disk_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'ResizeOS(GB)'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(515, 50)
    Size      = New-Object System.Drawing.Size(90, 20)
}

$upd_disk_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(515, 75)
    Size          = New-Object System.Drawing.Size(85, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$upd_disk_combobox.Items.AddRange(@('None', '10', '20', '30', '40', '50', '60', '70', '80', '90', '100'))
$upd_disk_combobox.SelectedIndex = 0

$upd_memory_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Memory(GB)'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(605, 50)
    Size      = New-Object System.Drawing.Size(90, 20)
}

$upd_memory_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(605, 75)
    Size          = New-Object System.Drawing.Size(85, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
}
$upd_memory_combobox.Items.AddRange(@('None', '1', '2', '3', '4', '5', '6', '7', '8'))
$upd_memory_combobox.SelectedIndex = 0

$upd_net_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Virtual Switch'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(695, 50)
    Size      = New-Object System.Drawing.Size(150, 20)
}

$upd_net_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(695, 75)
    Size          = New-Object System.Drawing.Size(175, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}

$upd_autostart_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Auto-Start VM'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(515, 115)
    Size      = New-Object System.Drawing.Size(100, 20)
}

$upd_autostart_checkbox = New-Object System.Windows.Forms.CheckBox -Property @{
    Location  = New-Object System.Drawing.Point(620, 115)
    Size      = New-Object System.Drawing.Size(20, 20)
    FlatStyle = 'Flat'
    Enabled   = $false
    ForeColor = '#FFFFFF'
}

$upd_iso_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(515, 165)
    Size          = New-Object System.Drawing.Size(355, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}
[void]$upd_iso_combobox.Items.Add('None')
[void]$upd_iso_combobox.Items.Add('Detach')

$upd_iso_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Media Source'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(515, 145)
    Size      = New-Object System.Drawing.Size(150, 20)
}

$upd_add_disk_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'AdditionalDisk(GB)'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(515, 207)
    Size      = New-Object System.Drawing.Size(120, 20)
}

$upd_add_disk_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(515, 228)
    Size          = New-Object System.Drawing.Size(85, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}
$upd_add_disk_combobox.Items.AddRange(@('None', '10', '20', '30', '40', '50', '60', '70', '80', '90', '100'))
$upd_add_disk_combobox.SelectedIndex = 0

$upd_vhd_label = New-Object System.Windows.Forms.Label -Property @{
    Text      = 'Existing VHD/X'
    ForeColor = $theme_text_dim
    Location  = New-Object System.Drawing.Point(640, 207)
    Size      = New-Object System.Drawing.Size(150, 20)
}

$upd_vhd_combobox = New-Object System.Windows.Forms.ComboBox -Property @{
    Location      = New-Object System.Drawing.Point(640, 228)
    Size          = New-Object System.Drawing.Size(230, 25)
    DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    BackColor     = $theme_input_bg
    ForeColor     = '#FFFFFF'
    FlatStyle     = 'Flat'
    Enabled       = $false
}
[void]$upd_vhd_combobox.Items.Add('None')

$upd_disk_warning_text = New-Object System.Windows.Forms.TextBox -Property @{
    Text        = '[  IT IS RECOMMENDED TO MANAGE SNAPSHOTS CAREFULLY AND TO MANUALLY DELETE AND MANAGE OS DISKS AND ADDITIONAL DISKS WHEN REQUIRED IN ORDER TO PREVENT CRITICAL ISSUES  ]'
    Location    = New-Object System.Drawing.Point(515, 280)
    Size        = New-Object System.Drawing.Size(355, 60)
    Multiline   = $true
    ReadOnly    = $true
    BackColor   = $theme_bg
    ForeColor   = $theme_warning
    BorderStyle = [System.Windows.Forms.BorderStyle]::None
    Font        = New-Object System.Drawing.Font('Segoe UI', 8, [System.Drawing.FontStyle]::Italic)
}

$update_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'UPDATE VM'
    Location  = New-Object System.Drawing.Point(515, 350)
    Size      = New-Object System.Drawing.Size(200, 35)
    BackColor = $theme_warning
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI Semibold', 9)
    Enabled   = $false
}

$mgmt_reset_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'REFRESH'
    Location  = New-Object System.Drawing.Point(725, 350)
    Size      = New-Object System.Drawing.Size(145, 35)
    BackColor = '#4B4B4B'
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI Semibold', 8.5)
    Enabled   = $false
}

$delete_button = New-Object System.Windows.Forms.Button -Property @{
    Text      = 'DECOMMISSION VM'
    Location  = New-Object System.Drawing.Point(15, 350)
    Size      = New-Object System.Drawing.Size(480, 35)
    BackColor = $theme_danger
    ForeColor = '#FFFFFF'
    FlatStyle = 'Flat'
    Font      = New-Object System.Drawing.Font('Segoe UI Semibold', 9)
    Enabled   = $false
}

$inv_group.Controls.AddRange(@(
        $boot_button, $reboot_button, $shutdown_button, $turnoff_button, 
        $vm_listview, $update_section_label, 
        $upd_disk_label, $upd_disk_combobox, 
        $upd_memory_label, $upd_memory_combobox, 
        $upd_net_label, $upd_net_combobox, 
        $upd_add_disk_label, $upd_add_disk_combobox,
        $upd_vhd_label, $upd_vhd_combobox,
        $upd_disk_warning_text,
        $upd_autostart_checkbox, $upd_autostart_label, $upd_iso_label, $upd_iso_combobox,
        $update_button, $mgmt_reset_button, $delete_button
    ))

function Reset-ProvisioningInputs {
    $prov_disk_combobox.SelectedIndex = 0
    $prov_memory_combobox.SelectedIndex = 0
    if ($prov_net_combobox.Items.Count -gt 0) { $prov_net_combobox.SelectedIndex = 0 }
    $prov_autostart_checkbox.Checked = $false
    if ($prov_iso_combobox.Items.Count -gt 0) { $prov_iso_combobox.SelectedIndex = 0 }
    if ($prov_vhd_combobox.Items.Count -gt 0) { $prov_vhd_combobox.SelectedIndex = 0 }
    $prov_vm_text.Text = 'Put_A_NewHostname'
    $create_button.Enabled = $false
}

function Reset-ManagementInputs {
    $upd_disk_combobox.SelectedIndex = 0
    $upd_memory_combobox.SelectedIndex = 0
    if ($upd_net_combobox.Items.Count -gt 0) { $upd_net_combobox.SelectedIndex = 0 }
    $upd_autostart_checkbox.Checked = $false
    if ($upd_iso_combobox.Items.Count -gt 0) { $upd_iso_combobox.SelectedIndex = 0 }
    $upd_add_disk_combobox.SelectedIndex = 0
    if ($upd_vhd_combobox.Items.Count -gt 0) { $upd_vhd_combobox.SelectedIndex = 0 }

    $vm_listview.SelectedItems.Clear()
    @($boot_button, $shutdown_button, $reboot_button, $turnoff_button, $delete_button) | ForEach-Object { $_.Enabled = $false }
    $update_button.Enabled = $false
}

function Reset-AllInputs {
    Reset-ProvisioningInputs
    Reset-ManagementInputs
}

$UpdateCreateButtonState = {
    $isOsValid = $vm_os_combobox.SelectedIndex -ge 0
    $isNameValid = -not [string]::IsNullOrWhiteSpace($prov_vm_text.Text) -and $prov_vm_text.Text -ne 'Hostname' -and $prov_vm_text.Text -ne 'Put_A_NewHostname'
    
    $isDiskValid = $prov_disk_combobox.SelectedItem -and $prov_disk_combobox.SelectedItem -ne 'None'
    $isVhdValid = $prov_vhd_combobox.SelectedItem -and $prov_vhd_combobox.SelectedItem -ne 'None'
    $isIsoValid = $prov_iso_combobox.SelectedItem -and $prov_iso_combobox.SelectedItem -ne 'None'
    
    $isRamValid = $prov_memory_combobox.SelectedItem -and $prov_memory_combobox.SelectedItem -ne 'None'
    $isNetValid = $prov_net_combobox.SelectedItem -and $prov_net_combobox.SelectedItem -ne 'None'

    $create_button.Enabled = $isOsValid -and $isNameValid -and ($isDiskValid -xor $isVhdValid) -and ($isVhdValid -xor $isIsoValid) -and $isRamValid -and $isNetValid
}

$UpdateUpdateButtonState = {
    $isVmSelected = $vm_listview.SelectedItems.Count -gt 0
    $isDiskValid = $upd_disk_combobox.SelectedItem -and $upd_disk_combobox.SelectedItem -ne 'None'
    $isRamValid = $upd_memory_combobox.SelectedItem -and $upd_memory_combobox.SelectedItem -ne 'None'
    $isNetValid = $upd_net_combobox.SelectedItem -and $upd_net_combobox.SelectedItem -ne 'None'
    $isIsoValid = $upd_iso_combobox.SelectedItem -and $upd_iso_combobox.SelectedItem -ne 'None'
    $isAddDiskValid = $upd_add_disk_combobox.SelectedItem -and $upd_add_disk_combobox.SelectedItem -ne 'None'
    $isVhdValid = $upd_vhd_combobox.SelectedItem -and $upd_vhd_combobox.SelectedItem -ne 'None'
    
    $isAutoChanged = $false
    if ($isVmSelected -and $null -ne $script:allRemoteVMs) {
        $selectedItem = $vm_listview.SelectedItems[0]
        $vmName = $selectedItem.Text
        $vmData = $script:allRemoteVMs | Where-Object { $_.Name -eq $vmName }
        if ($vmData) {
            $isAutoChanged = $upd_autostart_checkbox.Checked -ne $vmData.AutoStart
        }
    }

    $update_button.Enabled = $isVmSelected -and ($isDiskValid -or $isRamValid -or $isNetValid -or $isIsoValid -or $isAutoChanged -or $isAddDiskValid -or $isVhdValid)
}

$vm_listview.Add_SelectedIndexChanged({
    if ($vm_listview.SelectedItems.Count -gt 0) {
        $selectedItem = $vm_listview.SelectedItems[0]
        $vmName = $selectedItem.Text
        $vmData = $script:allRemoteVMs | Where-Object { $_.Name -eq $vmName }
        if ($vmData) {
            $upd_autostart_checkbox.Checked = $vmData.AutoStart
        
            $boot_button.Enabled = ($vmData.State -ne 'Running')
            $shutdown_button.Enabled = ($vmData.State -ne 'Off')
            $reboot_button.Enabled = ($vmData.State -ne 'Off')
            $turnoff_button.Enabled = ($vmData.State -ne 'Off')
        }
        $delete_button.Enabled = $true
        & $UpdateUpdateButtonState
    }
    else {
        @($delete_button, $boot_button, $shutdown_button, $reboot_button, $turnoff_button) | ForEach-Object { $_.Enabled = $false }
        $update_button.Enabled = $false
    }
})

$vm_os_combobox.Add_SelectedIndexChanged($UpdateCreateButtonState)
$prov_vm_text.Add_TextChanged($UpdateCreateButtonState)

@($prov_disk_combobox, $prov_memory_combobox, $prov_net_combobox, $prov_iso_combobox, $prov_vhd_combobox) | ForEach-Object {
    $_.Add_SelectedIndexChanged($UpdateCreateButtonState)
}

@($upd_disk_combobox, $upd_memory_combobox, $upd_net_combobox, $upd_iso_combobox, $upd_add_disk_combobox, $upd_vhd_combobox) | ForEach-Object {
    $_.Add_SelectedIndexChanged($UpdateUpdateButtonState)
}

$upd_autostart_checkbox.Add_CheckedChanged($UpdateUpdateButtonState)

$machine_connect_button.Add_Click({
    if ($machine_connect_button.Text -like 'DISCONNECT*') {
        if ($global:HyperVSession) {
            Remove-PSSession $global:HyperVSession -ErrorAction SilentlyContinue
            $global:HyperVSession = $null
        }
        
        $machine_connect_button.Text = 'Connect to Host'
        $machine_connect_button.BackColor = $theme_success
        $prov_vhd_combobox.Enabled = $false
        $prov_vhd_combobox.Items.Clear()
        $prov_iso_combobox.Items.Clear()
        $upd_iso_combobox.Items.Clear()
        $vm_listview.Items.Clear()
        @($prov_iso_combobox, $prov_net_combobox, $prov_autostart_checkbox, $boot_button, $shutdown_button, $reboot_button, $turnoff_button) | ForEach-Object { $_.Enabled = $false }
        $prov_reset_button.Enabled = $false
        $mgmt_reset_button.Enabled = $false
        @($upd_iso_combobox, $upd_net_combobox, $upd_autostart_checkbox) | ForEach-Object { $_.Enabled = $false }
        
        $prov_net_combobox.Items.Clear()
        $upd_net_combobox.Items.Clear()
        Reset-AllInputs
        @($machine_text, $user_text, $pass_text) | ForEach-Object { $_.ReadOnly = $false }
        return
    }

    if ([string]::IsNullOrWhiteSpace($machine_text.Text) -or [string]::IsNullOrWhiteSpace($user_text.Text) -or [string]::IsNullOrWhiteSpace($pass_text.Text)) {
        [void][System.Windows.Forms.MessageBox]::Show('Machine name, Username, and Password are required.', 'Input Required',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        Reset-AllInputs
        return
    }

    $Comp = $machine_text.Text
    $User = $user_text.Text
    $Pass = $pass_text.Text
    
    $secPass = ConvertTo-SecureString $Pass -AsPlainText -Force
    $creds = New-Object System.Management.Automation.PSCredential($User, $secPass)

    $machine_connect_button.Enabled = $false
    $machine_connect_button.Text = 'Establishing Session...'

    try {
        if ($global:HyperVSession) {
            Remove-PSSession $global:HyperVSession -ErrorAction SilentlyContinue
            $global:HyperVSession = $null
        }

        $global:HyperVSession = New-PSSession -ComputerName $Comp -Credential $creds -Authentication Credssp -ErrorAction Stop

        $isoFiles = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            if (Test-Path 'C:\ISO') {
                Get-ChildItem -Path 'C:\ISO' -Filter *.iso | Select-Object -ExpandProperty Name
            }
        }
        $prov_iso_combobox.Items.Clear()
        $upd_iso_combobox.Items.Clear()
        [void]$prov_iso_combobox.Items.Add('None')
        [void]$upd_iso_combobox.Items.Add('None')
        [void]$upd_iso_combobox.Items.Add('Detach')
        if ($isoFiles) { 
            foreach ($iso in $isoFiles) { 
                [void]$prov_iso_combobox.Items.Add($iso) 
                [void]$upd_iso_combobox.Items.Add($iso)
            } 
        }
        $prov_iso_combobox.SelectedIndex = 0

        $vhdFiles = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            if (Test-Path 'C:\ISO') {
                Get-ChildItem -Path 'C:\ISO' -Filter *.vhd* | Where-Object { $_.Extension -match '^\.vhd(x)?$' } | Select-Object -ExpandProperty Name
            }
        }
        $prov_vhd_combobox.Items.Clear()
        $upd_vhd_combobox.Items.Clear()
        [void]$prov_vhd_combobox.Items.Add('None')
        [void]$upd_vhd_combobox.Items.Add('None')
        if ($vhdFiles) { 
            foreach ($vhd in $vhdFiles) { 
                [void]$prov_vhd_combobox.Items.Add($vhd) 
                [void]$upd_vhd_combobox.Items.Add($vhd)
            } 
        }
        $prov_vhd_combobox.SelectedIndex = 0

        $vSwitches = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            Get-VMSwitch | Select-Object -ExpandProperty Name
        }
        $prov_net_combobox.Items.Clear()
        $upd_net_combobox.Items.Clear()
        [void]$prov_net_combobox.Items.Add('None')
        [void]$upd_net_combobox.Items.Add('None')
        if ($vSwitches) { 
            foreach ($sw in $vSwitches) { 
                [void]$prov_net_combobox.Items.Add($sw) 
                [void]$upd_net_combobox.Items.Add($sw)
            } 
        }
        $prov_net_combobox.SelectedIndex = 0
        $upd_net_combobox.SelectedIndex = 0

        $prov_vhd_combobox.Enabled = $true
        $prov_reset_button.Enabled = $true
        $mgmt_reset_button.Enabled = $true
        $upd_vhd_combobox.Enabled = $true
        $prov_iso_combobox.Enabled = $true
        @($upd_iso_combobox, $upd_add_disk_combobox) | ForEach-Object { $_.Enabled = $true }
        @($prov_net_combobox, $upd_net_combobox, $prov_autostart_checkbox, $upd_autostart_checkbox) | ForEach-Object { $_.Enabled = $true }
        $boot_button.Enabled = $true
        $shutdown_button.Enabled = $true
        $reboot_button.Enabled = $true
        $turnoff_button.Enabled = $true
        
        [void][System.Windows.Forms.MessageBox]::Show("Successfully connected to $Comp", 'Connected',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    
        $machine_connect_button.Text = "DISCONNECT: $Comp"
        $machine_connect_button.BackColor = $theme_danger
        $machine_connect_button.Enabled = $true
        Reset-AllInputs
        $mgmt_reset_button.PerformClick()
    }
    catch {
        [void][System.Windows.Forms.MessageBox]::Show("Connection failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        $global:HyperVSession = $null
    
        $machine_connect_button.Text = 'Connect to Host'
        $machine_connect_button.BackColor = $theme_success
        $machine_connect_button.Enabled = $true
        @($machine_text, $user_text, $pass_text) | ForEach-Object { $_.ReadOnly = $false }

        @($prov_reset_button, $mgmt_reset_button, $prov_vhd_combobox, $upd_vhd_combobox, $prov_iso_combobox, $upd_iso_combobox, $upd_add_disk_combobox, $prov_net_combobox, $upd_net_combobox, $prov_autostart_checkbox, $upd_autostart_checkbox, $boot_button, $shutdown_button, $reboot_button, $turnoff_button) | ForEach-Object { $_.Enabled = $false }
    }
    @($machine_text, $user_text, $pass_text) | ForEach-Object { $_.ReadOnly = [bool]$global:HyperVSession }
})

$prov_reset_button.Add_Click({
    Reset-ProvisioningInputs

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
        $prov_iso_combobox.Items.Clear()
        [void]$prov_iso_combobox.Items.Add('None')
        if ($isoFiles) { 
            foreach ($iso in $isoFiles) { [void]$prov_iso_combobox.Items.Add($iso) } 
        }

        $vhdFiles = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            if (Test-Path 'C:\ISO') {
                Get-ChildItem -Path 'C:\ISO' -Filter *.vhd* | Where-Object { $_.Extension -match '^\.vhd(x)?$' } | Select-Object -ExpandProperty Name
            }
        }
        $prov_vhd_combobox.Items.Clear()
        [void]$prov_vhd_combobox.Items.Add('None')
        if ($vhdFiles) { 
            foreach ($vhd in $vhdFiles) { [void]$prov_vhd_combobox.Items.Add($vhd) } 
        }

        $vSwitches = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            Get-VMSwitch | Select-Object -ExpandProperty Name
        }
        $prov_net_combobox.Items.Clear()
        [void]$prov_net_combobox.Items.Add('None')
        if ($vSwitches) { 
            foreach ($sw in $vSwitches) { [void]$prov_net_combobox.Items.Add($sw) } 
        }
        
        $prov_iso_combobox.SelectedIndex = 0
        $prov_vhd_combobox.SelectedIndex = 0
        $prov_net_combobox.SelectedIndex = 0
        & $UpdateCreateButtonState
    }
    catch {
        [void][System.Windows.Forms.MessageBox]::Show("Failed to refresh lists: $($_.Exception.Message)", 'Error',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$create_button.Add_Click({
    if ([string]::IsNullOrWhiteSpace($prov_vm_text.Text) -or
        (-not (($prov_disk_combobox.SelectedItem -ne 'None' -and $prov_iso_combobox.SelectedItem -ne 'None' -and $prov_vhd_combobox.SelectedItem -eq 'None') -or 
            ($prov_vhd_combobox.SelectedItem -ne 'None' -and $prov_disk_combobox.SelectedItem -eq 'None' -and $prov_iso_combobox.SelectedItem -eq 'None'))) -or
        $prov_memory_combobox.SelectedItem -eq 'None' -or 
        $prov_net_combobox.SelectedItem -eq 'None') {
        [void][System.Windows.Forms.MessageBox]::Show("Invalid Selection:`n1. RAM and Switch are required.`n2. You must select either (Disk Size + ISO) OR an (Existing VHD).`n3. You cannot select both an ISO and an Existing VHD.", 'Input Required',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }

    $vhd_selection = $prov_vhd_combobox.SelectedItem
    $osType = $vm_os_combobox.SelectedItem
    $vmName = $prov_vm_text.Text
    $selectedIso = $prov_iso_combobox.SelectedItem
    $selectedSwitch = $prov_net_combobox.SelectedItem
    $autoStart = $prov_autostart_checkbox.Checked
    $disk_size = if ($prov_disk_combobox.SelectedItem -ne 'None') { [uint64]($prov_disk_combobox.SelectedItem) * 1GB } else { 0 }
    $memory_size = if ($prov_memory_combobox.SelectedItem -ne 'None') { [uint64]($prov_memory_combobox.SelectedItem) * 1GB } else { 0 }

    try {
        $create_button.Enabled = $false
        $create_button.Text = 'CREATING...'
        $create_button.Refresh()

        Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            param($vmName, $osType, $disk_size, $memory_size, $isoName, $switchName, $autoStart, $existingVhd)

            $vm_full = "MAOX-$osType-$vmName"
            $vm_path = if ($osType -eq 'WIN') { "C:\Virtual Machines\Windows\$vm_full" } else { "C:\Virtual Machines\Linux\$vm_full" }

            if (-not (Test-Path $vm_path)) { New-Item -ItemType Directory -Path $vm_path | Out-Null }
            
            $vhdPath = ''
            if ($existingVhd -and $existingVhd -ne 'None') {
                $extension = [System.IO.Path]::GetExtension($existingVhd)
                $vhdPath = Join-Path $vm_path "$vm_full$extension"
                Copy-Item -Path "C:\ISO\$existingVhd" -Destination $vhdPath -Force
            }
            else {
                $vhdPath = "$vm_path\$vm_full.vhdx"
                New-VHD -Path $vhdPath -Fixed -SizeBytes $disk_size -Confirm:$false
            }

            New-VM -Name $vm_full -MemoryStartupBytes $memory_size -VHDPath $vhdPath `
                -SwitchName $switchName -Path $vm_path -Generation 1 -BootDevice CD
            
            $startAction = if ($autoStart) { 'Start' } else { 'Nothing' }
            Set-VM -Name $vm_full -AutomaticStartAction $startAction
            if ($isoName -and $isoName -ne 'None') { Add-VMDvdDrive -VMName $vm_full -Path "C:\ISO\$isoName" }
            Start-VM $vm_full
        } -ArgumentList $vmName, $osType, $disk_size, $memory_size, $selectedIso, $selectedSwitch, $autoStart, $vhd_selection

        Reset-ProvisioningInputs
        $mgmt_reset_button.PerformClick()
        [void][System.Windows.Forms.MessageBox]::Show("Successfully created VM: MAOX-$osType-$vmName", 'Success',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
    catch {
        [void][System.Windows.Forms.MessageBox]::Show("Error creating VM: $($_.Exception.Message)", 'Error',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
    finally {
        $create_button.Text = 'PROVISION VM'
    }
})

$update_button.Add_Click({
    if ($vm_listview.SelectedItems.Count -eq 0) {
        [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list to update.', 'No VM Selected',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }

    $selectedItem = $vm_listview.SelectedItems[0]
    $vmName = $selectedItem.Text
    $vmData = $script:allRemoteVMs | Where-Object { $_.Name -eq $vmName }

    $isDiskPicked = $upd_disk_combobox.SelectedItem -and $upd_disk_combobox.SelectedItem -ne 'None'
    $isRamPicked = $upd_memory_combobox.SelectedItem -and $upd_memory_combobox.SelectedItem -ne 'None'
    $isNetPicked = $upd_net_combobox.SelectedItem -and $upd_net_combobox.SelectedItem -ne 'None'
    $isIsoPicked = $upd_iso_combobox.SelectedItem -and $upd_iso_combobox.SelectedItem -ne 'None'
    $isAddDiskPicked = $upd_add_disk_combobox.SelectedItem -and $upd_add_disk_combobox.SelectedItem -ne 'None'
    $isVhdPicked = $upd_vhd_combobox.SelectedItem -and $upd_vhd_combobox.SelectedItem -ne 'None'
    $isAutoStartChanged = $null -ne $vmData -and ($upd_autostart_checkbox.Checked -ne $vmData.AutoStart)

    if (-not ($isDiskPicked -or $isRamPicked -or $isNetPicked -or $isIsoPicked -or $isAutoStartChanged -or $isAddDiskPicked -or $isVhdPicked)) {
        [void][System.Windows.Forms.MessageBox]::Show('Please select at least one setting to update.', 'Selection Required',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }

    $new_memory = if ($isRamPicked) { [uint64]($upd_memory_combobox.SelectedItem) * 1GB } else { $null }
    $new_disk = if ($isDiskPicked) { [uint64]($upd_disk_combobox.SelectedItem) * 1GB } else { $null }
    $new_add_disk = if ($isAddDiskPicked) { [uint64]($upd_add_disk_combobox.SelectedItem) * 1GB } else { $null }
    $selectedIso = if ($isIsoPicked) { $upd_iso_combobox.SelectedItem } else { $null }
    $selectedVhd = if ($isVhdPicked) { $upd_vhd_combobox.SelectedItem } else { $null }
    $selectedSwitch = if ($isNetPicked) { $upd_net_combobox.SelectedItem } else { $null }
    $autoStart = $upd_autostart_checkbox.Checked

    try {
        $update_button.Enabled = $false
        $update_button.Text = 'Syncing...'

        Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            param($vmName, $memory, $disk, $isoName, $switchName, $autoStart, $addDisk, $existingVhd)
            $vm = Get-VM -Name $vmName -ErrorAction Stop
            $wasRunning = $vm.State -eq 'Running'

            $needsShutdown = ($null -ne $memory -or $null -ne $disk -or $null -ne $addDisk -or $null -ne $existingVhd)
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

            if ($null -ne $addDisk) {
                $vmPath = $vm.Path
                $diskCount = (Get-VMHardDiskDrive -VMName $vmName).Count
                $newDiskPath = Join-Path $vmPath "$vmName-Data-$diskCount.vhdx"
                New-VHD -Path $newDiskPath -Fixed -SizeBytes $addDisk -Confirm:$false
                Add-VMHardDiskDrive -VMName $vmName -Path $newDiskPath
            }
            
            if ($existingVhd) {
                $vmPath = $vm.Path
                $extension = [System.IO.Path]::GetExtension($existingVhd)
                $vhdCount = (Get-VMHardDiskDrive -VMName $vmName).Count
                $destPath = Join-Path $vmPath "$vmName-Attached-$vhdCount$extension"
                Copy-Item -Path "C:\ISO\$existingVhd" -Destination $destPath -Force
                Add-VMHardDiskDrive -VMName $vmName -Path $destPath
            }

            if ($isoName) {
                $drives = Get-VMDvdDrive -VMName $vmName
                if ($isoName -eq 'Detach') {
                    if ($drives) { $drives | Set-VMDvdDrive -Path $null -ErrorAction Stop }
                }
                else {
                    $isoPath = "C:\ISO\$isoName"
                    if ($drives) {
                        $drives | Set-VMDvdDrive -Path $null -ErrorAction SilentlyContinue
                        Set-VMDvdDrive -VMDvdDrive $drives[0] -Path $isoPath -ErrorAction Stop
                    }
                    elseif ($vm.State -eq 'Off') {
                        Add-VMDvdDrive -VMName $vmName -Path $isoPath -ErrorAction Stop
                    }
                }
            }

            if ($switchName) {
                $adapter = Get-VMNetworkAdapter -VMName $vmName | Select-Object -First 1
                if ($adapter) { Connect-VMNetworkAdapter -VMNetworkAdapter $adapter -SwitchName $switchName }
            }

            $startAction = if ($autoStart) { 'Start' } else { 'Nothing' }
            Set-VM -Name $vmName -AutomaticStartAction $startAction

            if ($needsShutdown -and $wasRunning) {
                Start-VM -Name $vmName -ErrorAction Stop
            }
        } -ArgumentList $vmName, $new_memory, $new_disk, $selectedIso, $selectedSwitch, $autoStart, $new_add_disk, $selectedVhd
        
        $mgmt_reset_button.PerformClick()
        [void][System.Windows.Forms.MessageBox]::Show("Successfully updated hardware for $vmName", 'Update Complete',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
    catch {
        [void][System.Windows.Forms.MessageBox]::Show("Update failed: $($_.Exception.Message)", 'Error',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
    finally {
        $update_button.Text = 'UPDATE VM'
    }
})

$mgmt_reset_button.Add_Click({
    $vm_listview.Items.Clear()

    if (-not $global:HyperVSession) {
        [void][System.Windows.Forms.MessageBox]::Show('Please establish a remote session first.', 'Not Connected',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }

    $mgmt_reset_button.Enabled = $false
    $mgmt_reset_button.Text = 'Syncing...'
    Reset-ManagementInputs

    $script:allRemoteVMs = @()

    try {
        $script:allRemoteVMs = Invoke-Command -Session $global:HyperVSession -ScriptBlock {
            Get-VM | ForEach-Object {
                $vhds = Get-VMHardDiskDrive -VMName $_.Name
                $diskSizeGB = if ($vhds) {
                    $sizes = foreach ($v in $vhds) {
                        if ($v.Path) { [math]::Round((Get-VHD -Path $v.Path).Size / 1GB) }
                    }
                    $sizes -join ', '
                } else { 'N/A' }
                
                $ip = ($_.NetworkAdapters.IPAddresses | Where-Object { $_ -match '^\d{1,3}(\.\d{1,3}){3}$' } | Select-Object -First 1) -join ''
                $uptime = if ($_.State -eq 'Running') { $_.Uptime.ToString("dd'd 'hh'h 'mm'm'") } else { '0s' }
                $isoAttached = [bool](Get-VMDvdDrive -VMName $_.Name | Where-Object { $null -ne $_.Path })
                
                [PSCustomObject]@{ 
                    Name        = $_.Name
                    State       = $_.State.ToString()
                    Disk        = $diskSizeGB
                    RAM         = [math]::Round($_.MemoryStartup / 1GB)
                    IP          = if ($ip) { $ip } else { 'Dynamic or No IP' }
                    Uptime      = $uptime
                    AutoStart   = ($_.AutomaticStartAction -eq 'Start')
                    IsoAttached = $isoAttached
                }
            }
        }

        foreach ($vm in $allRemoteVMs) {
            $item = New-Object System.Windows.Forms.ListViewItem($vm.Name)
            $item.SubItems.Add($vm.State)
            $item.SubItems.Add($vm.Disk)
            $item.SubItems.Add("$($vm.RAM)GB")
            $item.SubItems.Add($vm.IP)
            $item.SubItems.Add($vm.Uptime)
            $item.ForeColor = if ($vm.State -eq 'Running') { [System.Drawing.Color]::FromArgb(0, 255, 17) } else { [System.Drawing.Color]::Gray }
            [void]$vm_listview.Items.Add($item)
        }
    }
    catch {
        [System.Windows.Forms.MessageBox]::Show(($_.Exception.Message), 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
    finally {
        $mgmt_reset_button.Enabled = $true
        $mgmt_reset_button.Text = 'REFRESH LIST'
    }
})

$delete_button.Add_Click({
    if ($vm_listview.SelectedItems.Count -eq 0) {
        [void][System.Windows.Forms.MessageBox]::Show('Please pick a VM from the list first by clicking it.', 'No VM Selected',
            [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }

    $selectedItem = $vm_listview.SelectedItems[0]
    $rawVmName = $selectedItem.Text

    $confirm = [System.Windows.Forms.MessageBox]::Show("Are you sure you want to completely delete '$rawVmName'? This process cannot be undone.", 'Confirm Deletion',
        [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)

    if ($confirm -eq [System.Windows.Forms.DialogResult]::Yes) {
        try {
            $delete_button.Enabled = $false
            $delete_button.Text = 'Removing Assets...'

            Invoke-Command -Session $global:HyperVSession -ScriptBlock {
                param($targetVm)
                $path = (Get-VM $targetVm | Get-VMHardDiskDrive).Path | Split-Path -Parent
                Stop-VM -Name $targetVm -TurnOff -Force -ErrorAction SilentlyContinue -WarningAction Ignore
                Remove-VM -Name $targetVm -Force -Confirm:$false -ErrorAction Stop -WarningAction Ignore
                if (Test-Path $path) { Remove-Item -Path $path -Recurse -Force -ErrorAction Stop -WarningAction Ignore }
            } -ArgumentList $rawVmName

            $mgmt_reset_button.PerformClick()
            [void][System.Windows.Forms.MessageBox]::Show("Successfully deleted VM: $rawVmName", 'Deleted',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        }
        catch {
            [void][System.Windows.Forms.MessageBox]::Show("Failed to delete VM: $($_.Exception.Message)", 'Deletion Error',
                [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        finally {
            $delete_button.Text = 'DECOMMISSION VM'
        }
    }
})

$boot_button.Add_Click({
    if ($vm_listview.SelectedItems.Count -eq 0) { return }
    $vmName = $vm_listview.SelectedItems[0].Text
    try {
        Invoke-Command -Session $global:HyperVSession -ScriptBlock { param($name) Start-VM -Name $name -ErrorAction Stop } -ArgumentList $vmName
        $mgmt_reset_button.PerformClick()
    } catch {
        [void][System.Windows.Forms.MessageBox]::Show("Boot failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$shutdown_button.Add_Click({
    if ($vm_listview.SelectedItems.Count -eq 0) { return }
    $vmName = $vm_listview.SelectedItems[0].Text
    try {
        Invoke-Command -Session $global:HyperVSession -ScriptBlock { param($name) Stop-VM -Name $name -Confirm:$false -ErrorAction Stop } -ArgumentList $vmName
        $mgmt_reset_button.PerformClick()
    } catch {
        [void][System.Windows.Forms.MessageBox]::Show("Shutdown failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$reboot_button.Add_Click({
    if ($vm_listview.SelectedItems.Count -eq 0) { return }
    $vmName = $vm_listview.SelectedItems[0].Text
    try {
        Invoke-Command -Session $global:HyperVSession -ScriptBlock { param($name) Restart-VM -Name $name -Confirm:$false -Force -ErrorAction Stop } -ArgumentList $vmName
        $mgmt_reset_button.PerformClick()
    } catch {
        [void][System.Windows.Forms.MessageBox]::Show("Reboot failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$turnoff_button.Add_Click({
    if ($vm_listview.SelectedItems.Count -eq 0) { return }
    $vmName = $vm_listview.SelectedItems[0].Text

    $confirm = [System.Windows.Forms.MessageBox]::Show("Are you sure you want to hard Turn Off '$vmName'?", 'Confirm Turn Off',
        [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)

    if ($confirm -eq [System.Windows.Forms.DialogResult]::Yes) {
        try {
            Invoke-Command -Session $global:HyperVSession -ScriptBlock { param($name) Stop-VM -Name $name -TurnOff -Confirm:$false -ErrorAction Stop } -ArgumentList $vmName
            $mgmt_reset_button.PerformClick()
        } catch {
            [void][System.Windows.Forms.MessageBox]::Show("Turn off failed: $($_.Exception.Message)", 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
})

$vm_window.Controls.AddRange(@( $header_panel, $conn_group, $config_group, $inv_group ))
$vm_window.Add_FormClosing({ if ($global:HyperVSession) { Remove-PSSession $global:HyperVSession -ErrorAction SilentlyContinue } })
[void]$vm_window.ShowDialog()