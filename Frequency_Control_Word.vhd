library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.ALL;

entity Frequency_Control_Word is
    generic(
        fcw_width :integer :=10
    );
    Port (
        Control_Word : out STD_LOGIC_VECTOR(fcw_width-1 downto 0)  --  output
    );
end Frequency_Control_Word;

architecture Behavioral of Frequency_Control_Word is
    signal count : INTEGER range 1 to 10 := 1;  -- Internal integer counter, starting from 1
    signal loop_control: INTEGER :=0;
begin
    process
    begin
        -- Loop to increment the count every fcw_wait
        for i in 1 to 10 loop
            Control_Word <= std_logic_vector(to_unsigned(count, fcw_width));  -- Convert count to  std_logic_vector            
            if loop_control<5 then
            count <= count + 1;
            else
            count <= count - 1;
            end if;
            loop_control <= loop_control+1;
            wait for 20 us ;  -- Wait for 1fcw_wait
        end loop;

        wait;  -- Stop simulation after reaching 
    end process;
end Behavioral;
