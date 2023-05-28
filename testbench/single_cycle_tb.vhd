library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SingleCycle_tb is
end SingleCycle_tb;

architecture Behavioral of SingleCycle_tb is

    component SingleCycle is
        Port (
            CLK : in STD_LOGIC
        );
    end component;

    signal CLK : STD_LOGIC := '0';
    constant CLK_PERIOD : time := 100 ns;

begin

    -- Instantiate the unit under test
    UUT : SingleCycle port map (
        CLK => CLK
    );

    -- Clock generation
    clk_process : process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stim_process : process
    begin
        -- Let the processor run through the test program
        -- The program loops through memory copy and branch
        wait for CLK_PERIOD * 50;

        -- Stop simulation
        assert false report "Simulation finished" severity failure;
    end process;

end Behavioral;
