# Microlysimeter MONICA Setup

This repository contains MONICA simulation inputs for microlysimeter measurements in Grossbeeren and Paulinenaue.

The setup includes seven simulations:

| Location | Simulations | Start date | End date |
| --- | --- | --- | --- |
| Grossbeeren | GE1 | 2003-04-23 | 2006-04-24 |
| Paulinenaue | GE2–GE7 | 2018-07-20 | 2023-01-03 |

## Repository contents

| Path | Purpose |
| --- | --- |
| `Grossbeeren/GE1/` | GE1 simulation configuration and inputs. |
| `Paulinenaue/GE2/` … `Paulinenaue/GE7/` | GE2–GE7 simulation configurations and inputs. |
| `nleach_measured.csv` | Measured nitrogen leaching for GE1–GE7. Unit: kg N ha-1, Area: 0.04909 m<sup>2</sup> |
| `waterleach_measured.csv` | Measured water leaching for GE1–GE7. Unit: mm, Area: 0.04909 m<sup>2</sup> |
| `run_monica.cmd` | Windows batch script that runs every `sim-min.json` configuration. |

Each simulation directory contains:

- `sim-min.json`: Simulation configurations linking crop management, site, climate files, and output settings.
- `crop-min.json`: General crop parameters. The current crop rotations have empty workstep lists.
- `site-min.json`: Site-specific soil profiles and parameters.
- `climate-GE1.csv` (GE1) or `climate-GE2-7.csv` (GE2–GE7): Daily weather inputs.

## Requirements

- Windows for the supplied batch script.
- A MONICA installation, including `monica-run.exe` and the matching `monica-parameters` directory.

The MONICA executable and its parameter library are external dependencies and are not included here.

## Run the simulations

1. Open `run_monica.cmd` and update `MONICA_PARAMETERS` and `MONICA_EXE` to match your MONICA installation:

   ```bat
   set MONICA_PARAMETERS=C:\zalf-rpm\monica-parameters
   set MONICA_EXE="C:\MONICA\monica_win64_3.6.56.OxygenDeficit_fix\bin\monica-run.exe"
   ```

   `MONICA_PARAMETERS` supplies the base directory for parameter files referenced by the JSON inputs.

2. Open PowerShell in the repository root and run:

   ```powershell
   .\run_monica.cmd
   ```

The script creates `output/` in the current working directory if necessary and runs all seven configurations sequentially. Each simulation writes a CSV named after its configuration, such as `output/GE1.csv`.

Inspect MONICA's console output for errors: the batch script prints a completion message even if an individual simulation fails. Rerunning the script targets the same output filenames.

## Comparing measurements with MONICA simulations

Both measurement files use the columns `site`, `date`, `mean`, `sd`, `cumulative`. The `site` column identifies GE1–GE7, and dates use `YYYY-MM-DD`. The value columns contain the measured mean, standard deviation, and cumulative value.

To compare measurements with simulations:

1. Match each measurement series to its simulation using `site`.
2. Select daily `NLeach` for nitrogen leaching or daily `Recharge` for water leaching.
3. For a cumulative comparison, accumulate simulated daily values from the same baseline date used by the measured `cumulative` series. Compare the accumulated simulated values with measured `cumulative` values on the measurement dates.
