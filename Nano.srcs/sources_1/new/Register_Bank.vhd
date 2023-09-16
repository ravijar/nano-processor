----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 03:56:59 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
end Register_Bank;

architecture Behavioral of Register_Bank is
component Decorder_3_to_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component Reg
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Decorder_O: STD_LOGIC_VECTOR (7 downto 0);
begin
Decorder_3_to_8_0:Decorder_3_to_8
    port map(
        I=>S,
        EN=>EN,
        Y=>Decorder_O
    );
Reg_0:Reg
    port map(
        D => "0000",
        En => Decorder_O(0),
        Clk => Clk,
        Res => Res,
        Q => O0
);
Reg_1:Reg
    port map(
        D => I,
        En => Decorder_O(1),
        Clk => Clk,
        Res => Res,
        Q => O1
);
Reg_2:Reg
        port map(
        D => I,
        En => Decorder_O(2),
        Clk => Clk,
        Res => Res,
        Q => O2
    );
Reg_3:Reg
    port map(
        D => I,
        En => Decorder_O(3),
        Clk => Clk,
        Res => Res,
        Q => O3
    );
Reg_4:Reg
    port map(
        D => I,
        En => Decorder_O(4),
        Clk => Clk,
        Res => Res,
        Q => O4
    );
Reg_5:Reg
    port map(
        D => I,
        En => Decorder_O(5),
        Clk => Clk,
        Res => Res,
        Q => O5
    );
Reg_6:Reg
    port map(
        D => I,
        En => Decorder_O(6),
        Clk => Clk,
        Res => Res,
        Q => O6
    );
Reg_7:Reg
    port map(
        D => I,
        En => Decorder_O(7),
        Clk => Clk,
        Res => Res,
        Q => O7
    );
end Behavioral;
