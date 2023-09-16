----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 11:51:49 AM
-- Design Name: 
-- Module Name: AddSubUnit_4 - Behavioral
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

entity AddSubUnit_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sub : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow, Zero : out STD_LOGIC);
end AddSubUnit_4;

architecture Behavioral of AddSubUnit_4 is
component FA
        port(
        A,B,C_in: in STD_LOGIC;
        S,C_out: out STD_LOGIC
        );
    end component;
    signal FA_S,FA_C: STD_LOGIC_VECTOR (3 downto 0);
    signal B_in : STD_LOGIC_VECTOR (3 downto 0);
begin
    FA_0:FA
        port map(
            A => A(0),
            B => B_in(0),
            C_in => Sub,
            S => FA_S(0),
            C_out => FA_C(0)
        );
    FA_1:FA
        port map(
            A => A(1),
            B => B_in(1),
            C_in => FA_C(0),
            S => FA_S(1),
            C_out => FA_C(1)
        );
    FA_2:FA
        port map(
            A => A(2),
            B => B_in(2),
            C_in => FA_C(1),
            S => FA_S(2),
            C_out => FA_C(2)
        );
    FA_3:FA
        port map(
            A => A(3),
            B => B_in(3),
            C_in => FA_C(2),
            S => FA_S(3),
            C_out => FA_C(3)
        );
    B_in(0) <= B(0) XOR Sub;
    B_in(1) <= B(1) XOR Sub;
    B_in(2) <= B(2) XOR Sub;
    B_in(3) <= B(3) XOR Sub;
    
    S <= FA_S;
    Overflow <= FA_C(2) XOR FA_C(3);
    Zero <= NOT(FA_S(0) OR FA_S(1) OR FA_S(2) OR FA_S(3));
end Behavioral;
