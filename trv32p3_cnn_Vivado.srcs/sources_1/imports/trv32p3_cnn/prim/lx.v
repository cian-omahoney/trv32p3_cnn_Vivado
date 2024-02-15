
// File generated by Go version U-2022.12#33f3808fcb#221128, Thu Jan 25 16:08:15 2024
// Copyright 2014-2022 Synopsys, Inc. All rights reserved.
// go -I../lib -F -DSYNTHESIS_NO_UNGROUP -D__tct_patch__=0 -Verilog -otrv32p3_cnn_vlog -cgo_options.cfg -Itrv32p3_cnn_vlog/tmp_pdg -updg -updg_controller trv32p3_cnn



`timescale 1ns/1ps

// module lx : lx
module lx
  ( input              [2:0] bin_selector_EX,
    input      signed [31:0] dmw_rd_dp_in, // w32
    input       signed [7:0] lxB_in, // w08
    input      signed [15:0] lxH_in, // w16
    output reg signed [31:0] lxR_out // w32
  );


`include "primitives.v"

  always @ (*)

  begin : p_lx

    lxR_out = 32'sh0;

    case (bin_selector_EX)
      3'b001 : // (lxR_copy0_dmw_rd_lx_EX)
      begin
        // [ldst.n:72]
        lxR_out = dmw_rd_dp_in;
      end
      3'b010 : // (lxR_sext_lxB_lx_EX)
      begin
        // [ldst.n:68]
        w32_sext_w08(lxR_out, lxB_in);
      end
      3'b011 : // (lxR_sext_lxH_lx_EX)
      begin
        // [ldst.n:70]
        w32_sext_w16(lxR_out, lxH_in);
      end
      3'b100 : // (lxR_zext_lxB_lx_EX)
      begin
        // [ldst.n:69]
        w32_zext_w08(lxR_out, lxB_in);
      end
      3'b101 : // (lxR_zext_lxH_lx_EX)
      begin
        // [ldst.n:71]
        w32_zext_w16(lxR_out, lxH_in);
      end
      default :
        ; // null
    endcase

  end

endmodule