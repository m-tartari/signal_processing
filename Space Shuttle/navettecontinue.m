function xpoint = navettecontinue(t, x, A, B)
if(t<1)
    xpoint = A*x ; %input 0 for t<1
else
    xpoint = A*x + B*0.05 ; %input= 0.05 for  t>=1
end