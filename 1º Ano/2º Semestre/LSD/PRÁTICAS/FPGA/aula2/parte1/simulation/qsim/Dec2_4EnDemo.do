onerror {exit -code 1}
vlib work
vlog -work work Dec2_4EnDemo.vo
vlog -work work Dec2_4En_2.vwf.vt
vsim -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Dec2_4En_vlg_vec_tst
vcd file -direction Dec2_4EnDemo.msim.vcd
vcd add -internal Dec2_4En_vlg_vec_tst/*
vcd add -internal Dec2_4En_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
