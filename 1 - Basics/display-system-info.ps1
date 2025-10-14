# Calling 'Get-ComputerInfo' method to return all computer information.
Get-ComputerInfo | 
# Calling 'Select-Object' method to filter results through '-Property' parameters.
Select-Object -Property WindowsProductName, OSDisplayVersion, CsProcessors, OsTotalVisibleMemorySize