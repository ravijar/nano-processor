----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 10:38:08 AM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;
architecture Behavioral of Instruction_Decoder is

signal OP_Code : STD_LOGIC_VECTOR (1 downto 0);
signal Reg_A,Reg_B : STD_LOGIC_VECTOR (2 downto 0);
signal Data_In : STD_LOGIC_VECTOR (3 downto 0);

begin

process(OP_Code,Reg_A,Reg_B, Reg_Jump_Check,Data_In,Data_In(2 downto 0)) 

begin

    
   
         --initialize jump to 0
        Jump_Flag<='0';
        Reg_EN <= "000";
        if (OP_Code = "00") then --ADDITION
            Add_Sub_Sel <= '0';
            Reg_Sel_A <= Reg_A;
            Reg_Sel_B <= Reg_B; 
             --TIME FOR ATITHMETIC OPERATION
            
            Reg_En <= Reg_A;
            
                 
            Load_Sel<= '0';  --MUX SELECTOR    


        elsif (OP_Code = "10") then --MOVE     
            Immediate_Val<=Data_In; 
            Reg_En <= Reg_A;  
            Load_Sel<= '1';  --MUX SELECTOR               
       


        elsif (OP_Code = "01") then --NEGATION     
            Reg_Sel_A <= "000";
            Reg_Sel_B <= Reg_A; 
             --TIME FOR ATITHMETIC OPERATION
            Reg_En <= Reg_A;
            Add_Sub_Sel <= '1';     
            Load_Sel<= '0';  --MUX SELECTOR  


         
        elsif (OP_Code = "11") then --JUMPZ
            Reg_Sel_A <= Reg_A;        
            if (Reg_Jump_Check="0000") then    
                Jump_Flag<='1';       
                Jump_Address<=Data_In(2 downto 0);
                
            end if;
        end if;
    
             
end process;

OP_Code <= I(11 downto 10);
Reg_A <= I(9 downto 7);
Reg_B <= I(6 downto 4);
Data_In<= I(3 downto 0);

end Behavioral;























