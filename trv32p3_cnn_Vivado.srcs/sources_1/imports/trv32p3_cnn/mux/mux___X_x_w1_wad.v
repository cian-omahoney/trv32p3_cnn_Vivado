
// File generated by Go version U-2022.12#33f3808fcb#221128, Thu Jan 25 16:08:15 2024
// Copyright 2014-2022 Synopsys, Inc. All rights reserved.
// go -I../lib -F -DSYNTHESIS_NO_UNGROUP -D__tct_patch__=0 -Verilog -otrv32p3_cnn_vlog -cgo_options.cfg -Itrv32p3_cnn_vlog/tmp_pdg -updg -updg_controller trv32p3_cnn



`timescale 1ns/1ps

// module mux___X_x_w1_wad : mux___X_x_w1_wad
module mux___X_x_w1_wad
  ( input            ohe_selector_EX,
    input            X_x_w1_div_main_pdg_en_in, // uint1_t
    input      [4:0] __CTt5u_cstP7_EX_in, // t5u
    input      [4:0] X_x_w1_div_main_pdg_w_a_in, // t5unz
    output reg [4:0] __X_x_w1_wad_out // t5u
  );


  always @ (*)

  begin : p_mux___X_x_w1_wad

    __X_x_w1_wad_out = 5'h0;

    // (__X_x_w1_wad_cp_X_x_w1_div_main_pdg_w_a_X_x_w1_div_main_pdg_en)
    if (X_x_w1_div_main_pdg_en_in)
    begin
      __X_x_w1_wad_out = X_x_w1_div_main_pdg_w_a_in;
    end

    if (ohe_selector_EX) // (__X_x_w1_wad_copy0___CTt5u_cstP7_EX)
    begin
      // [regX.n:99]
      __X_x_w1_wad_out = __CTt5u_cstP7_EX_in;
    end

  end

endmodule