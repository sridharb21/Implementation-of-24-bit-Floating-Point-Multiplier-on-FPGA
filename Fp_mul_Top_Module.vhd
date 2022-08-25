--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--entity FP_mul is
--Port (a,b:in std_logic_vector(23 downto 0);
--        clk,rst,start:in std_logic;
--      exponent: out std_logic_vector(7 downto 0);
--      mantisa_mul:out std_logic_vector(31 downto 0);  
--      final_result:out std_logic_vector(24 downto 0);
--        Done,overflow:out std_logic);
--end FP_mul;
--architecture Behavioral of FP_mul is
--component Multiplier 
--port(mc,mr:in std_logic_vector(15 downto 0);
--    pro:out std_logic_vector(31 downto 0));
--end component;
--type statetype is(S0,S1,S2,S3);
--signal state:statetype;
--signal exp1,exp2:std_logic_vector(8 downto 0);
--signal exp3:std_logic_vector(8 downto 0);
--signal s_1,s_2,s_3,load,F_Norm,ready: std_logic;
--signal f_exp:std_logic_vector(7 downto 0);
--signal m1,m2,Fm:std_logic_vector(15 downto 0);
--signal D,p:std_logic_vector(31 downto 0);

--begin
-- M0:Multiplier port map(mc=>m1,mr=>m2,pro=>p);
--control:process(clk,rst)
--begin  
--    if(clk'event and clk='1') then
--        if(rst='1') then
--            state<=S0;
--            final_result<=(others=>'0');
--            load<='0';Done<='0';
--            F_Norm<='0';
--            overflow<='0';
--        else
--           case state is
--                when S0=>
--                    load<='0';Done<='0';
--                    F_Norm<='0';
--                    overflow<='0';
--                    if(start='1') then
--                        state<=S1; else state<=S0;
--                    end if; 
--                when S1=>
--                      load<='1';Done<='0';
--                    F_Norm<='0';
--                    overflow<='0'; 
--                        s_1<=a(23);s_2<=b(23);
--                        exp1<='0'& a(22 downto 15);
--                        exp2<='0' &b(22 downto 15);
                        
--                        m1<=  '1'& a(14 downto 0);
--                        m2<=  '1'& b(14 downto 0);
--                    state<=S2;
--                 when S2=>
--                        exp3<=exp1+ exp2-"001111111";
                        
--                        s_3<=s_1 xor s_2;
--                         if(p(31)='1') then
--                                D<=SHR(p,"01");
--                                 f_exp<=exp3(7 downto 0)+1;
--                                Fm<=D(29 downto 14); 
--                            else
--                                f_exp<=exp3(7 downto 0);
--                                Fm<=p(29 downto 14);
--                            end if;  
--                            load<='0';Done<='0';
--                            F_Norm<=p(31);
----                            overflow<=exp3(8);ready<='1';
--                            state<=S3;
----                          if(ready='1') then state<=S3;else state<=S2;
----                          end if;     
                            
--                   when S3=> 
--                            exponent<=f_exp;  
--                           mantisa_mul<=p; 
--                           final_result<=s_3&f_exp&Fm; 
--                            load<='0';
--                            F_Norm<=p(31);Done<='1';
--                            overflow<=exp3(8);
--                            if(start<='1') then state<=S0;
--                            else state<=S3;
--                            end if;
--                      when others=> 
--                              load<='0';Done<='0';
--                            F_Norm<='0';
--                            overflow<='0';
--                            state<=S0;      
                    
--            end case;              
--    end if;
--    end if;
    
--end process;

                           
--end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity FP_mul is
Port (a,b:in std_logic_vector(23 downto 0);
        clk,rst,start:in std_logic;
      exponent: out std_logic_vector(7 downto 0);
      mantisa_mul:out std_logic_vector(31 downto 0);  
      final_result:out std_logic_vector(24 downto 0);
        Done,overflow:out std_logic);
end FP_mul;
architecture Behavioral of FP_mul is
component Multiplier 
port(mc,mr:in std_logic_vector(15 downto 0);
    pro:out std_logic_vector(31 downto 0));
end component;
type statetype is(S0,S1,S2,S3);
signal state:statetype;
signal exp1,exp2:std_logic_vector(8 downto 0);
signal exp3:std_logic_vector(8 downto 0);
signal s_1,s_2,s_3,load,F_Norm,ready: std_logic;
signal f_exp:std_logic_vector(7 downto 0);
signal m1,m2,Fm:std_logic_vector(15 downto 0);
signal D,p:std_logic_vector(31 downto 0);

begin
 M0:Multiplier port map(mc=>m1,mr=>m2,pro=>p);
control:process(clk,rst)
begin  
    if(clk'event and clk='1') then
        if(rst='1') then
            state<=S0;
            final_result<=(others=>'0');
            load<='0';Done<='0';
            F_Norm<='0';
            overflow<='0';
        else
           case state is
                when S0=>
                    load<='0';Done<='0';
                    F_Norm<='0';
                    overflow<='0';
                    if(start='1') then
                        state<=S1; else state<=S0;
                    end if; 
                when S1=>
                      load<='1';Done<='0';
                    F_Norm<='0';
                    overflow<='0'; 
                        s_1<=a(23);s_2<=b(23);
                        exp1<='0'& a(22 downto 15);
                        exp2<='0' &b(22 downto 15);
                        
                        m1<=  '1'& a(14 downto 0);
                        m2<=  '1'& b(14 downto 0);
                    state<=S2;
                 when S2=>
                        exp3<=exp1+ exp2-"001111111";
                        
                        s_3<=s_1 xor s_2;
                         if(p(31)='1') then
                                D<=SHR(p,"01");
                                 f_exp<=exp3(7 downto 0)+1;
                                Fm<=D(29 downto 14); 
                            else
                                f_exp<=exp3(7 downto 0);
                                Fm<=p(29 downto 14);
                            end if;  
                            load<='0';Done<='0';
                            F_Norm<=p(31);
--                            overflow<=exp3(8);ready<='1';
                            state<=S3;
--                          if(ready='1') then state<=S3;else state<=S2;
--                          end if;     
                            
                   when S3=>  
                           exponent<=f_exp;  
                           mantisa_mul<=p;
                           final_result<=s_3&f_exp&Fm; 
                            load<='0';
                            F_Norm<=p(31);Done<='1';
                            overflow<=exp3(8);
                            if(start<='1') then state<=S0;
                            else state<=S3;
                            end if;
                      when others=> 
                              load<='0';Done<='0';
                            F_Norm<='0';
                            overflow<='0';
                            state<=S0;      
                    
            end case;              
    end if;
    end if;
end process;

end Behavioral;