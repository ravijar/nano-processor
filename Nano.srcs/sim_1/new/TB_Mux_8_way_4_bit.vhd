----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 11:15:12 PM
-- Design Name: 
-- Module Name: TB_Mux_8_way_4_bit - Behavioral
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

entity TB_Mux_8_way_4_bit is
--  Port ( );
end TB_Mux_8_way_4_bit;

architecture Behavioral of TB_Mux_8_way_4_bit is
component Mux_8_way_4_Bit
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component;
signal I0,I1,I2,I3,I4,I5,I6,I7,O : STD_LOGIC_VECTOR (3 downto 0);
signal S:STD_LOGIC_VECTOR (2 downto 0);
signal EN:STD_LOGIC;
begin
UUT:Mux_8_way_4_Bit port map(
    I0 => I0,
    I1 => I1,
    I2 => I2,
    I3 => I3,
    I4 => I4,
    I5 => I5,
    I6 => I6,
    I7 => I7,
    O => O,
    S => S,
    EN => EN  
);
process begin
    EN <= '1';
    I0 <= "0000";
    I1 <= "0001";
    I2 <= "0010";
    I3 <= "0011";
    I4 <= "0100";
    I5 <= "0101";
    I6 <= "0110";
    I7 <= "0111";
    
    S <= "000";
    wait for 20ns;
    S <= "001";
    wait for 20ns;
    S <= "010";
    wait for 20ns;
    S <= "011";
    wait for 20ns;
    S <= "100";
    wait for 20ns;
    S <= "101";
    wait for 20ns;
    S <= "110";
    wait for 20ns;
    S <= "111";
    wait;
    
end process;
end Behavioral;
