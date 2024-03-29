
// File generated by Go version U-2022.12#33f3808fcb#221128, Thu Jan 25 16:08:15 2024
// Copyright 2014-2022 Synopsys, Inc. All rights reserved.
// go -I../lib -F -DSYNTHESIS_NO_UNGROUP -D__tct_patch__=0 -Verilog -otrv32p3_cnn_vlog -cgo_options.cfg -Itrv32p3_cnn_vlog/tmp_pdg -updg -updg_controller trv32p3_cnn



`timescale 1ns/1ps

// module jtag_interface :
module jtag_interface
  ( input             jtag_trst,
    input             reset,
    input             clock,
    input      [31:0] dbg_data_po_in,
    input      [15:0] dbg_instr_in,
    input             jtag_capture_dr_in,
    input             jtag_shift_dr_in,
    input             jtag_si_in,
    input             jtag_tck_in,
    input             jtag_update_dr_in,
    input             jtag_update_ir_in,
    output reg [31:0] dbg_data_pi_out,
    output            dbg_data_we_out,
    output            dbg_instr_exec_out,
    output            jtag_so_out
  );


  wire   [31:0] dbg_data_pi;
  reg    dbg_data_we_REG;
  reg    dbg_instr_exec_REG;
  reg    jtag_update_dr_REG;
  reg    jtag_update_ir_REG;
  reg    [2:0] sync_dr_REG;
  reg    [2:0] sync_ir_REG;


  assign dbg_instr_exec_out = dbg_instr_exec_REG;
  assign dbg_data_we_out = dbg_data_we_REG;

  // delay over JTAG clock (decode new JTAG instruction AFTER update_ir cycle)
  always @ (posedge jtag_tck_in or negedge jtag_trst)
  begin: jtag_update_ir_delay
    if (! jtag_trst)
      jtag_update_ir_REG <= 1'b0;
    else
      jtag_update_ir_REG <= jtag_update_ir_in;
  end

  // synchronisation to processor clock
  always @ (posedge clock or posedge reset)
  begin: sync_update_ir_proc
    if (reset)
    begin
      sync_ir_REG <= {3{1'b1}};
      dbg_instr_exec_REG <= 1'b0;
    end
    else
    begin
      sync_ir_REG[0] <= jtag_update_ir_REG;
      sync_ir_REG[1] <= sync_ir_REG[0];
      sync_ir_REG[2] <= sync_ir_REG[1];
      dbg_instr_exec_REG <= sync_ir_REG[1] && !sync_ir_REG[2];
    end
  end

  // scan register contains new value AFTER update_dr cycle
  always @ (posedge jtag_tck_in or negedge jtag_trst)
  begin: update_dr_delay
    if (! jtag_trst)
      jtag_update_dr_REG <= 1'b0;
    else
      jtag_update_dr_REG <= jtag_update_dr_in;
  end

  // synchronisation to processor clock
  always @ (posedge clock or posedge reset)
  begin: sync_update_dr_proc
    if (reset)
    begin
      sync_dr_REG <= {3{1'b1}};
      dbg_data_we_REG <= 1'b0;
    end
    else
    begin
      sync_dr_REG[0] <= jtag_update_dr_REG;
      sync_dr_REG[1] <= sync_dr_REG[0];
      sync_dr_REG[2] <= sync_dr_REG[1];
      dbg_data_we_REG <= sync_dr_REG[1] && !sync_dr_REG[2];
    end
  end

  jtag_scan_register
  #(.scan_reg_width(32))
  inst_dbg_scan_reg(
      .jtag_trst(jtag_trst),
      .jtag_capture_dr_in(jtag_capture_dr_in),
      .jtag_par_in(dbg_data_po_in),
      .jtag_shift_dr_in(jtag_shift_dr_in),
      .jtag_si_in(jtag_si_in),
      .jtag_tck_in(jtag_tck_in),
      .jtag_update_dr_in(jtag_update_dr_in),
      .jtag_par_out(dbg_data_pi),
      .jtag_so_out(jtag_so_out));

  // align data to lsb side
  always @ (*)
  begin: align_to_lsb
    dbg_data_pi_out = 0;
    case (dbg_instr_in[1:0])
      2'b00: // DBG_DATA_REG_INDX
        dbg_data_pi_out[7:0] = dbg_data_pi[31:24];
      2'b01: // DBG_ADDR_REG_INDX
        dbg_data_pi_out = dbg_data_pi;
      2'b10: // DBG_INSTR_REG_INDX
        dbg_data_pi_out = dbg_data_pi;
      default :
        dbg_data_pi_out = dbg_data_pi;
    endcase
  end

endmodule
