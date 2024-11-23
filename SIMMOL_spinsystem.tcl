# The code to run on the TkConsole in VMD after installing simmol
# The example uses 5UZI.pdb. Put the pdb file in the folder you want to work
cd /path_to_working_directory/
package require simmol
mnewspinsys
set m [mol new 5UZI.pdb first 0 last 0]    # If using NMR structure change the first and last value depending on your requirement
set m1Ac8 [atomselect $m "resname MA7 and name C8"]                             # C8 from MA7
set m1Ac8_zone [atomselect $m "within 4 of resname MA7 and name C8"]            # All atoms at ≤4Å of C8 from MA7
set H_m1Ac8_zone [atomselect $m "index [$m1Ac8_zone list] and name \"H.*\""]    # Protons at ≤4Å of C8 from MA7
set C_m1Ac8_zone [atomselect $m "index [$m1Ac8_zone list] and name \"C.*\""]    # Carbons at ≤4Å of C8 from MA7
set N_m1Ac8_zone [atomselect $m "index [$m1Ac8_zone list] and name \"N.*\""]    # Nitrogens at ≤4Å of C8 from MA7
set dip_m1Ac8-Call [mdipole $m1Ac8 $C_m1Ac8_zone 0AA 0Hz]
msavespinsys m1Ac8-Call.spinsys -simpson
