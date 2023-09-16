----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 07:14:29 PM
-- Design Name: 
-- Module Name: TB_Bit_3_adder - Behavioral
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

entity TB_Bit_3_adder is
--  Port ( );
end TB_Bit_3_adder;

architecture Behavioral of TB_Bit_3_adder is
    component Bit_3_adder
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               B : in STD_LOGIC_VECTOR (2 downto 0);
               S : out STD_LOGIC_VECTOR (2 downto 0);
               Carry_in : in STD_LOGIC;
               Carry_out : out STD_LOGIC);
    end component;
    signal A,B,S : STD_LOGIC_VECTOR (2 downto 0);         
    signal C_in, C_out :  STD_LOGIC;    
begin
    uut:Bit_3_adder port map(
        A=>A,
        B=>B,
        Carry_in=>C_in,
        S=>S,
        Carry_out=>C_out    
    );
    process
    begin
        C_in <= '0'; -- C_in is set to ground
    
        A<="000";
        B<="101";
        wait for 100ns;
    
        A<="111";
        B<="101";
       
        wait;        
    end process;
end Behavioral;