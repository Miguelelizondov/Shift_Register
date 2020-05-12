library IEEE;
use IEEE.numeric_bit.all;

entity shift_tb is 
end shift_tb;

architecture eq_tb of shift_tb is 
	component  shift8bit is 
		port (rsd,lsd,clrb,clk: in bit; d: in bit_vector(7 downto 0); s: in bit_vector(1 downto 0);
     q: out bit_vector(7 downto 0));
	end	component;

	signal rsd,lsd,clrb,clk:bit; 
    signal d: bit_vector(7 downto 0); 
    signal s: bit_vector(1 downto 0);
    signal q: bit_vector(7 downto 0);

begin 
  UUT: shift8bit port map (rsd,lsd,clrb,clk,d,s,q);  
  
  P0: process
  begin
	rsd <= '0';
    lsd <= '0';
    clrb <= '1';
    d <= "10101011";
    s <= "00";
    wait for 20 ns;
    rsd <= '1';
    lsd <= '1';
    clrb <= '1';
    d <= "10101011";
    s <= "11";
    wait for 20 ns;
     rsd <= '1';
    lsd <= '1';
    clrb <= '1';
    d <= "10101011";
    s <= "10";
    wait for 20 ns;
     rsd <= '1';
    lsd <= '1';
    clrb <= '1';
    d <= "10101011";
    s <= "01";
    wait for 20 ns;
         rsd <= '0';
    lsd <= '0';
    clrb <= '0';
    d <= "10101011";
    s <= "01";
    wait for 20 ns;
    
  end process;
  
  P1: process 
  begin 
  CLK<='0';
  wait for 5 ns;
  CLK<= '1';
  wait for 5 ns;
  end process;
end eq_tb;
