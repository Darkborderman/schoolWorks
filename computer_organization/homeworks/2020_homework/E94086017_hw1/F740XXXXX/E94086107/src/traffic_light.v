module traffic_light (
    input  clk,
    input  rst,
    input  pass,
    output reg R,
    output reg G,
    output reg Y
);

//write your code here

//parameter
parameter Green1	=	3'd0;
parameter Non1		=	3'd1;
parameter Green2	=	3'd2;
parameter Non2		=	3'd3;
parameter Green3	=	3'd4;
parameter Yellow	=	3'd5;
parameter Red		=	3'd6;

//State Machine
reg [2:0] Q;
reg [2:0] Q_NEXT;

//reg declaration
reg [9:0] counter;

//FSM code
//current state
always@(posedge clk or posedge rst)begin
    if(rst)
        Q<=Green1;
    else if(pass)
            Q<=Green1;
    else 
        Q<=Q_NEXT;
end

//Next State
always@(*)begin
		case(Q)
			Green1: begin
				if(counter==1023) 
					Q_NEXT<=Non1;
				else 
					Q_NEXT<=Q;
			end
			Non1:	begin 
				if(counter==127) 
					Q_NEXT<=Green2;
				else 
					Q_NEXT<=Q;
			end
			Green2: begin
				if(counter==127) 
					Q_NEXT<=Non2;
				else 
					Q_NEXT<=Q;
			end
			Non2: 	begin
				if(counter==127) 
					Q_NEXT<=Green3;
				else 
					Q_NEXT<=Q;
			end
			Green3:	begin
				if(counter==127) 
					Q_NEXT<=Yellow;
				else 
					Q_NEXT<=Q;
			end
			Yellow: begin
				if(counter==511) 
					Q_NEXT<=Red;
				else 
					Q_NEXT<=Q;
			end
			Red:	begin
				if(counter==1023) 
					Q_NEXT<=Green1;
				else 
					Q_NEXT<=Q;
			end
			default:
				Q_NEXT<=Green1;
		endcase
end

//output reg
//R
always@(Q)begin
    case(Q)
		Green1:	
			R<=0;
		Non1: 	
			R<=0;
		Green2:	
			R<=0;
		Non2:	
			R<=0;
		Green3:
			R<=0;
		Yellow:	
			R<=0;
		Red:	
			R<=1;
		default:
			R<=0;
    endcase
end

//G
always@(Q)begin
	case(Q)
		Green1:	
			G<=1;
		Non1:	
			G<=0;
		Green2:	
			G<=1;
		Non2:	
			G<=0;
		Green3:	
			G<=1;
		Yellow:	
			G<=0;
		Red:	
			G<=0;
		default:
			G<=0;
	endcase
end

//Y
always@(Q)begin
	case(Q)
		Green1:	
			Y<=0;
		Non1:	
			Y<=0;
		Green2:	
			Y<=0;
		Non2:	
			Y<=0;
		Green3:	
			Y<=0;
		Yellow:	
			Y<=1;
		Red:	
			Y<=0;
		default:
			Y<=0;
	endcase
end

//counter
always@(posedge clk or posedge rst)begin
	if(rst)
		counter<=10'd0;
	else if(pass) begin
		if(Q==Green1)
			counter<=counter;
		else 
			counter<=10'd1;
		end
	else if(Q==Q_NEXT)
		counter<=counter+1;
	else
		counter<=0;
end


endmodule