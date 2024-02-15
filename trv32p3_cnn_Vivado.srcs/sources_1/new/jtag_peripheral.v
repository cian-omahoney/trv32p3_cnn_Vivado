`timescale 1ns/1ps

// module jtag_interface :
module jtag_peripheral
  (
    input reset,
    input clock,
    input jtag_tck,
    input jtag_tdi,
    input jtag_tms,
    output jtag_tdo,
    input [31:0]dbg_data_po,
    output[31:0] dbg_data_pi,
    output dbg_data_we,
    output[15:0]  dbg_instr,
    output dbg_instr_exec
  );
  
wire jtag_trst = 1;
wire [31:0] jtag_tap_si;
wire jtag_tap_so;
wire jtag_so;
wire jtag_capture_dr;
wire jtag_shift_dr;
wire jtag_update_dr;
wire jtag_update_ir;


jtag_tap_controller inst_jtag_tap_controller(
    .jtag_trst(jtag_trst),
    .jtag_tap_si_in(jtag_tap_si),
    .jtag_tck_in(jtag_tck),
    .jtag_tdi_in(jtag_tdi),
    .jtag_tms_in(jtag_tms),
    .dbg_instr_out(dbg_instr),
    .jtag_capture_dr_out(jtag_capture_dr),
    .jtag_shift_dr_out(jtag_shift_dr),
    .jtag_tap_so_out(jtag_tap_so),
    .jtag_tdo_out(jtag_tdo),
    .jtag_update_dr_out(jtag_update_dr),
    .jtag_update_ir_out(jtag_update_ir));
  
  
jtag_interface inst_jtag_interface(
    .jtag_trst(jtag_trst),
    .reset(reset),
    .clock(clock),
    .dbg_data_po_in(dbg_data_po),
    .dbg_instr_in(dbg_instr),
    .jtag_capture_dr_in(jtag_capture_dr),
    .jtag_shift_dr_in(jtag_shift_dr),
    .jtag_si_in(jtag_si),
    .jtag_tck_in(jtag_tck),
    .jtag_update_dr_in(jtag_update_dr),
    .jtag_update_ir_in(jtag_update_ir),
    .dbg_data_pi_out(dbg_data_pi),
    .dbg_data_we_out(dbg_data_we),
    .dbg_instr_exec_out(dbg_instr_exec),
    .jtag_so_out(jtag_so));

  assign jtag_tap_si[31:2] = 0;
  assign jtag_tap_si[1] = jtag_so;
  assign jtag_tap_si[0] = 0;  

endmodule