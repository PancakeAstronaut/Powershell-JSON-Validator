#!/bin/bash
FILE="powershellValidator.ps1"
if test -f "$FILE"; then
  pwsh -File powershellValidator.ps1
else
  echo "powershellValidator.ps1 script not found in directory. Ensure it is there and try again!"
fi
