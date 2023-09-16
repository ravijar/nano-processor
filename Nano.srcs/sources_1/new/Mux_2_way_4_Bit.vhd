----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 03:32:25 PM
-- Design Name: 
-- Module Name: Mux_2_way_4_Bit - Behavioral
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

entity Mux_2_way_4_Bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC);
end Mux_2_way_4_Bit;

architecture Behavioral of Mux_2_way_4_Bit is
component Mux_2_to_1
Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           O : out STD_LOGIC);
end component;
begin
Mux_2_to_1_0:Mux_2_to_1
    port map(
        I(0)=>I0(0),
        I(1)=>I1(0),
        S=>S,
        EN=>EN,
        O=>O(0)
    );

Mux_2_to_1_1:Mux_2_to_1
    port map(
        I(0)=>I0(1),
        I(1)=>I1(1),
        S=>S,
        EN=>EN,
        O=>O(1)
    );

Mux_2_to_1_2:Mux_2_to_1
    port map(
        I(0)=>I0(2),
        I(1)=>I1(2),
        S=>S,
        EN=>EN,
        O=>O(2)
    );

Mux_2_to_1_3:Mux_2_to_1
    port map(
        I(0)=>I0(3),
        I(1)=>I1(3),
        S=>S,
        EN=>EN,
        O=>O(3)
    );

end Behavioral;
