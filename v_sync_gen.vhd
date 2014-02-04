----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:06:28 01/29/2014 
-- Design Name: 
-- Module Name:    v_sync_gen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity v_sync_gen is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           h_completed : in  STD_LOGIC;
           v_sync : out  STD_LOGIC;
           blank : out  STD_LOGIC;
           completed : out  STD_LOGIC;
           row : out  unsigned(10 downto 0));
end v_sync_gen;

architecture Behavioral of v_sync_gen is

signal count: unsigned(10 downto 0):= "00000000000";
signal count_next: unsigned(10 downto 0);

begin
count_next <= count + 1;
	process(reset)
	begin			
		if(reset='1') then
			v_sync <= '0';
			count <= "00000000000";
			blank <= '1';
			completed <= '0';
		end if;
	end process;
	
	process(clk, h_completed)
	begin
		if(clk'event and clk='1' and h_completed) then
			if(count < 480) then
				v_sync <= '1';
				count <= count_next;
				blank <= '0';
				completed <= '0';
			elsif(count < 490) then
				v_sync <= '1';
				count <= count_next;
				blank <= '1';
				completed <= '0';
			elsif(count < 492) then
				v_sync <= '0';
				count <= count_next;
				blank <= '1';
				completed <= '0';
			elsif(count < 524) then
				v_sync <= '1';
				count <= count_next;
				blank <= '1';
				completed <= '0';
			else
				v_sync <= '1';
				count <= 0;
				blank <= '1';
				completed <= '1';
			end if;
		end if;
	end process;

row <= std_logic_vector(count) when count < 480 else "00000000000";
	
end Behavioral;

