function xeplus = navettediscrete(n, xe, Atilde, Btilde, ts)
t = n*ts;
if(t<1)
    xeplus = Atilde*xe;
else
    xeplus = Atilde*xe + Btilde*0.05;
end