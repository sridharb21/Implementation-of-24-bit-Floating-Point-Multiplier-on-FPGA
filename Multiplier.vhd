----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2021 22:39:37
-- Design Name: 
-- Module Name: Multiplier - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity Multiplier is
Port (mc,mr:in std_logic_vector(15 downto 0);
pro:out std_logic_vector(31 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

begin
process(mc,mr)
begin
pro<=mc*mr;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity Multiplier is
Port (mc,mr:in std_logic_vector(15 downto 0);
pro:out std_logic_vector(31 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

begin
process(mc,mr)
begin
pro<=mc*mr;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity Multiplier is
Port (mc,mr:in std_logic_vector(15 downto 0);
pro:out std_logic_vector(31 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

begin
process(mc,mr)
begin
pro<=mc*mr;
end process;
end Behavioral;
