onerror {exit -code 1}
vlib work
vlog -work work Counter_Demo.vo
vlog -work work p3ex5.vwf.vt
vsim -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.CounterUpDown4_vlg_vec_tst
vcd file -direction Counter_Demo.msim.vcd
vcd add -internal CounterUpDown4_vlg_vec_tst/*
vcd add -internal CounterUpDown4_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

