 k=10^-2;
 for i=1:5
     a=1;
     b=-500-k;
     c=500*k;
     ans=(-b+(b*b-4*a*c)^(1/2))/2*a;
     fprintf(1,'Question 1 : %.16f\n',ans);
     ans=(-b-(b*b-4*a*c)^(1/2))/2*a;
     fprintf(1,'Question 1 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b-(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 1 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b+(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 1 : %.16f\n',ans);
     k=k*10^(-2);
 end
 
 a=0.0001;
 b=30.0003;
 c=90;
     ans=(-b+(b*b-4*a*c)^(1/2))/2*a;
     fprintf(1,'Question 2 : %.16f\n',ans);
     ans=(-b-(b*b-4*a*c)^(1/2))/2*a;
     fprintf(1,'Question 2 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b-(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 2 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b+(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 2 : %.16f\n',ans);
 
 a=1;
 b=300003;
 c=900000;
     ans=(-b+(b*b-4*a*c)^(1/2))/2*a;
     fprintf(1,'Question 3 : %.16f\n',ans);
     ans=(-b-(b*b-4*a*c)^(1/2))/2*a;
     fprintf(1,'Question 3 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b-(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 3 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b+(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 3 : %.16f\n',ans);
  
   a=1/10^152;
   b=-302;
   c=(-6)*10^154;
     ans=(-b+(b*b-4*a*c)^(1/2))/(2*a);
     fprintf(1,'Question 4 : %.16f\n',ans);
     ans=(-b-(b*b-4*a*c)^(1/2))/(2*a);
     fprintf(1,'Question 4 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b-(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 4 : %.16f\n',ans);
     ans=4*a*c/(2*a*(-b+(b*b-4*a*c)^(1/2)));
     fprintf(1,'Question 4 : %.16f\n',ans);

  
