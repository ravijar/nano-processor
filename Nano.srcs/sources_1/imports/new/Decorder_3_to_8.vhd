----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2022 09:59:09 AM
-- Design Name: 
-- Module Name: Decorder_3_to_8 - Behavioral
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

entity Decorder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decorder_3_to_8;

architecture Behavioral of Decorder_3_to_8 is
component Decorder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal EN_0,EN_1: STD_LOGIC;
begin
Decorder_2_to_4_0: Decorder_2_to_4
    port map(
        I => I(1 downto 0),
        EN => EN_0,
        Y => Y(3 downto 0)
    );
Decorder_2_to_4_1: Decorder_2_to_4
    port map(
        I => I(1 downto 0),
        EN => EN_1,
        Y => Y(7 downto 4)
    );
EN_0 <= EN AND NOT(I(2));
EN_1 <= EN AND I(2);
end Behavioral;
