----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 05:10:01 PM
-- Design Name: 
-- Module Name: TB_Program_counter - Behavioral
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
entity TB_Program_counter is
--  Port ( );
end TB_Program_counter;

architecture Behavioral of TB_Program_counter is
component Program_counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC);
end component;
signal D,Q : STD_LOGIC_VECTOR (2 downto 0);
signal Res: STD_LOGIC;
signal Clk : STD_LOGIC:='0';
begin
UUT: Program_counter port map (
    D => D,
    Q => Q,
    Res => Res,
    Clk => Clk );
    
    process begin
        Clk <= NOT(Clk);
        wait for 5ns;
    end process;
    
    process begin
    Res <= '0';
    D <= "000";
    wait for 30ns;
    D <= "001";
    wait for 30ns;
    D <= "010";
    wait for 30ns;
    D <= "011";
    wait for 30ns;
    D <= "100";
    wait for 30ns;
    D <= "101";
    wait for 30ns;
    D <= "110";
    wait for 30ns;
    D <= "111";
    wait for 30ns;
    Res <= '1';
    wait;
    end process;
end Behavioral;



