
// File generated by Go version U-2022.12#33f3808fcb#221128, Thu Jan 25 16:08:15 2024
// Copyright 2014-2022 Synopsys, Inc. All rights reserved.
// go -I../lib -F -DSYNTHESIS_NO_UNGROUP -D__tct_patch__=0 -Verilog -otrv32p3_cnn_vlog -cgo_options.cfg -Itrv32p3_cnn_vlog/tmp_pdg -updg -updg_controller trv32p3_cnn



`timescale 1ns/1ps

// module reg_ocd_instr : reg_ocd_instr
module reg_ocd_instr
  // synopsys translate_off
  #(parameter reg_log = 1'b1)
  // synopsys translate_on
  ( input             reset,
    input             clock,
    input             __ocd_ld_PMbS3_r_in, // bool
    input             en_ocd_instr_pdcw_in, // std_logic
    input      [31:0] ocd_instr_pdcw_in, // iword
    input      [31:0] ocd_instr_w_in, // iword
    output reg [31:0] ocd_instr_pdcr_out, // iword
    output reg [31:0] ocd_instr_r_out // iword
  );


  reg [31:0] reg_val;

  // synopsys translate_off

  reg reg_write_log;

  always @ (negedge clock)
  begin : p_reg_ocd_instr_log


    if (reg_log)
    begin
      if (reg_write_log === 1'b1)
      begin
        $fdisplay(trv32p3_cnn.inst_reg_PC.log_file, "ocd_instr = %h", reg_val);
      end
    end
  end
  // synopsys translate_on

  always @ (*)
  begin : p_read_reg_ocd_instr

    // ocd_instr_pdcr_out = 32'h0;
    // ocd_instr_r_out = 32'h0;

    // (ocd_instr_pdcr_rd_ocd_instr, ocd_instr_r_rd_ocd_instr_alw)
    ocd_instr_pdcr_out = reg_val;
    // [ocd.n:65]
    ocd_instr_r_out = reg_val;

  end

  always @ (posedge clock or posedge reset)
  begin : p_write_reg_ocd_instr

    if (reset)
    begin
      // synopsys translate_off
      reg_write_log <= 1'b0;
      // synopsys translate_on
      reg_val <= 32'h0;
    end
    else
    begin
      // synopsys translate_off
      reg_write_log <= 1'b0;
      // synopsys translate_on

      // (ocd_instr_wr_ocd_instr_w___ocd_ld_PMbS3_r_S3_alw, ocd_instr_wr_ocd_instr_pdcw)
      if (__ocd_ld_PMbS3_r_in)
      begin
        // [ocd.n:89]
        // synopsys translate_off
        reg_write_log <= 1'b1;
        // synopsys translate_on
        reg_val <= ocd_instr_w_in;
      end
      if (en_ocd_instr_pdcw_in)
      begin
        // synopsys translate_off
        reg_write_log <= 1'b1;
        // synopsys translate_on
        reg_val <= ocd_instr_pdcw_in;
      end

    end
  end

endmodule