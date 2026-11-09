$currentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Output "BAO CAO SU CO HE THONG SMARTFARM" > ..\backup\bao-cao-su-co.txt
Write-Output "Thoi gian xuat bao cao: $currentTime" >> ..\backup\bao-cao-su-co.txt
Write-Output "----------------------------------------" >> ..\backup\bao-cao-su-co.txt
Write-Output "DANH SACH LOI (CRITICAL / ERROR):" >> ..\backup\bao-cao-su-co.txt
Get-Content -Path ..\data\log-he-thong.log | Select-String -Pattern "CRITICAL", "ERROR" >> ..\backup\bao-cao-su-co.txt
$errorCount = (Get-Content -Path ..\data\log-he-thong.log | Select-String -Pattern "CRITICAL", "ERROR").Count
Write-Output "----------------------------------------" >> ..\backup\bao-cao-su-co.txt
Write-Output "TONG SO SU CO: $errorCount" >> ..\backup\bao-cao-su-co.txt
