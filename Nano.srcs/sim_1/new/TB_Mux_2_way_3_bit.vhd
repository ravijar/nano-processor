----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 08:46:11 PM
-- Design Name: 
-- Module Name: TB_Mux_2_way_3_bit - Behavioral
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

entity TB_Mux_2_way_3_bit is
--  Port ( );
end TB_Mux_2_way_3_bit;

architecture Behavioral of TB_Mux_2_way_3_bit is
component Mux_2_way_3_Bit is
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC);
end component;
signal I0,I1,O:STD_LOGIC_VECTOR (2 downto 0);
signal S,EN : STD_LOGIC;

begin
UUT: Mux_2_way_3_Bit
port map(
    I0 => I0,
    I1 => I1,
    O => O,
    S => S,
    EN => EN
);
process begin 
    EN <= '1';
    I0 <= "101";
    I1 <= "010";
    
    S <= '0';
    wait for 20ns;
    S <= '1';
    wait for 20ns;
    S <= '0';
    wait for 20ns;
    S <= '1';
    wait ;
    
end process;
end Behavioral;
