library IEEE;
use IEEE.numeric_bit.all;

entity tarea2_30 is  
port(CLK,CLRb,SDR,SDL: in bit; D: in bit_vector(3 downto 0); S: in bit_vector(1 downto 0);
    Q: out bit_vector(3 downto 0));
end tarea2_30;

architecture arch of tarea2_30 is 
signal Qout : bit_vector(3 downto 0);
begin 
    Q <= Qout;
    process(CLRb,CLK)
    begin
    if CLRb = '0' then Qout <= "0000";
    elsif CLK'event and CLK = '1' then
        if S = "11"  then 
        Qout<= D;
        elsif S = "10" then
        Qout<= SDR & Qout(3 downto 1);
        elsif S = "01" then
        Qout<= Qout(2 downto 0 ) & SDL;
        end if;
    end if;
    end process;
end arch; 


 

library IEEE;
use IEEE.numeric_bit.all;

entity shift8bit is 
port (rsd,lsd,clrb,clk: in bit; d: in bit_vector(7 downto 0); s: in bit_vector(1 downto 0);
     q: out bit_vector(7 downto 0));
end shift8bit;


architecture arch2 of shift8bit is 
component tarea2_30
port(CLK,CLRb,SDR,SDL: in bit; D: in bit_vector(3 downto 0); S: in bit_vector(1 downto 0);
    Q: out bit_vector(3 downto 0));
end component;

begin
    shift0: tarea2_30 port map(clk,clrb,rsd,lsd,d(3 downto 0), s,q(3 downto 0));
    shift1: tarea2_30 port map(clk,clrb,rsd,lsd,d(7 downto 4),s,q(7 downto 4));

end arch2;
