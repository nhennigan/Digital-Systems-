@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xsim mux21_1_TB_behav -key {Behavioral:sim_1:Functional:mux21_1_TB} -tclbatch mux21_1_TB.tcl -view C:/fm17/summer17/clement/build/Jeremy/viciLab_09_24_17/sample_projects/user/combinational/multiplexers/mux21_1/vhdl/xilinxprj/isim/mux21_1_TB_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
