#!/bin/bash
# For sorting single runs during shifts for IS757
# Samuel Reeve 03/10/2024
# Mod for running on LCRC at ANL CRH - 10/02/2025

# Directories
BINDIR="/home/crhoffman/iss_crh/bin"
CALDIR="/home/crhoffman/iss_crh/38k"
DATADIR="/lcrc/project/HELIOS/experimentsData/IS757"

# Calibration files
SETTINGSFILE="${CALDIR}/settings_38K_IS757.dat"
CALIBFILE="${CALDIR}/calibration_38K_IS757.cal"
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

${BINDIR}/iss_sort -s $SETTINGSFILE -c $CALIBFILE -r $REACTIONFILE -i $DATADIR/R${RUN}_?? $DATADIR/R${RUN}_? ${FLAG} -o $DATADIR/sorted_crh/R${RUN}_sumhists.root