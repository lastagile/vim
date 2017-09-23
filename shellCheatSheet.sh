# grep some 
echo "xxxxxx[31258:00007F304E182340]<hhhhhh" | grep -Po "(?<=31258:).+(?=]<)"                                                                          00007F304E182340
