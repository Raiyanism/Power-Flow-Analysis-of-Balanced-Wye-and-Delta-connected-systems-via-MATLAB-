clear all;
close all;
clc;
vs= [98.48+17.364i -34.202-93.969i -34.202+93.969i];
phaseImp= [ 8+4i  8+4i  8+4i];
transImp= 0 ;
freq= 60;
desired= 1;
type= 2;
[a b c d e f g h i j k l]= wye_delta(vs,phaseImp,transImp,freq,desired,type)