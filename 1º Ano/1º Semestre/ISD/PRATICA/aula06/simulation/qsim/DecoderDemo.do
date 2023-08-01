onerror {exit -code 1}
vlib work
vcom -work work DecoderDemo.vho
vcom -work work p2sim4.vwf.vht
vsim -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.DecoderDemo3_vhd_vec_tst
vcd file -direction DecoderDemo.msim.vcd
vcd add -internal DecoderDemo3_vhd_vec_tst/*
vcd add -internal DecoderDemo3_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

