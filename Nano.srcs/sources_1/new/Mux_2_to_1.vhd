----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 03:27:42 PM
-- Design Name: 
-- Module Name: Mux_2_to_1 - Behavioral
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

entity Mux_2_to_1 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           O : out STD_LOGIC);
end Mux_2_to_1;

architecture Behavioral of Mux_2_to_1 is

begin
O<= EN AND ((S AND I(1)) OR (NOT(S) AND I(0)));

end Behavioral;
