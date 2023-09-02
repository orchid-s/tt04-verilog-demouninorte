`default_nettype none

module tt_um_uninorte #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset = ! rst_n;
    wire [6:0] display7segmentos;
    assign uo_out[6:0] = display7segmentos;
    assign uo_out[7] = 1'b0;

    // use bidirectionals as outputs
    assign uio_oe = 8'b00000000;

    wire feature_10 = ui_in[0];
    wire feature_13 = ui_in[1];
    wire feature_18 = ui_in[2];
    wire feature_19 = ui_in[3];
    wire feature_20 = ui_in[4];
    wire feature_21 = ui_in[5];
    wire feature_26 = ui_in[6];
    wire feature_27 = ui_in[7];
    wire feature_28 = uio_in[0];
    wire feature_34 = uio_in[1];
    wire feature_36 = uio_in[2];
    wire feature_42 = uio_in[3];
    wire feature_43 = uio_in[4];
    wire feature_45 = uio_in[5];
    wire feature_60 = uio_in[6];
    wire feature_61 = uio_in[7];

    always @(posedge clk) begin
        if (!feature_21) begin
            display7segmentos = 7'b0100100;
        end else begin  // if feature_42
        display7segmentos = 7'b1001100;
        end

    /*always @(posedge clk) begin
        if (!feature_21) begin
        if (!feature_34) begin
            if (!feature_36) begin
                if (!feature_20) begin
                    if (!feature_13) begin
                        if (!feature_45) begin
                            if (!feature_27) begin
                                if (!feature_42) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_42
                                    display7segmentos = 7'b1001100;
                                end
                            end else begin  // if feature_27
                                if (!feature_18) begin
                                    display7segmentos = 7'b0001111;
                                end else begin  // if feature_18
                                    display7segmentos = 7'b0100000;
                                end
                            end
                        end else begin  // if feature_45
                            if (!feature_19) begin
                                if (!feature_43) begin
                                    display7segmentos = 7'b1001100;
                                end else begin  // if feature_43
                                    if (!feature_42) begin
                                        display7segmentos = 7'b1001100;
                                    end else begin  // if feature_42
                                        display7segmentos = 7'b0100000;
                                    end
                                end
                            end else begin  // if feature_19
                                display7segmentos = 7'b1001100;
                            end
                        end
                    end else begin  // if feature_13
                        if (!feature_27) begin
                            if (!feature_28) begin
                                if (!feature_45) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_45
                                    display7segmentos = 7'b1001100;
                                end
                            end else begin  // if feature_28
                                if (!feature_60) begin
                                    display7segmentos = 7'b0000001;
                                end else begin  // if feature_60
                                    if (!feature_45) begin
                                        display7segmentos = 7'b0100100;
                                    end else begin  // if feature_45
                                        display7segmentos = 7'b0100000;
                                    end
                                end
                            end
                        end else begin  // if feature_27
                            if (!feature_42) begin
                                if (!feature_19) begin
                                    display7segmentos = 7'b0000110;
                                end else begin  // if feature_19
                                    if (!feature_28) begin
                                        if (!feature_61) begin
                                            if (!feature_60) begin
                                                display7segmentos = 7'b0100100;
                                            end else begin  // if feature_60
                                                if (!feature_18) begin
                                                    display7segmentos = 7'b0100100;
                                                end else begin  // if feature_18
                                                    if (!feature_45) begin
                                                        display7segmentos = 7'b0100100;
                                                    end else begin  // if feature_45
                                                        display7segmentos = 7'b0100100;
                                                    end
                                                end
                                            end
                                        end else begin  // if feature_61
                                            if (!feature_43) begin
                                                if (!feature_45) begin
                                                    display7segmentos = 7'b1001111;
                                                end else begin  // if feature_45
                                                    display7segmentos = 7'b1001100;
                                                end
                                            end else begin  // if feature_43
                                                display7segmentos = 7'b0100100;
                                            end
                                        end
                                    end else begin  // if feature_28
                                        display7segmentos = 7'b0100100;
                                    end
                                end
                            end else begin  // if feature_42
                                if (!feature_61) begin
                                    display7segmentos = 7'b0100000;
                                end else begin  // if feature_61
                                    display7segmentos = 7'b1001100;
                                end
                            end
                        end
                    end
                end else begin  // if feature_20
                    if (!feature_42) begin
                        if (!feature_45) begin
                            if (!feature_60) begin
                                if (!feature_13) begin
                                    display7segmentos = 7'b1001111;
                                end else begin  // if feature_13
                                    display7segmentos = 7'b0010010;
                                end
                            end else begin  // if feature_60
                                display7segmentos = 7'b1001111;
                            end
                        end else begin  // if feature_45
                            if (!feature_60) begin
                                display7segmentos = 7'b0100100;
                            end else begin  // if feature_60
                                if (!feature_10) begin
                                    display7segmentos = 7'b0100000;
                                end else begin  // if feature_10
                                    display7segmentos = 7'b1001100;
                                end
                            end
                        end
                    end else begin  // if feature_42
                        if (!feature_28) begin
                            if (!feature_60) begin
                                if (!feature_26) begin
                                    display7segmentos = 7'b0010010;
                                end else begin  // if feature_26
                                    if (!feature_45) begin
                                        if (!feature_13) begin
                                            display7segmentos = 7'b0100000;
                                        end else begin  // if feature_13
                                            if (!feature_27) begin
                                                display7segmentos = 7'b0100000;
                                            end else begin  // if feature_27
                                                display7segmentos = 7'b0100000;
                                            end
                                        end
                                    end else begin  // if feature_45
                                        if (!feature_13) begin
                                            display7segmentos = 7'b1001100;
                                        end else begin  // if feature_13
                                            display7segmentos = 7'b0100000;
                                        end
                                    end
                                end
                            end else begin  // if feature_60
                                if (!feature_10) begin
                                    if (!feature_43) begin
                                        display7segmentos = 7'b0100000;
                                    end else begin  // if feature_43
                                        display7segmentos = 7'b1111111;
                                    end
                                end else begin  // if feature_10
                                    if (!feature_27) begin
                                        display7segmentos = 7'b0100000;
                                    end else begin  // if feature_27
                                        if (!feature_43) begin
                                            if (!feature_19) begin
                                                display7segmentos = 7'b0100000;
                                            end else begin  // if feature_19
                                                if (!feature_13) begin
                                                    if (!feature_45) begin
                                                        display7segmentos = 7'b0100000;
                                                    end else begin  // if feature_45
                                                        display7segmentos = 7'b0100000;
                                                    end
                                                end else begin  // if feature_13
                                                    display7segmentos = 7'b0100000;
                                                end
                                            end
                                        end else begin  // if feature_43
                                            display7segmentos = 7'b0100000;
                                        end
                                    end
                                end
                            end
                        end else begin  // if feature_28
                            display7segmentos = 7'b0000001;
                        end
                    end
                end
            end else begin  // if feature_36
                if (!feature_13) begin
                    if (!feature_45) begin
                        if (!feature_42) begin
                            if (!feature_19) begin
                                display7segmentos = 7'b1001111;
                            end else begin  // if feature_19
                                if (!feature_20) begin
                                    if (!feature_10) begin
                                        display7segmentos = 7'b1001111;
                                    end else begin  // if feature_10
                                        if (!feature_18) begin
                                            display7segmentos = 7'b1001111;
                                        end else begin  // if feature_18
                                            display7segmentos = 7'b1111111;
                                        end
                                    end
                                end else begin  // if feature_20
                                    display7segmentos = 7'b1001111;
                                end
                            end
                        end else begin  // if feature_42
                            if (!feature_43) begin
                                display7segmentos = 7'b0100000;
                            end else begin  // if feature_43
                                if (!feature_27) begin
                                    display7segmentos = 7'b1001100;
                                end else begin  // if feature_27
                                    if (!feature_19) begin
                                        if (!feature_10) begin
                                            display7segmentos = 7'b1001111;
                                        end else begin  // if feature_10
                                            if (!feature_60) begin
                                                display7segmentos = 7'b1001111;
                                            end else begin  // if feature_60
                                                if (!feature_26) begin
                                                    display7segmentos = 7'b1001111;
                                                end else begin  // if feature_26
                                                    display7segmentos = 7'b1001111;
                                                end
                                            end
                                        end
                                    end else begin  // if feature_19
                                        display7segmentos = 7'b1001111;
                                    end
                                end
                            end
                        end
                    end else begin  // if feature_45
                        if (!feature_20) begin
                            if (!feature_18) begin
                                if (!feature_26) begin
                                    display7segmentos = 7'b0001111;
                                end else begin  // if feature_26
                                    display7segmentos = 7'b1001100;
                                end
                            end else begin  // if feature_18
                                display7segmentos = 7'b1001100;
                            end
                        end else begin  // if feature_20
                            if (!feature_42) begin
                                if (!feature_27) begin
                                    display7segmentos = 7'b0000110;
                                end else begin  // if feature_27
                                    if (!feature_26) begin
                                        display7segmentos = 7'b1001111;
                                    end else begin  // if feature_26
                                        display7segmentos = 7'b0000110;
                                    end
                                end
                            end else begin  // if feature_42
                                if (!feature_28) begin
                                    if (!feature_18) begin
                                        display7segmentos = 7'b1001111;
                                    end else begin  // if feature_18
                                        display7segmentos = 7'b0100000;
                                    end
                                end else begin  // if feature_28
                                    display7segmentos = 7'b0000110;
                                end
                            end
                        end
                    end
                end else begin  // if feature_13
                    if (!feature_45) begin
                        if (!feature_26) begin
                            if (!feature_18) begin
                                if (!feature_27) begin
                                    display7segmentos = 7'b0010010;
                                end else begin  // if feature_27
                                    display7segmentos = 7'b0001111;
                                end
                            end else begin  // if feature_18
                                if (!feature_61) begin
                                    if (!feature_20) begin
                                        if (!feature_42) begin
                                            display7segmentos = 7'b0010010;
                                        end else begin  // if feature_42
                                            display7segmentos = 7'b1111111;
                                        end
                                    end else begin  // if feature_20
                                        if (!feature_43) begin
                                            if (!feature_42) begin
                                                display7segmentos = 7'b0000110;
                                            end else begin  // if feature_42
                                                display7segmentos = 7'b0010010;
                                            end
                                        end else begin  // if feature_43
                                            if (!feature_28) begin
                                                display7segmentos = 7'b0010010;
                                            end else begin  // if feature_28
                                                if (!feature_10) begin
                                                    display7segmentos = 7'b0000110;
                                                end else begin  // if feature_10
                                                    display7segmentos = 7'b0010010;
                                                end
                                            end
                                        end
                                    end
                                end else begin  // if feature_61
                                    if (!feature_20) begin
                                        if (!feature_43) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_43
                                            if (!feature_42) begin
                                                display7segmentos = 7'b0010010;
                                            end else begin  // if feature_42
                                                if (!feature_19) begin
                                                    display7segmentos = 7'b0010010;
                                                end else begin  // if feature_19
                                                    if (!feature_27) begin
                                                        display7segmentos = 7'b0010010;
                                                    end else begin  // if feature_27
                                                        display7segmentos = 7'b0010010;
                                                    end
                                                end
                                            end
                                        end
                                    end else begin  // if feature_20
                                        display7segmentos = 7'b0010010;
                                    end
                                end
                            end
                        end else begin  // if feature_26
                            if (!feature_27) begin
                                display7segmentos = 7'b0010010;
                            end else begin  // if feature_27
                                if (!feature_10) begin
                                    if (!feature_43) begin
                                        display7segmentos = 7'b0010010;
                                    end else begin  // if feature_43
                                        if (!feature_20) begin
                                            if (!feature_42) begin
                                                if (!feature_28) begin
                                                    display7segmentos = 7'b1001111;
                                                end else begin  // if feature_28
                                                    display7segmentos = 7'b1001111;
                                                end
                                            end else begin  // if feature_42
                                                display7segmentos = 7'b1111111;
                                            end
                                        end else begin  // if feature_20
                                            display7segmentos = 7'b1111111;
                                        end
                                    end
                                end else begin  // if feature_10
                                    if (!feature_61) begin
                                        if (!feature_20) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_20
                                            display7segmentos = 7'b0000110;
                                        end
                                    end else begin  // if feature_61
                                        if (!feature_19) begin
                                            display7segmentos = 7'b0001111;
                                        end else begin  // if feature_19
                                            display7segmentos = 7'b1001111;
                                        end
                                    end
                                end
                            end
                        end
                    end else begin  // if feature_45
                        if (!feature_61) begin
                            if (!feature_10) begin
                                if (!feature_60) begin
                                    if (!feature_26) begin
                                        if (!feature_28) begin
                                            if (!feature_20) begin
                                                display7segmentos = 7'b0000110;
                                            end else begin  // if feature_20
                                                display7segmentos = 7'b1111111;
                                            end
                                        end else begin  // if feature_28
                                            display7segmentos = 7'b0000110;
                                        end
                                    end else begin  // if feature_26
                                        if (!feature_19) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_19
                                            display7segmentos = 7'b0100100;
                                        end
                                    end
                                end else begin  // if feature_60
                                    if (!feature_18) begin
                                        display7segmentos = 7'b0010010;
                                    end else begin  // if feature_18
                                        if (!feature_26) begin
                                            display7segmentos = 7'b0000110;
                                        end else begin  // if feature_26
                                            if (!feature_19) begin
                                                display7segmentos = 7'b0000110;
                                            end else begin  // if feature_19
                                                display7segmentos = 7'b0000110;
                                            end
                                        end
                                    end
                                end
                            end else begin  // if feature_10
                                if (!feature_42) begin
                                    display7segmentos = 7'b0000110;
                                end else begin  // if feature_42
                                    display7segmentos = 7'b1111111;
                                end
                            end
                        end else begin  // if feature_61
                            if (!feature_19) begin
                                display7segmentos = 7'b0001111;
                            end else begin  // if feature_19
                                if (!feature_43) begin
                                    display7segmentos = 7'b1111111;
                                end else begin  // if feature_43
                                    display7segmentos = 7'b1001100;
                                end
                            end
                        end
                    end
                end
            end
        end else begin  // if feature_34
            if (!feature_36) begin
                if (!feature_42) begin
                    if (!feature_13) begin
                        if (!feature_10) begin
                            display7segmentos = 7'b0001111;
                        end else begin  // if feature_10
                            if (!feature_18) begin
                                display7segmentos = 7'b0001111;
                            end else begin  // if feature_18
                                display7segmentos = 7'b0100100;
                            end
                        end
                    end else begin  // if feature_13
                        if (!feature_27) begin
                            if (!feature_10) begin
                                if (!feature_61) begin
                                    if (!feature_60) begin
                                        display7segmentos = 7'b0000001;
                                    end else begin  // if feature_60
                                        display7segmentos = 7'b0001111;
                                    end
                                end else begin  // if feature_61
                                    display7segmentos = 7'b0100100;
                                end
                            end else begin  // if feature_10
                                display7segmentos = 7'b0100100;
                            end
                        end else begin  // if feature_27
                            if (!feature_61) begin
                                display7segmentos = 7'b0100100;
                            end else begin  // if feature_61
                                if (!feature_45) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_45
                                    display7segmentos = 7'b1111111;
                                end
                            end
                        end
                    end
                end else begin  // if feature_42
                    if (!feature_13) begin
                        if (!feature_26) begin
                            display7segmentos = 7'b0001111;
                        end else begin  // if feature_26
                            if (!feature_61) begin
                                display7segmentos = 7'b0100000;
                            end else begin  // if feature_61
                                if (!feature_60) begin
                                    display7segmentos = 7'b1001100;
                                end else begin  // if feature_60
                                    if (!feature_27) begin
                                        display7segmentos = 7'b1001100;
                                    end else begin  // if feature_27
                                        display7segmentos = 7'b1001100;
                                    end
                                end
                            end
                        end
                    end else begin  // if feature_13
                        if (!feature_60) begin
                            if (!feature_61) begin
                                if (!feature_28) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_28
                                    display7segmentos = 7'b0000001;
                                end
                            end else begin  // if feature_61
                                if (!feature_20) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_20
                                    display7segmentos = 7'b0100000;
                                end
                            end
                        end else begin  // if feature_60
                            if (!feature_43) begin
                                if (!feature_45) begin
                                    display7segmentos = 7'b0100000;
                                end else begin  // if feature_45
                                    if (!feature_19) begin
                                        display7segmentos = 7'b0100000;
                                    end else begin  // if feature_19
                                        if (!feature_20) begin
                                            display7segmentos = 7'b0100000;
                                        end else begin  // if feature_20
                                            display7segmentos = 7'b0100100;
                                        end
                                    end
                                end
                            end else begin  // if feature_43
                                if (!feature_18) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_18
                                    display7segmentos = 7'b0100100;
                                end
                            end
                        end
                    end
                end
            end else begin  // if feature_36
                if (!feature_61) begin
                    if (!feature_26) begin
                        if (!feature_42) begin
                            display7segmentos = 7'b0000110;
                        end else begin  // if feature_42
                            display7segmentos = 7'b1111111;
                        end
                    end else begin  // if feature_26
                        if (!feature_45) begin
                            if (!feature_60) begin
                                display7segmentos = 7'b1111111;
                            end else begin  // if feature_60
                                display7segmentos = 7'b0000110;
                            end
                        end else begin  // if feature_45
                            display7segmentos = 7'b0100100;
                        end
                    end
                end else begin  // if feature_61
                    if (!feature_26) begin
                        if (!feature_20) begin
                            display7segmentos = 7'b0001111;
                        end else begin  // if feature_20
                            if (!feature_45) begin
                                display7segmentos = 7'b1001111;
                            end else begin  // if feature_45
                                display7segmentos = 7'b1001100;
                            end
                        end
                    end else begin  // if feature_26
                        if (!feature_45) begin
                            if (!feature_43) begin
                                if (!feature_28) begin
                                    display7segmentos = 7'b0100000;
                                end else begin  // if feature_28
                                    display7segmentos = 7'b1111111;
                                end
                            end else begin  // if feature_43
                                if (!feature_18) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_18
                                    display7segmentos = 7'b1001111;
                                end
                            end
                        end else begin  // if feature_45
                            if (!feature_28) begin
                                display7segmentos = 7'b1001100;
                            end else begin  // if feature_28
                                display7segmentos = 7'b1111111;
                            end
                        end
                    end
                end
            end
        end
    end else begin  // if feature_21
        if (!feature_43) begin
            if (!feature_60) begin
                if (!feature_42) begin
                    if (!feature_13) begin
                        if (!feature_36) begin
                            display7segmentos = 7'b0010010;
                        end else begin  // if feature_36
                            display7segmentos = 7'b1001111;
                        end
                    end else begin  // if feature_13
                        if (!feature_36) begin
                            if (!feature_45) begin
                                display7segmentos = 7'b0000001;
                            end else begin  // if feature_45
                                if (!feature_28) begin
                                    display7segmentos = 7'b1111111;
                                end else begin  // if feature_28
                                    display7segmentos = 7'b0010010;
                                end
                            end
                        end else begin  // if feature_36
                            if (!feature_19) begin
                                display7segmentos = 7'b0000110;
                            end else begin  // if feature_19
                                display7segmentos = 7'b1111111;
                            end
                        end
                    end
                end else begin  // if feature_42
                    if (!feature_36) begin
                        if (!feature_19) begin
                            if (!feature_61) begin
                                display7segmentos = 7'b0000001;
                            end else begin  // if feature_61
                                display7segmentos = 7'b0010010;
                            end
                        end else begin  // if feature_19
                            display7segmentos = 7'b0000001;
                        end
                    end else begin  // if feature_36
                        if (!feature_34) begin
                            if (!feature_10) begin
                                display7segmentos = 7'b1111111;
                            end else begin  // if feature_10
                                display7segmentos = 7'b0000001;
                            end
                        end else begin  // if feature_34
                            display7segmentos = 7'b1111111;
                        end
                    end
                end
            end else begin  // if feature_60
                if (!feature_18) begin
                    if (!feature_34) begin
                        if (!feature_28) begin
                            display7segmentos = 7'b1001100;
                        end else begin  // if feature_28
                            if (!feature_36) begin
                                display7segmentos = 7'b0001111;
                            end else begin  // if feature_36
                                display7segmentos = 7'b0100100;
                            end
                        end
                    end else begin  // if feature_34
                        display7segmentos = 7'b0001111;
                    end
                end else begin  // if feature_18
                    if (!feature_26) begin
                        if (!feature_27) begin
                            if (!feature_20) begin
                                display7segmentos = 7'b0001111;
                            end else begin  // if feature_20
                                display7segmentos = 7'b0010010;
                            end
                        end else begin  // if feature_27
                            if (!feature_45) begin
                                display7segmentos = 7'b0000110;
                            end else begin  // if feature_45
                                display7segmentos = 7'b1111111;
                            end
                        end
                    end else begin  // if feature_26
                        if (!feature_13) begin
                            if (!feature_10) begin
                                display7segmentos = 7'b1111111;
                            end else begin  // if feature_10
                                if (!feature_45) begin
                                    display7segmentos = 7'b0100000;
                                end else begin  // if feature_45
                                    display7segmentos = 7'b1001100;
                                end
                            end
                        end else begin  // if feature_13
                            if (!feature_20) begin
                                if (!feature_28) begin
                                    display7segmentos = 7'b1111111;
                                end else begin  // if feature_28
                                    if (!feature_34) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_34
                                        display7segmentos = 7'b0001111;
                                    end
                                end
                            end else begin  // if feature_20
                                display7segmentos = 7'b1111111;
                            end
                        end
                    end
                end
            end
        end else begin  // if feature_43
            if (!feature_18) begin
                if (!feature_19) begin
                    if (!feature_20) begin
                        if (!feature_61) begin
                            if (!feature_36) begin
                                if (!feature_26) begin
                                    if (!feature_27) begin
                                        if (!feature_10) begin
                                            display7segmentos = 7'b0001111;
                                        end else begin  // if feature_10
                                            display7segmentos = 7'b0001111;
                                        end
                                    end else begin  // if feature_27
                                        display7segmentos = 7'b0001111;
                                    end
                                end else begin  // if feature_26
                                    if (!feature_34) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_34
                                        display7segmentos = 7'b0001111;
                                    end
                                end
                            end else begin  // if feature_36
                                if (!feature_60) begin
                                    display7segmentos = 7'b1111111;
                                end else begin  // if feature_60
                                    display7segmentos = 7'b0000110;
                                end
                            end
                        end else begin  // if feature_61
                            if (!feature_45) begin
                                if (!feature_42) begin
                                    if (!feature_26) begin
                                        if (!feature_10) begin
                                            if (!feature_36) begin
                                                display7segmentos = 7'b0001111;
                                            end else begin  // if feature_36
                                                display7segmentos = 7'b0000110;
                                            end
                                        end else begin  // if feature_10
                                            if (!feature_13) begin
                                                display7segmentos = 7'b0000110;
                                            end else begin  // if feature_13
                                                display7segmentos = 7'b0001111;
                                            end
                                        end
                                    end else begin  // if feature_26
                                        display7segmentos = 7'b0001111;
                                    end
                                end else begin  // if feature_42
                                    if (!feature_34) begin
                                        if (!feature_27) begin
                                            display7segmentos = 7'b0010010;
                                        end else begin  // if feature_27
                                            display7segmentos = 7'b0001111;
                                        end
                                    end else begin  // if feature_34
                                        display7segmentos = 7'b1001111;
                                    end
                                end
                            end else begin  // if feature_45
                                display7segmentos = 7'b0001111;
                            end
                        end
                    end else begin  // if feature_20
                        display7segmentos = 7'b1001111;
                    end
                end else begin  // if feature_19
                    if (!feature_27) begin
                        if (!feature_34) begin
                            if (!feature_42) begin
                                if (!feature_36) begin
                                    display7segmentos = 7'b1111111;
                                end else begin  // if feature_36
                                    display7segmentos = 7'b0010010;
                                end
                            end else begin  // if feature_42
                                if (!feature_10) begin
                                    if (!feature_13) begin
                                        display7segmentos = 7'b1001100;
                                    end else begin  // if feature_13
                                        display7segmentos = 7'b0001111;
                                    end
                                end else begin  // if feature_10
                                    display7segmentos = 7'b1001100;
                                end
                            end
                        end else begin  // if feature_34
                            if (!feature_60) begin
                                display7segmentos = 7'b1111111;
                            end else begin  // if feature_60
                                if (!feature_61) begin
                                    if (!feature_45) begin
                                        display7segmentos = 7'b0000110;
                                    end else begin  // if feature_45
                                        display7segmentos = 7'b0001111;
                                    end
                                end else begin  // if feature_61
                                    if (!feature_26) begin
                                        display7segmentos = 7'b0001111;
                                    end else begin  // if feature_26
                                        if (!feature_36) begin
                                            display7segmentos = 7'b0001111;
                                        end else begin  // if feature_36
                                            display7segmentos = 7'b1001100;
                                        end
                                    end
                                end
                            end
                        end
                    end else begin  // if feature_27
                        if (!feature_61) begin
                            if (!feature_10) begin
                                display7segmentos = 7'b1111111;
                            end else begin  // if feature_10
                                if (!feature_28) begin
                                    display7segmentos = 7'b0100100;
                                end else begin  // if feature_28
                                    if (!feature_45) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_45
                                        if (!feature_13) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_13
                                            display7segmentos = 7'b0001111;
                                        end
                                    end
                                end
                            end
                        end else begin  // if feature_61
                            if (!feature_34) begin
                                if (!feature_60) begin
                                    display7segmentos = 7'b0001111;
                                end else begin  // if feature_60
                                    if (!feature_26) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_26
                                        if (!feature_28) begin
                                            display7segmentos = 7'b1001100;
                                        end else begin  // if feature_28
                                            if (!feature_10) begin
                                                display7segmentos = 7'b1001100;
                                            end else begin  // if feature_10
                                                display7segmentos = 7'b1001100;
                                            end
                                        end
                                    end
                                end
                            end else begin  // if feature_34
                                if (!feature_10) begin
                                    display7segmentos = 7'b1111111;
                                end else begin  // if feature_10
                                    if (!feature_60) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_60
                                        if (!feature_36) begin
                                            display7segmentos = 7'b0001111;
                                        end else begin  // if feature_36
                                            display7segmentos = 7'b1001111;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end else begin  // if feature_18
                if (!feature_19) begin
                    if (!feature_13) begin
                        if (!feature_27) begin
                            if (!feature_61) begin
                                if (!feature_28) begin
                                    display7segmentos = 7'b1111111;
                                end else begin  // if feature_28
                                    if (!feature_45) begin
                                        if (!feature_42) begin
                                            display7segmentos = 7'b0000110;
                                        end else begin  // if feature_42
                                            display7segmentos = 7'b1111111;
                                        end
                                    end else begin  // if feature_45
                                        if (!feature_36) begin
                                            if (!feature_42) begin
                                                display7segmentos = 7'b0010010;
                                            end else begin  // if feature_42
                                                display7segmentos = 7'b0000110;
                                            end
                                        end else begin  // if feature_36
                                            display7segmentos = 7'b0000110;
                                        end
                                    end
                                end
                            end else begin  // if feature_61
                                if (!feature_26) begin
                                    if (!feature_42) begin
                                        display7segmentos = 7'b1001111;
                                    end else begin  // if feature_42
                                        display7segmentos = 7'b0010010;
                                    end
                                end else begin  // if feature_26
                                    display7segmentos = 7'b1001100;
                                end
                            end
                        end else begin  // if feature_27
                            if (!feature_36) begin
                                if (!feature_20) begin
                                    if (!feature_42) begin
                                        display7segmentos = 7'b0001111;
                                    end else begin  // if feature_42
                                        display7segmentos = 7'b1111111;
                                    end
                                end else begin  // if feature_20
                                    if (!feature_45) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_45
                                        if (!feature_34) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_34
                                            display7segmentos = 7'b0000110;
                                        end
                                    end
                                end
                            end else begin  // if feature_36
                                if (!feature_60) begin
                                    if (!feature_42) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_42
                                        display7segmentos = 7'b0000110;
                                    end
                                end else begin  // if feature_60
                                    if (!feature_34) begin
                                        if (!feature_26) begin
                                            if (!feature_61) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_61
                                                if (!feature_10) begin
                                                    if (!feature_28) begin
                                                        display7segmentos = 7'b1001111;
                                                    end else begin  // if feature_28
                                                        display7segmentos = 7'b1001111;
                                                    end
                                                end else begin  // if feature_10
                                                    if (!feature_20) begin
                                                        display7segmentos = 7'b1001111;
                                                    end else begin  // if feature_20
                                                        display7segmentos = 7'b1001111;
                                                    end
                                                end
                                            end
                                        end else begin  // if feature_26
                                            if (!feature_42) begin
                                                if (!feature_28) begin
                                                    display7segmentos = 7'b1001100;
                                                end else begin  // if feature_28
                                                    display7segmentos = 7'b1001111;
                                                end
                                            end else begin  // if feature_42
                                                if (!feature_61) begin
                                                    display7segmentos = 7'b1111111;
                                                end else begin  // if feature_61
                                                    display7segmentos = 7'b1001100;
                                                end
                                            end
                                        end
                                    end else begin  // if feature_34
                                        if (!feature_45) begin
                                            if (!feature_20) begin
                                                if (!feature_42) begin
                                                    if (!feature_10) begin
                                                        display7segmentos = 7'b1001111;
                                                    end else begin  // if feature_10
                                                        display7segmentos = 7'b0000110;
                                                    end
                                                end else begin  // if feature_42
                                                    display7segmentos = 7'b1001111;
                                                end
                                            end else begin  // if feature_20
                                                if (!feature_42) begin
                                                    display7segmentos = 7'b0000110;
                                                end else begin  // if feature_42
                                                    if (!feature_61) begin
                                                        display7segmentos = 7'b1111111;
                                                    end else begin  // if feature_61
                                                        display7segmentos = 7'b1001111;
                                                    end
                                                end
                                            end
                                        end else begin  // if feature_45
                                            display7segmentos = 7'b1001111;
                                        end
                                    end
                                end
                            end
                        end
                    end else begin  // if feature_13
                        if (!feature_26) begin
                            if (!feature_61) begin
                                if (!feature_42) begin
                                    if (!feature_60) begin
                                        if (!feature_28) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_28
                                            if (!feature_45) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_45
                                                if (!feature_27) begin
                                                    if (!feature_34) begin
                                                        display7segmentos = 7'b1111111;
                                                    end else begin  // if feature_34
                                                        display7segmentos = 7'b0000110;
                                                    end
                                                end else begin  // if feature_27
                                                    display7segmentos = 7'b0000110;
                                                end
                                            end
                                        end
                                    end else begin  // if feature_60
                                        if (!feature_28) begin
                                            if (!feature_45) begin
                                                display7segmentos = 7'b0010010;
                                            end else begin  // if feature_45
                                                display7segmentos = 7'b0000110;
                                            end
                                        end else begin  // if feature_28
                                            display7segmentos = 7'b0000110;
                                        end
                                    end
                                end else begin  // if feature_42
                                    if (!feature_27) begin
                                        display7segmentos = 7'b0000110;
                                    end else begin  // if feature_27
                                        if (!feature_45) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_45
                                            if (!feature_10) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_10
                                                if (!feature_20) begin
                                                    display7segmentos = 7'b0000110;
                                                end else begin  // if feature_20
                                                    display7segmentos = 7'b1111111;
                                                end
                                            end
                                        end
                                    end
                                end
                            end else begin  // if feature_61
                                if (!feature_27) begin
                                    if (!feature_20) begin
                                        if (!feature_36) begin
                                            display7segmentos = 7'b0000110;
                                        end else begin  // if feature_36
                                            display7segmentos = 7'b0010010;
                                        end
                                    end else begin  // if feature_20
                                        display7segmentos = 7'b0010010;
                                    end
                                end else begin  // if feature_27
                                    if (!feature_34) begin
                                        if (!feature_60) begin
                                            display7segmentos = 7'b0010010;
                                        end else begin  // if feature_60
                                            if (!feature_28) begin
                                                if (!feature_20) begin
                                                    display7segmentos = 7'b1111111;
                                                end else begin  // if feature_20
                                                    display7segmentos = 7'b0010010;
                                                end
                                            end else begin  // if feature_28
                                                display7segmentos = 7'b1111111;
                                            end
                                        end
                                    end else begin  // if feature_34
                                        display7segmentos = 7'b0000110;
                                    end
                                end
                            end
                        end else begin  // if feature_26
                            display7segmentos = 7'b1111111;
                        end
                    end
                end else begin  // if feature_19
                    if (!feature_27) begin
                        if (!feature_26) begin
                            if (!feature_61) begin
                                if (!feature_13) begin
                                    display7segmentos = 7'b1001111;
                                end else begin  // if feature_13
                                    if (!feature_10) begin
                                        if (!feature_28) begin
                                            display7segmentos = 7'b0010010;
                                        end else begin  // if feature_28
                                            if (!feature_42) begin
                                                if (!feature_36) begin
                                                    display7segmentos = 7'b0000110;
                                                end else begin  // if feature_36
                                                    if (!feature_34) begin
                                                        display7segmentos = 7'b0000110;
                                                    end else begin  // if feature_34
                                                        display7segmentos = 7'b0000110;
                                                    end
                                                end
                                            end else begin  // if feature_42
                                                display7segmentos = 7'b0100100;
                                            end
                                        end
                                    end else begin  // if feature_10
                                        if (!feature_42) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_42
                                            display7segmentos = 7'b0001111;
                                        end
                                    end
                                end
                            end else begin  // if feature_61
                                if (!feature_10) begin
                                    if (!feature_20) begin
                                        if (!feature_34) begin
                                            display7segmentos = 7'b0010010;
                                        end else begin  // if feature_34
                                            if (!feature_42) begin
                                                display7segmentos = 7'b1001111;
                                            end else begin  // if feature_42
                                                display7segmentos = 7'b0010010;
                                            end
                                        end
                                    end else begin  // if feature_20
                                        display7segmentos = 7'b0010010;
                                    end
                                end else begin  // if feature_10
                                    if (!feature_20) begin
                                        display7segmentos = 7'b0001111;
                                    end else begin  // if feature_20
                                        display7segmentos = 7'b0010010;
                                    end
                                end
                            end
                        end else begin  // if feature_26
                            if (!feature_13) begin
                                if (!feature_20) begin
                                    display7segmentos = 7'b1001100;
                                end else begin  // if feature_20
                                    if (!feature_34) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_34
                                        display7segmentos = 7'b1001111;
                                    end
                                end
                            end else begin  // if feature_13
                                if (!feature_28) begin
                                    if (!feature_45) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_45
                                        display7segmentos = 7'b1001100;
                                    end
                                end else begin  // if feature_28
                                    if (!feature_45) begin
                                        if (!feature_42) begin
                                            if (!feature_20) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_20
                                                if (!feature_61) begin
                                                    if (!feature_36) begin
                                                        display7segmentos = 7'b0010010;
                                                    end else begin  // if feature_36
                                                        display7segmentos = 7'b0000110;
                                                    end
                                                end else begin  // if feature_61
                                                    display7segmentos = 7'b0010010;
                                                end
                                            end
                                        end else begin  // if feature_42
                                            display7segmentos = 7'b1111111;
                                        end
                                    end else begin  // if feature_45
                                        display7segmentos = 7'b1111111;
                                    end
                                end
                            end
                        end
                    end else begin  // if feature_27
                        if (!feature_13) begin
                            if (!feature_36) begin
                                if (!feature_34) begin
                                    display7segmentos = 7'b1001100;
                                end else begin  // if feature_34
                                    display7segmentos = 7'b1111111;
                                end
                            end else begin  // if feature_36
                                if (!feature_60) begin
                                    if (!feature_20) begin
                                        display7segmentos = 7'b1111111;
                                    end else begin  // if feature_20
                                        if (!feature_34) begin
                                            display7segmentos = 7'b1111111;
                                        end else begin  // if feature_34
                                            display7segmentos = 7'b1001111;
                                        end
                                    end
                                end else begin  // if feature_60
                                    if (!feature_34) begin
                                        if (!feature_20) begin
                                            if (!feature_42) begin
                                                if (!feature_28) begin
                                                    display7segmentos = 7'b1001100;
                                                end else begin  // if feature_28
                                                    display7segmentos = 7'b1001111;
                                                end
                                            end else begin  // if feature_42
                                                display7segmentos = 7'b1001111;
                                            end
                                        end else begin  // if feature_20
                                            display7segmentos = 7'b1111111;
                                        end
                                    end else begin  // if feature_34
                                        if (!feature_45) begin
                                            display7segmentos = 7'b1001111;
                                        end else begin  // if feature_45
                                            if (!feature_61) begin
                                                display7segmentos = 7'b1001111;
                                            end else begin  // if feature_61
                                                display7segmentos = 7'b1001111;
                                            end
                                        end
                                    end
                                end
                            end
                        end else begin  // if feature_13
                            if (!feature_36) begin
                                display7segmentos = 7'b1111111;
                            end else begin  // if feature_36
                                if (!feature_61) begin
                                    if (!feature_34) begin
                                        if (!feature_60) begin
                                            if (!feature_26) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_26
                                                if (!feature_20) begin
                                                    display7segmentos = 7'b1111111;
                                                end else begin  // if feature_20
                                                    if (!feature_42) begin
                                                        display7segmentos = 7'b1111111;
                                                    end else begin  // if feature_42
                                                        display7segmentos = 7'b1111111;
                                                    end
                                                end
                                            end
                                        end else begin  // if feature_60
                                            if (!feature_20) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_20
                                                if (!feature_10) begin
                                                    if (!feature_26) begin
                                                        display7segmentos = 7'b1111111;
                                                    end else begin  // if feature_26
                                                        display7segmentos = 7'b1111111;
                                                    end
                                                end else begin  // if feature_10
                                                    display7segmentos = 7'b1111111;
                                                end
                                            end
                                        end
                                    end else begin  // if feature_34
                                        if (!feature_60) begin
                                            if (!feature_10) begin
                                                if (!feature_20) begin
                                                    if (!feature_26) begin
                                                        display7segmentos = 7'b0000110;
                                                    end else begin  // if feature_26
                                                        display7segmentos = 7'b1111111;
                                                    end
                                                end else begin  // if feature_20
                                                    display7segmentos = 7'b1111111;
                                                end
                                            end else begin  // if feature_10
                                                display7segmentos = 7'b0100100;
                                            end
                                        end else begin  // if feature_60
                                            if (!feature_45) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_45
                                                if (!feature_26) begin
                                                    if (!feature_42) begin
                                                        display7segmentos = 7'b0000110;
                                                    end else begin  // if feature_42
                                                        display7segmentos = 7'b1111111;
                                                    end
                                                end else begin  // if feature_26
                                                    display7segmentos = 7'b1111111;
                                                end
                                            end
                                        end
                                    end
                                end else begin  // if feature_61
                                    if (!feature_45) begin
                                        if (!feature_26) begin
                                            if (!feature_60) begin
                                                display7segmentos = 7'b0010010;
                                            end else begin  // if feature_60
                                                display7segmentos = 7'b1111111;
                                            end
                                        end else begin  // if feature_26
                                            if (!feature_60) begin
                                                display7segmentos = 7'b1111111;
                                            end else begin  // if feature_60
                                                if (!feature_10) begin
                                                    if (!feature_20) begin
                                                        display7segmentos = 7'b1111111;
                                                    end else begin  // if feature_20
                                                        display7segmentos = 7'b1111111;
                                                    end
                                                end else begin  // if feature_10
                                                    if (!feature_28) begin
                                                        display7segmentos = 7'b1111111;
                                                    end else begin  // if feature_28
                                                        display7segmentos = 7'b1111111;
                                                    end
                                                end
                                            end
                                        end
                                    end else begin  // if feature_45
                                        if (!feature_10) begin
                                            if (!feature_26) begin
                                                display7segmentos = 7'b1001111;
                                            end else begin  // if feature_26
                                                display7segmentos = 7'b1111111;
                                            end
                                        end else begin  // if feature_10
                                            display7segmentos = 7'b1001111;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end*/

endmodule
