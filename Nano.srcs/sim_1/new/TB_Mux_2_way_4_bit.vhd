----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 11:49:18 PM
-- Design Name: 
-- Module Name: TB_Mux_2_way_4_bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Mux_2_way_4_bit is
--  Port ( );
end TB_Mux_2_way_4_bit;

architecture Behavioral of TB_Mux_2_way_4_bit is
component Mux_2_way_4_Bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC);
end component;
signal I0,I1,O:STD_LOGIC_VECTOR (3 downto 0);
signal S,EN : STD_LOGIC;

begin
UUT: Mux_2_way_4_Bit
port map(
    I0 => I0,
    I1 => I1,
    O => O,
    S => S,
    EN => EN
);
process
begin 
EN <= '1';
I0 <= "1111";
I1 <= "1110";



S <= '0';
wait for 20ns;
S <= '1';
wait ;


end process;
end Behavioral;
