library ieee;
use ieee.std_logic_1164.all;

entity mdr6b is
    port (
        -- Entradas de dados (6 bits)
        in_5 : in std_logic;
        in_4 : in std_logic;
        in_3 : in std_logic;
        in_2 : in std_logic;
        in_1 : in std_logic;
        in_0 : in std_logic;
        
        -- Sinais de controle
        trigger : in std_logic; -- Funciona como o sinal de Clock
        preset  : in std_logic; -- Força todas as saídas para '1' (Assíncrono)
        clear   : in std_logic; -- Força todas as saídas para '0' (Assíncrono)
        
        -- Saídas de dados (6 bits)
        out_5 : out std_logic;
        out_4 : out std_logic;
        out_3 : out std_logic;
        out_2 : out std_logic;
        out_1 : out std_logic;
        out_0 : out std_logic
    );
end entity mdr6b;

architecture behavioral of mdr6b is
begin
    -- O processo é sensível ao trigger (clock), clear e preset
    process(trigger, clear, preset)
    begin
        -- Prioridade 1: Clear (zera o registrador independentemente do clock)
        if clear = '1' then
            out_5 <= '0';
            out_4 <= '0';
            out_3 <= '0';
            out_2 <= '0';
            out_1 <= '0';
            out_0 <= '0';
            
        -- Prioridade 2: Preset (seta o registrador para 1 independentemente do clock)
        elsif preset = '1' then
            out_5 <= '1';
            out_4 <= '1';
            out_3 <= '1';
            out_2 <= '1';
            out_1 <= '1';
            out_0 <= '1';
            
        -- Condição normal de operação: borda de subida do trigger (clock)
        elsif rising_edge(trigger) then
            out_5 <= in_5;
            out_4 <= in_4;
            out_3 <= in_3;
            out_2 <= in_2;
            out_1 <= in_1;
            out_0 <= in_0;
        end if;
    end process;
end architecture behavioral;