transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Universidade-de-Aveiro---LECI/UA/FPGA/LSD PRATICAS/Aula02/Parte03/Bin7SegDecoder.vhd}

