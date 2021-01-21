package require simmol
mnewspinsys
set m [mol new cuala.pdb first 0 last 0]
set c1 [atomselect $m "name C1"]
set c2 [atomselect $m "name C2"]
set c3 [atomselect $m "name C3"]
set Hall [atomselect $m "name \"H.*\""]
set H1 [atomselect $m "name H1"]
set H2 [atomselect $m "name H2"]
set H3 [atomselect $m "name H3"]
set H4 [atomselect $m "name H4"]
set H5 [atomselect $m "name H5"]
set H6 [atomselect $m "name H6"]
set dip13 [mdipole $c1 $c3 1AA 0Hz]
set dip23 [mdipole $c2 $c3 1AA 0Hz]
set dipHc3 [mdipole $Hall $c3 3AA 0AA]
msavespinsys Cb_H.spinsys -simpson

set Hdipc3 [atomselect $m "within 3 of name C3"]
$Hdipc3 get {name index}
set Hc3 [atomselect $m "index 14 15 16 17 18 19"]
set hhdip [mdipole $Hc3 $Hc3 0AA 0Hz]
