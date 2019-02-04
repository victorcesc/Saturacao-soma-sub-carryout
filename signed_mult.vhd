-------------------------------------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 USE ieee.numeric_std.all;
 ------------------------------------------------------------------------
 ENTITY signed_mult IS
 GENERIC (N: INTEGER := 4); --number of input bits
 PORT (a, b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
 
 --sum, sub: OUT STD_LOGIC_VECTOR(N DOWNTO 0));
 mult: OUT STD_LOGIC_VECTOR((N*2)-2 DOWNTO 0));
 --cout_sum, cout_sub: OUT STD_LOGIC);
 
 END ENTITY;
 ------------------------------------------------------------------------
 ARCHITECTURE signed_mult OF signed_mult IS
 SIGNAL a_sig, sat_sum, sat_sub, b_sig: UNSIGNED(N-1 DOWNTO 0);
 SIGNAL mult_sig: UNSIGNED((N*2)-1 DOWNTO 0);
 SIGNAL mult_sat: UNSIGNED((N*2)-2 DOWNTO 0);
 
 BEGIN
 -----convert to signed:--------------
 a_sig <= unsigned(a);
 b_sig <= unsigned(b);
 -----add and subtract:---------------
 mult_sig <= (a_sig) * (b_sig);
 
 -----output option #1:--------------
 --sum <= std_logic_vector(sum_sig);
 --sub <= std_logic_vector(sub_sig);
 -----output option #2:---------------
 mult <= std_logic_vector(mult_sat);
 
 --cout_sum <= std_logic(sum_sig(N));
 
 --cout_sub <= std_logic(sub_sig(N));
 
 mult_sat <= resize(mult_sig,((N*2)-1)) when (mult_sig((N*2)-1)='0') else (others => '1');
 --sat_sub <= (sub_sig(N-1 DOWNTO 0))	when  (sub_sig(N)='0') else (others => '0');
 
 
 END ARCHITECTURE;