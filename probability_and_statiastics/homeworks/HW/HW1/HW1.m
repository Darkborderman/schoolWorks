sample = [6.72 6.77 6.82 6.70 6.78 6.70 6.62 6.75 6.66 6.66 6.64 6.76 6.73 6.80 6.72 6.76 6.76 6.68 6.66 6.62 6.72 6.76 6.70 6.78 6.76 6.67 6.70 6.72 6.74 6.81 6.79 6.78 6.66 6.76 6.76 6.72 ];
temp=0;
  for i=1:36
      temp=temp+sample(i);
  end
  mean=temp/36;
  
  
  for i=1:36
      temp=temp+(sample(i)-mean)^2;
  end
  deviation=sqrt(temp/36);
  fprintf('(a)The sample mean: %f\n   The sample deviation: %f\n',mean,deviation);
  
  xbins=6.60:0.03:6.80;
  hist(sample,xbins);
  xlabel ('revet heads (inch)');
  ylabel ('relative frequency (times)');
  