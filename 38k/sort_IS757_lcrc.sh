#!/bin/bash
# For sorting single runs during shifts for IS757
# Samuel Reeve 03/10/2024

# Directories
BINDIR="/Users/calemhoffman/Documents/GitHub/ISSSort_crh/bin"
CALDIR="/Users/calemhoffman/Research/isolde/cals"
DATADIR="/Users/calemhoffman/Research/isolde/data"

# Calibration files
SETTINGSFILE="${CALDIR}/settings_38K_031024.dat"
CALIBFILE="${CALDIR}/calibration_IS757_031024.cal"
REACTIONFILE="${CALDIR}/reaction_38K_IS757.dat"
#CUTFILE="${CALDIR}/2MeV_EvZ_thres.root"-> Set In Reaction File

# First argument = run number
RUN=$1

# Check if RUN number is provided
if [ -z "$RUN" ]; then
  echo "Error: Run number not provided. Please provide the first argument (run number)."
  exit 1
fi

# Second argument = iss_sort flag (e.g. -e, -f)
FLAG=$2

./iss_sort -s $SETTINGSFILE -c $CALIBFILE -r $REACTIONFILE -i $DATADIR/R${RUN}_?? $DATADIR/R${RUN}_? ${FLAG} -o $DATADIR/sorted/R${RUN}_sumhists.root