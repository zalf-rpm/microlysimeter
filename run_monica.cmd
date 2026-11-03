@echo off

set MONICA_PARAMETERS=C:\zalf-rpm\monica-parameters
set MONICA_EXE="C:\MONICA\monica_win64_3.7.1.improved_merge_climate_data\bin\monica-run.exe"

if not exist "output" mkdir "output"

%MONICA_EXE% -o "output\GE1.csv" "%~dp0\Grossbeeren\GE1\sim-min.json"
%MONICA_EXE% -o "output\GE2.csv" "%~dp0\Paulinenaue\GE2\sim-min.json"
%MONICA_EXE% -o "output\GE3.csv" "%~dp0\Paulinenaue\GE3\sim-min.json"
%MONICA_EXE% -o "output\GE4.csv" "%~dp0\Paulinenaue\GE4\sim-min.json"
%MONICA_EXE% -o "output\GE5.csv" "%~dp0\Paulinenaue\GE5\sim-min.json"
%MONICA_EXE% -o "output\GE6.csv" "%~dp0\Paulinenaue\GE6\sim-min.json"
%MONICA_EXE% -o "output\GE7.csv" "%~dp0\Paulinenaue\GE7\sim-min.json"
%MONICA_EXE% -o "output\GE8.csv" "%~dp0\Rheinland-Pfalz\GE8\sim-min.json"
%MONICA_EXE% -o "output\GE9.csv" "%~dp0\Rheinland-Pfalz\GE9\sim-min.json"
%MONICA_EXE% -o "output\GE10.csv" "%~dp0\Rheinland-Pfalz\GE10\sim-min.json"
%MONICA_EXE% -o "output\GE11.csv" "%~dp0\Rheinland-Pfalz\GE11\sim-min.json"

echo All simulations done.