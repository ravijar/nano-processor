----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 07:48:34 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
    component Instruction_Decoder
        Port ( I :in STD_LOGIC_VECTOR (11 downto 0);
              
               Reg_Jump_Check : in STD_LOGIC_VECTOR (3 downto 0);
               Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
               Load_Sel : out STD_LOGIC;
               Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
               Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
               Add_Sub_Sel : out STD_LOGIC;
               Jump_Flag : out STD_LOGIC;
               Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    signal I : STD_LOGIC_VECTOR(11 downto 0);
    signal Reg_Jump_Check,Immediate_Val : STD_LOGIC_VECTOR(3 downto 0); 
    signal Reg_En, Reg_Sel_A, Reg_Sel_B, Jump_Address : STD_LOGIC_VECTOR(2 downto 0);
    signal Load_Sel, Add_Sub_Sel, Jump_Flag : STD_LOGIC;
    

begin
    uut:Instruction_Decoder
    port map(
           I => I,
          
           Reg_Jump_Check => Reg_Jump_Check,
           Reg_En => Reg_En,
           Load_Sel => Load_Sel,
           Immediate_Val => Immediate_Val,
           Reg_Sel_A  => Reg_Sel_A,
           Reg_Sel_B => Reg_Sel_B,
           Add_Sub_Sel => Add_Sub_Sel,
           Jump_Flag => Jump_Flag,
           Jump_Address => Jump_Address  
    );
 
    process
    begin
        I <= "100010000011";
        wait for 30 ns;
        
        I <= "100100000001";
         wait for 30 ns;
        
        I <= "010100000000";
            wait for 30 ns;
            
        I <= "001110010000";
        wait for 30 ns;
        
        I <= "000010100000";
        wait for 30 ns;
            
        Reg_Jump_Check <= "0100";
        I <=  "110010000111";
            wait for 30 ns;                
        Reg_Jump_Check <= "0000";
        I <=  "110000000011";
            wait for 30 ns;
            
        I <= "000000000000";
        wait for 30 ns;
                        
        wait;                                                        
    end process;
end Behavioral;