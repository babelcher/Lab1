----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:01 01/29/2014 
-- Design Name: 
-- Module Name:    h_sync_gen - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity h_sync_gen is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           h_sync : out  STD_LOGIC;
           blank : out  STD_LOGIC;
           completed : out  STD_LOGIC;
           column : out  unsigned(10 downto 0));
end h_sync_gen;

architecture Behavioral of h_sync_gen is	

signal count: unsigned(10 downto 0):= "00000000000";
signal count_next: unsigned(10 downto 0);

begin
	count_next <= count + 1;
	process(reset, clk)
		begin			
			if(reset='1') then
				h_sync <= '0';
				count <= "00000000000";
				blank <= '1';
				completed <= '0';
			elsif(clk'event and clk='1') then
				--active video
				if(count < 640) then
					h_sync <= '1';
					count <= count_next;
					blank <= '0';
					completed <= '0';
				--front porch
				elsif(count < 656) then
					h_sync <= '1';
					count <= count_next;
					blank <= '1';
					completed <= '0';
				--sync
				elsif(count < 752) then
					h_sync <= '0';
					count <= count_next;
					blank <= '1';
					completed <= '0';
				--back porch
				elsif(count < 799) then
					h_sync <= '1';
					count <= count_next;
					blank <= '1';
					completed <= '0';
				--back porch last cycle
				else	
					h_sync <= '1';
					count <= 0;
					blank <= '1';
					completed <= '1';
				end if;
			end if;
		end process;
		
column <= std_logic_vector(count) when count < 640 else "00000000000";

end Behavioral;

