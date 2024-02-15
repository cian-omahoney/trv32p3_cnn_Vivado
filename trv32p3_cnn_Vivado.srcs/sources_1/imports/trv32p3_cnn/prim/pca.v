
// File generated by Go version U-2022.12#33f3808fcb#221128, Thu Jan 25 16:08:15 2024
// Copyright 2014-2022 Synopsys, Inc. All rights reserved.
// go -I../lib -F -DSYNTHESIS_NO_UNGROUP -D__tct_patch__=0 -Verilog -otrv32p3_cnn_vlog -cgo_options.cfg -Itrv32p3_cnn_vlog/tmp_pdg -updg -updg_controller trv32p3_cnn



`timescale 1ns/1ps

// module pca : pca
module pca
  ( input                    ohe_selector_ID,
    input      signed [31:0] pcaA_in, // w32
    input      signed [31:0] pcaB_in, // w32
    output reg signed [31:0] pcaR_out // w32
  );


`include "primitives.v"

  always @ (*)

  begin : p_pca

    pcaR_out = 32'sh0;

    if (ohe_selector_ID) // (pcaR_add_pcaA_pcaB_pca_ID)
    begin
      // [ctrl.n:112][ctrl.n:163][ctrl.n:192]
      w32_add_w32_w32(pcaR_out, pcaA_in, pcaB_in);
    end

  end

endmodule