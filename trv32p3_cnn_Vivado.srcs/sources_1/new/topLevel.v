`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2024 07:28:04 PM
// Design Name: 
// Module Name: topLevel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module topLevel(
    input   CLK100MHZ,
    input   RST_LOW,
    input   TMS,
    input   TDI,
    output  TDO,
    input   TCK,
    output  led0_b
);
    
wire reset_high = ~RST_LOW;

reg [24:0] count = 0;
assign led0_b  = count[24]; 
always @ (posedge(CLK100MHZ)) begin
    count <= count + 1;
    if(!RST_LOW)
        count <= {25{1'b0}};
end

wire [31:0] pm_rd         = {32{1'b0}};
wire [31:0] pm_addr       = {32{1'b0}};
wire [31:0] pm_wr;
wire pm_st;
wire pm_ld;

wire edm_ld;
wire [31:0] edm_addr;
wire [31:0] edm_rd        = 0;
wire [3:0] edm_st;
wire [31:0] edm_wr;

wire [15:0] dbg_instr;
wire [31:0] dbg_data_pi;
wire [31:0] dbg_data_po;
wire dbg_data_we;
wire dbg_instr_exec;
wire dbg_ext_break;
wire dbg_set_break;


trv32p3_cnn inst_trv32p3_cnn(
    .clock(CLK100MHZ),
    .reset_ext(reset_high),
    .pm_rd_in(pm_rd),
    .pm_addr_out(pm_addr),
    .pm_wr_out(pm_wr),
    .pm_st_out(pm_st),
    .pm_ld_out(pm_ld),
    .dbg_instr_in(dbg_instr),
    .dbg_data_pi_in(dbg_data_pi),
    .dbg_data_po_out(dbg_data_po),
    .dbg_data_we_in(dbg_data_we),
    .dbg_instr_exec_in(dbg_instr_exec),
    .dbg_ext_break_in(dbg_ext_break),
    .dbg_set_break_out(dbg_set_break),
    .edm_ld_out(edm_ld),
    .edm_addr_out(edm_addr),
    .edm_rd_in(edm_rd),
    .edm_st_out(edm_st),
    .edm_wr_out(edm_wr));
      
jtag_peripheral inst_jtag_peripheral(
    .reset(reset_high),
    .clock(CLK100MHZ),
    .jtag_tck(),
    .jtag_tdi(TDI),
    .jtag_tms(TMS),
    .jtag_tdo(TDO),
    .dbg_data_po(dbg_data_po),
    .dbg_data_pi(dbg_data_pi),
    .dbg_data_we(dbg_data_we),
    .dbg_instr(dbg_instr),
    .dbg_instr_exec(dbg_instr_exec)
);
 
endmodule