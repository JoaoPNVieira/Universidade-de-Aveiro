transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Universidade-de-Aveiro---LECI/UA/FPGA/MiniProjecto/CntUp100.vhd}

