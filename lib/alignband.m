function [fl fh win range]=alignband(i)
    switch i
       case 1
        fl=0.1;     fh=0.5;        win=30 ;  range=8;
       case 2
        fl=0.2;     fh=0.75;        win=20 ;  range=5;
         case 3
        fl=0.25;     fh=1;        win=10 ;  range=3;
              case 4
        fl=0.5;     fh=2;        win=5 ;  range=1;
         case 5
        fl=1;     fh=4;        win=3 ;  range=0.5;
        otherwise 
              fprintf('error\n out of boundary');
    end
    fprintf('   fl=%f    fh=%f  win=%f  range=%f\n',fl,fh,win,range);
end