----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2022 09:15:33 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
component Register_Bank
    Port ( Clk : in STD_LOGIC;
           I : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           O0 : out STD_LOGIC_VECTOR (3 downto 0);
           O1 : out STD_LOGIC_VECTOR (3 downto 0);
           O2 : out STD_LOGIC_VECTOR (3 downto 0);
           O3 : out STD_LOGIC_VECTOR (3 downto 0);
           O4 : out STD_LOGIC_VECTOR (3 downto 0);
           O5 : out STD_LOGIC_VECTOR (3 downto 0);
           O6 : out STD_LOGIC_VECTOR (3 downto 0);
           O7 : out STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           EN : in STD_LOGIC);
end component;
signal Clk,EN: STD_LOGIC:='1';
signal Res: STD_LOGIC;
signal I,O0,O1,O2,O3,O4,O5,O6,O7:STD_LOGIC_VECTOR (3 downto 0);
signal S : STD_LOGIC_VECTOR (2 downto 0);
begin
UUT:Register_Bank port map(
    Clk => Clk,
    I => I,
    O0 => O0,
    O1 => O1,
    O2 => O2,
    O3 => O3,
    O4 => O4,
    O5 => O5,
    O6 => O6,
    O7 => O7,
    S => S,
    Res => Res,
    EN => EN
);
process begin
    Clk <= NOT(Clk);
    wait for 5ns;
end process;
process begin
    Res <= '0';
    I <= "1010";
    
    S <= "000";
    wait for 30ns;
    
    S <= "001";
    wait for 30ns;
        
    S <= "010";
    wait for 30ns;
    S <= "011";
    wait for 30ns;
    S <= "100";
    wait for 30ns;
    S <= "101";
    wait for 30ns;
    S <= "110";
    wait for 30ns;
    S <= "111";
    wait for 30ns;
    
    Res <= '1';
    wait ;
    
end process;
end Behavioral;
