----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 11:54:34 AM
-- Design Name: 
-- Module Name: TB_AddSubUnit_4 - Behavioral
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

entity TB_AddSubUnit_4 is
--  Port ( );
end TB_AddSubUnit_4;

architecture Behavioral of TB_AddSubUnit_4 is

    component AddSubUnit_4
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Sub : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow, Zero : out STD_LOGIC);
    end component;
    
signal A,B,S : STD_LOGIC_VECTOR (3 downto 0);         
signal Sub, Overflow, Zero :  STD_LOGIC;
                   

begin
    uut:AddSubUnit_4 port map(
            A=>A,
            B=>B,
            S => S,
            Zero => Zero,
            Overflow => Overflow,
            Sub => Sub
        );
    process
    begin
        Sub<='0';
               
        A<="0010";
        B<="1100";
        wait for 100ns;
        
        A<="1101";
        B<="1110";
        wait for 100ns;
        
        A<="0111";
        B<="0110";
        wait for 100ns;
        
        A<="1001";
        B<="1010";
        wait for 100ns;
        
        A<="0111";
        B<="0111";
        wait for 100ns;
        
        Sub <= '1';
        
        A<="0011";
        B<="0011";
        wait for 100ns;
                
        wait;
    
    end process;
end Behavioral;