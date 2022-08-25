library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity Test_bench is
--  Port ( );
end Test_bench;
architecture Behavioral of Test_bench is
component FP_mul 
Port (a,b:in std_logic_vector(23 downto 0);
        clk,rst,start:in std_logic;
      exponent: out std_logic_vector(7 downto 0);
      mantisa_mul:out std_logic_vector(31 downto 0);  
      final_result:out std_logic_vector(24 downto 0);
        Done,overflow:out std_logic);
end component;
signal a,b : std_logic_vector(23 downto 0);
signal final_result: std_logic_vector(24 downto 0);
signal exponent:std_logic_vector(7 downto 0);
signal mantisa_mul:std_logic_vector(31 downto 0);
signal clk,rst,start,Done,overflow:std_logic;
constant period: time:=15 ns;
begin
uut:FP_mul port map(a=>a,b=>b,clk=>clk,start=>start,
        rst=>rst,final_result=>final_result,
        exponent=>exponent,
        mantisa_mul=>mantisa_mul,Done=>Done,overflow=>overflow);
process
begin
    cloop:loop
        clk<='0';
            wait for (period/2);
        clk<='1';
            wait for (period/2);
    end loop;
 end process;
 stimulus : process
        begin
            wait for 100 ns;
            rst<='1'; wait for 10 ns;
            rst<='0';
            start<='1';  a<=x"42fa40";b<=x"414100";
                 wait for 100ns;
                start<='0';wait for 300ns;
                 start<='1'; a<=x"FA0008";b<=x"F28000"; 
                 wait for 100ns;
                start<='0';
--                wait for 300ns;
--                 start<='1';   
--                wait for 100ns;
--                start<='0';
wait ;
end process;
end Behavioral;