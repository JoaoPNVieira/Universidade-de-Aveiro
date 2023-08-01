onerror {exit -code 1}
vlib work
vcom -work work MuxDemo.vho
vcom -work work SimEx4.vwf.vht
vsim -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.MuxDemo_vhd_vec_tst
vcd file -direction MuxDemo.msim.vcd
vcd add -internal MuxDemo_vhd_vec_tst/*
vcd add -internal MuxDemo_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f



