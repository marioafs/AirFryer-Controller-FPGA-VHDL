transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/AirFryerController.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/AirFryerFSM.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/TimerAuxFSM.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/TempAuxFSM.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/FreqDividerK.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/PulseGenerator.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/DebounceUnit.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/Bin7SegDecoderEn.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/Bin2BCD8_8.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/Bin2BCD8_12.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/SyncSWReg.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/ProgramReg.vhd}
vcom -93 -work work {C:/Users/mario/Desktop/quartus/LSD/projeto_final/vfinal/TimerNDes.vhd}

