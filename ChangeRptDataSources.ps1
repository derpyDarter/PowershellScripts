$rptPath = 'C:\Some\Path';
Set-Location $rptPath;
foreach ($item in Get-ChildItem -Filter *.rpt -File -Recurse) {
    $fullPath = $rptPath + '\' + $item;
    $rpt = New-Object CrystalDecisions.CrystalReports.Engine.ReportDocument;
    $rpt.Load($fullPath);
    $rpt.DataSourceConnections[0].SetConnection('ODBC_DSN', 'ODBC_DSN', 0);
    $rpt.SaveAs($fullPath);
    $rpt.Close();
    $rpt.Dispose();
    Write-Host "Datasource changed for " + $fullPath;
}
