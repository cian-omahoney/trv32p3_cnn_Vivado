
// File generated by Go version U-2022.12#33f3808fcb#221128, Thu Jan 25 16:08:15 2024
// Copyright 2014-2022 Synopsys, Inc. All rights reserved.
// go -I../lib -F -DSYNTHESIS_NO_UNGROUP -D__tct_patch__=0 -Verilog -otrv32p3_cnn_vlog -cgo_options.cfg -Itrv32p3_cnn_vlog/tmp_pdg -updg -updg_controller trv32p3_cnn



`timescale 1ns/1ps

// module mux_jmp_tgt_ID : mux_jmp_tgt_ID
module mux_jmp_tgt_ID
  ( input                    ohe_selector_ID,
    input      signed [30:0] jmp_tgt_algn2_in, // t31s_rp1
    input      signed [31:0] pcaR_in, // w32
    output reg signed [31:0] jmp_tgt_ID_out // w32
  );


  always @ (*)

  begin : p_mux_jmp_tgt_ID

    // jmp_tgt_ID_out = 32'sh0;

    // (jmp_tgt_ID_copy0_jmp_tgt_algn2_ID)
    // [ctrl.n:201]
    jmp_tgt_ID_out = $signed({jmp_tgt_algn2_in, 1'b0});

    if (ohe_selector_ID) // (jmp_tgt_ID_copy0_pcaR_ID)
    begin
      // [ctrl.n:165]
      jmp_tgt_ID_out = pcaR_in;
    end

  end

endmodule