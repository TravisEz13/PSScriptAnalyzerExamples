function myFunction
{
  param(
    $optionalParam,
    $optionalParam2 = $null,
    [parameter(mandatory=$true)]
    $mandatoryParam
  )
  Write-verbose -message 'inMyFunction'
}