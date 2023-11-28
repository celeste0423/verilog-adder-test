`timescale 1ns / 1ps

module adder(
    input CLK, //클럭
    input nRST, //리셋 신호
    input [7:0] a,
    input [7:0] b,
    output [8:0] c
    );
    
    reg [8:0] r_c; //해당 레지스터에는 덧셈 결과를 저장

    // 버튼을 누르면 1에서 0이 됨 => negedge에서 작동 : active-low
    //주로 reset버튼이 active-low로 주로 동작함
    always @(posedge CLK, negedge nRST) begin
        //nRST가 기본적으로 1, 눌렀을 때 0이 됨
        if(!nRST) begin
            r_c <= 'd0;
        end
        else begin
            r_c <= a + b;
        end
    end

    assign c=r_c;
endmodule
