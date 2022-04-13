set projDir "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/vivado"
set projName "1D Tap Diz"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/au_top_0.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/reset_conditioner_1.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/button_conditioner_2.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/edge_detector_3.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/multi_seven_seg_4.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/multi_dec_ctr_5.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/betacpu_6.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/pipeline_7.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/counter_8.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/seven_seg_9.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/decoder_10.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/decimal_counter_11.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/alu_12.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/lunatic_ROM_13.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/counter_14.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/counter_15.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/counter_16.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/counter_17.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/controlunit_18.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/regfile_19.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/random_row_20.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/adder_21.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/compare_22.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/boolean_23.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/shifter_24.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/edge_detector_25.v" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/verilog/pn_gen_26.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/work/constraint/custom.xdc" "C:/Users/royde/AlchitryProjects/1D\ Tap\ Diz/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
