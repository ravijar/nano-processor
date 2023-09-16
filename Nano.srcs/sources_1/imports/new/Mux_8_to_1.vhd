----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2022 10:45:49 AM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
component Decorder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal Decorder_Y: STD_LOGIC_VECTOR (7 downto 0);
begin
Decorder_3_to_8_0: Decorder_3_to_8
    port map(
        I => S,
        EN => EN,
        Y => Decorder_Y
    );
    Y <= (D(0) AND Decorder_Y(0))
        OR (D(1) AND Decorder_Y(1))
        OR (D(2) AND Decorder_Y(2))
        OR (D(3) AND Decorder_Y(3))
        OR (D(4) AND Decorder_Y(4))
        OR (D(5) AND Decorder_Y(5))
        OR (D(6) AND Decorder_Y(6))
        OR (D(7) AND Decorder_Y(7));
end Behavioral;
