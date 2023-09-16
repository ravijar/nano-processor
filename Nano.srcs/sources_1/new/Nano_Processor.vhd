----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 10:33:45 AM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port ( Clk_in : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end Nano_Processor;

architecture Behavioral of Nano_Processor is
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

component Mux_8_way_4_Bit
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component;

component AddSubUnit_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sub : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow, Zero : out STD_LOGIC);
end component;

component Mux_2_way_4_Bit
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC);
end component;

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

component Bit_3_adder
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       S : out STD_LOGIC_VECTOR (2 downto 0);
       Carry_in : in STD_LOGIC;
       Carry_out : out STD_LOGIC);
end component;

component Mux_2_way_3_Bit
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC);
end component;

component Program_counter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC);
end component;

component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component Program_ROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;
 -- For the Register Bank
signal Mux_Reg_Bank: STD_LOGIC_VECTOR (3 downto 0);
signal Decoder_Reg_Bank: STD_LOGIC_VECTOR (2 downto 0);
signal Reg_0_out, Reg_1_out, Reg_2_out, Reg_3_out, Reg_4_out, Reg_5_out, Reg_6_out, Reg_7_out:  STD_LOGIC_VECTOR (3 downto 0);  
--  For the Mux_8_way_4_Bit
signal Reg_Sel_0,Reg_Sel_1: STD_LOGIC_VECTOR (2 downto 0);
signal Reg_Sel_0_out,Reg_Sel_1_out: STD_LOGIC_VECTOR (3 downto 0);
 -- For the AddSubUnit_4
signal AddSubSel: STD_LOGIC;
signal AddSubOut: STD_LOGIC_VECTOR (3 downto 0);
 -- For the Mux_2_way_4_Bit
signal Immediate_Value: STD_LOGIC_VECTOR (3 downto 0);
signal Mux_Decoder_Sel: STD_LOGIC;
 -- For the Instruction Decoder
signal Rom_out: STD_LOGIC_VECTOR (11 downto 0);
signal JumpAddress: STD_LOGIC_VECTOR (2 downto 0);
signal JumpFlag: STD_LOGIC;
 -- For the Bit_3_adder
signal Bit_3_adder_out: STD_LOGIC_VECTOR (2 downto 0);
-- For the Program Counter
signal PC_in,PC_out: STD_LOGIC_VECTOR (2 downto 0);

signal Clk: STD_LOGIC;



begin 
Slow_Clk_0: Slow_Clk
Port Map(
       Clk_in => Clk_in,
       Clk_out => Clk
);

Register_Bank_0: Register_Bank
Port Map(
       Clk => Clk,
       I => Mux_Reg_Bank,
       S => Decoder_Reg_Bank,
       O0 => Reg_0_out,
       O1 => Reg_1_out,
       O2 => Reg_2_out, 
       O3 => Reg_3_out, 
       O4 => Reg_4_out, 
       O5 => Reg_5_out, 
       O6 => Reg_6_out, 
       O7 => Reg_7_out,
       Res => Reset, 
       EN => '1'
);

Mux_8_way_4_Bit_0: Mux_8_way_4_Bit
Port Map(
           I0 => Reg_0_out, 
           I1 => Reg_1_out, 
           I2 => Reg_2_out, 
           I3 => Reg_3_out, 
           I4 => Reg_4_out, 
           I5 => Reg_5_out, 
           I6 => Reg_6_out, 
           I7 => Reg_7_out, 
           S  => Reg_Sel_0,
           O => Reg_Sel_0_out,
           EN => '1'
);

Mux_8_way_4_Bit_1: Mux_8_way_4_Bit
Port Map(
           I0 => Reg_0_out, 
           I1 => Reg_1_out, 
           I2 => Reg_2_out, 
           I3 => Reg_3_out, 
           I4 => Reg_4_out, 
           I5 => Reg_5_out, 
           I6 => Reg_6_out, 
           I7 => Reg_7_out, 
           S  => Reg_Sel_1,
           O => Reg_Sel_1_out,
           EN => '1'
);

AddSubUnit_4_0:AddSubUnit_4
Port Map( 
           A => Reg_Sel_0_out,
           B => Reg_Sel_1_out,
           Sub => AddSubSel,
           S => AddSubOut,
           Overflow => Overflow,
           Zero => Zero
);

Mux_2_way_4_Bit_0 : Mux_2_way_4_Bit
Port Map( 
           I0 => AddSubOut,
           I1 => Immediate_Value,
           O => Mux_Reg_Bank,
           S => Mux_Decoder_Sel,
           EN => '1'
);

Instruction_Decoder_0 : Instruction_Decoder
Port Map ( 
           I => Rom_out,
          
           Reg_Jump_Check =>Reg_Sel_0_out, 
           Reg_En => Decoder_Reg_Bank,
           Load_Sel => Mux_Decoder_Sel,
           Immediate_Val => Immediate_Value,
           Reg_Sel_A => Reg_Sel_0,
           Reg_Sel_B => Reg_Sel_1,
           Add_Sub_Sel => AddSubSel,
           Jump_Flag => JumpFlag,
           Jump_Address =>JumpAddress
);

Bit_3_adder_0: Bit_3_adder
Port Map (
       A => PC_out,
       B => "001",
       S => Bit_3_adder_out,
       Carry_in => '0'
--       Carry_out =>  -- Not mapped
);

Mux_2_way_3_Bit_0:Mux_2_way_3_Bit
Port Map( 
           I0 => Bit_3_adder_out,
           I1 => JumpAddress,
           O => PC_in,
           S => JumpFlag,
           EN => '1'
);

Program_counter_0: Program_counter
Port Map( 
           D => PC_in,
           Q => PC_out,
           Res => Reset,
           Clk => Clk
);

Program_ROM_0:Program_ROM
Port Map(
           address => PC_out,
           data => Rom_out
);

R7_out <= Reg_7_out;

end Behavioral;
