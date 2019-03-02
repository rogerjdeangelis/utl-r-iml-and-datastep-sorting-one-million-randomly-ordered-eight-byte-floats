 R, IML, and Datastep sorting of one million randomly ordered eight byte floats                                                       
                                                                                                                                      
                                                                                                                                      
              Benchmarks to Sort One Million Randomly ordered 8 byte Floats                                                           
                             Time in Milliseconds                                                                                     
                                                                                                                                      
                  0          250         500         750       1000                                                                   
                 -+-----------+------+----+-----------+-----------+                                                                   
                 |                   |                            |                                                                   
   SAS_Sortn     +   +---+           |   * 470ms    +-----+       +  SAS_Sortn                                                        
                 |   | R |           |              | SAS |       |                                                                   
   R_Shell_      +   +---+ * 177ms   |              +-----+       +  R_Shell_                                                         
                 |                   |                            |                                                                   
   R_Radx_float  +         * 196ms   |                            +  R_Radx_float                                                     
                 |                   |                            |                                                                   
   R_RadxInteger +    * 74ms         |                            +  R_RadxInteger                                                    
                 |                   |                            |                                                                   
   R_QuikSort    +     * 112ms       |                            +  R_QuikSort                                                       
                 |                   |                            |                                                                   
   R_Parallel    +  * 51ms           |                            +  R_Parallel                                                       
                 |                   |                            |                                                                   
   IML_Sort      +                   |            * 730ms         +  IML_Sort                                                         
                 |                   |                            |                                                                   
                 -+-----------+------+----+-----------+-----------+                                                                   
                  0          250         500         750       1000                                                                   
                                                                                                                                      
                              MEAN of 30 cases (R only)                                                                               
                                                                                                                                      
                                                                                                                                      
 R Detail    Benchmarks to Sort One Million Randomly ordered 8 byte Floats                                                            
                            Time in Milliseconds                                                                                      
                                                                                                                                      
                  Q1      Mean   Median       Q3       Min       Max                                                                  
                                                                                                                                      
 rparout     46.4193  49.59216  46.7222  47.6397  45.78407  136.2777 (100 runs)                                                       
 radxInt     75.5528  78.54976  77.9974  80.5097  74.15843   87.2394 (30 runs)                                                        
 radixFloat 180.6907  190.4046 185.9263 189.3155  180.0299  270.6139 (30 runs)                                                        
 quickSort  101.9230  108.0750 102.8029 110.2778  101.6667  186.1461 (30 runs)                                                        
 shellSort  169.6538  175.6991 169.8340 178.3241  169.3048  256.3592 (30 runs)                                                        
                                                                                                                                      
Moving one million 8 byte floats to and from R (very fast)                                                                            
Time in milliseconds                                                                                                                  
                     Mean    Median       Q3     Max     Runs    Min       Q1                                                         
 readbin         50.82838   47.2215   50.644   268.616    100   43.458  45.51                                                         
 writeBin        24.58991   24.5246   25.0988   32.592    100   22.681  23.69                                                         
                                                                                                                                      
 SAS put rb8        140.0                                                                                                             
 SAS input rd8       80.0                                                                                                             
                                                                                                                                      
github                                                                                                                                
https://tinyurl.com/yxrw3jwx                                                                                                          
https://github.com/rogerjdeangelis/utl-r-iml-and-datastep-sorting-one-million-randomly-ordered-eight-byte-floats                      
                                                                                                                                      
related                                                                                                                               
https://tinyurl.com/y44hrzhq                                                                                                          
https://github.com/rogerjdeangelis/utl_load_1_billion_SAS-floats_into_R_in_13_seconds                                                 
                                                                                                                                      
*_                   _                                                                                                                
(_)_ __  _ __  _   _| |_                                                                                                              
| | '_ \| '_ \| | | | __|                                                                                                             
| | | | | |_) | |_| | |_                                                                                                              
|_|_| |_| .__/ \__,_|\__|                                                                                                             
        |_|                                                                                                                           
;                                                                                                                                     
One million back to back IEEE Floats Standard for Binary Floating-Point (ANSI/IEEE Std 754-1985)                                      
                                                                                                                                      
filename bin "d:/bin/have.bin" lrecl=32000 recfm=f;                                                                                   
data _null_;                                                                                                                          
 array tmp[1000000] _temporary_;                                                                                                      
 do _n_=1 to 1000000;                                                                                                                 
    tmp[_n_] =ceil(1000000*rand('uniform'));                                                                                          
    file bin ;                                                                                                                        
    put tmp[_n_] rb8. @ ;                                                                                                             
 end;                                                                                                                                 
 stop;                                                                                                                                
run;quit;                                                                                                                             
                                                                                                                                      
NOTE: 250 records were written to the file BIN.                                                                                       
NOTE: DATA statement used (Total process time):                                                                                       
      real time           0.14 seconds                                                                                                
                                                                                                                                      
%utlrulr                                                                                                                              
  (                                                                                                                                   
    uinflt  = d:/bin/have.bin                                                                                                         
   ,uprnlen = 80                                                                                                                      
   ,ulrecl  = 80                                                                                                                      
   ,urecfm  = f                                                                                                                       
   ,uobs   =  4                                                                                                                       
   ,uotflt =d:/txt/havTxt.txt                                                                                                         
  );                                                                                                                                  
                                                                                                                                      
ASCII Flatfile Ruler & Hex                                                                                                            
utlrulr                                                                                                                               
d:/bin/have.bin                                                                                                                       
d:/txt/havTxt.txt                                                                                                                     
                                                                                                                                      
                                                                                                                                      
 --- Record Number ---  1   ---  Record Length ---- 80 (10 FLOATS)                                                                    
                                                                                                                                      
....@K.@....0..A......A....,.)A.....J.A.......A....D.)A....HG.A.......A....27"A                                                      
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                                      
000044F400003D040000081400002E24000094040000801400004D24000044140000981400003324                                                      
00000B9000000751000044F10000C39100008A510000441100004B91000087010000C44100002721                                                      
                                                                                                                                      
                                                                                                                                      
 --- Record Number ---  2   ---  Record Length ---- 80 (10 FLOATS)                                                                    
                                                                                                                                      
.......A.......A......&A......A......$A....X. A....4..A.....l.A....d.A.....1"A                                                      
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                                      
0000A21400001C1400008D2400008B140000B82400005E24000039140000D624000069140000D324                                                      
00000E1100004F5100004261000089F10000E3410000880100004D7100008CE1000048F100008121                                                      
                                                                                                                                      
                                                                                                                                      
 --- Record Number ---  3   ---  Record Length ---- 80  (10 FLOATS)                                                                   
                                                                                                                                      
....p.)A....<_#A....fJ.A...."Y*A......A...../!A.....N&A....T..A.......@.......A                                                      
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                                      
00007C240000352400006424000025240000FC14000012240000C42400005F1400008BC400009914                                                      
00000D910000CF3100006AE1000029A10000C0A100008F1100004E610000406100000A7000008241                                                      
                                                                                                                                      
                                                                                                                                      
 --- Record Number ---  4   ---  Record Length ---- 80  (10 FLOATS)                                                                   
                                                                                                                                      
.....e.A.....=A....Z2!A....2.-A....4l.A.......A.....c)A...... A....`..A.......A                                                      
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                                      
000016140000C3140000532400003E2400003614000000140000C62400008F2400006E1400000804                                                      
0000855100008DF10000A21100002BD100004C01000049410000A3910000600100000F71000084D1                                                      
                                                                                                                                      
...                                                                                                                                   
                                                                                                                                      
*____    _    ____     ____             _                                                                                             
/ ___|  / \  / ___|   / ___|  ___  _ __| |_ _ __                                                                                      
\___ \ / _ \ \___ \   \___ \ / _ \| '__| __| '_ \                                                                                     
 ___) / ___ \ ___) |   ___) | (_) | |  | |_| | | |                                                                                    
|____/_/   \_\____/___|____/ \___/|_|   \__|_| |_|                                                                                    
                 |_____|                                                                                                              
;                                                                                                                                     
                                                                                                                                      
data _null_;                                                                                                                          
 array tmp[1000000] _temporary_;                                                                                                      
 do _n_=1 to 1000000;                                                                                                                 
    tmp[_n_] =ceil(1000000*rand('uniform'));                                                                                          
 end;                                                                                                                                 
 beg=datetime();                                                                                                                      
 call sortn(of tmp[*]);                                                                                                               
 sec=datetime() - datetime();                                                                                                         
 put tmp[1]= tmp[2]= tmp[3]=;                                                                                                         
run;quit;                                                                                                                             
                                                                                                                                      
TMP[1]=1 TMP[2]=2 TMP[3]=2                                                                                                            
NOTE: DATA statement used (Total process time):                                                                                       
real time           0.47 seconds                                                                                                      
                                                                                                                                      
                                                                                                                                      
                                                                                                                                      
*___ __  __ _         ____             _                                                                                              
|_ _|  \/  | |       / ___|  ___  _ __| |_                                                                                            
 | || |\/| | |       \___ \ / _ \| '__| __|                                                                                           
 | || |  | | |___     ___) | (_) | |  | |_                                                                                            
|___|_|  |_|_____|___|____/ \___/|_|   \__|                                                                                           
                |_____|                                                                                                               
;                                                                                                                                     
                                                                                                                                      
proc iml;                                                                                                                             
   seed = 1234056;                                                                                                                    
   c = j(1000000, 1, seed);                                                                                                           
   b = ceil(1000000*uniform(c));                                                                                                      
                                                                                                                                      
   beg=datetime();                                                                                                                    
   call sort(b,{1});                                                                                                                  
   elap=(datetime()-beg);                                                                                                             
   print elap[format=12.5];                                                                                                           
                                                                                                                                      
   print (b[1:3]);                                                                                                                    
   print elap;                                                                                                                        
;quit;                                                                                                                                
                                                                                                                                      
    ELAP                                                                                                                              
                                                                                                                                      
 0.7320001                                                                                                                            
                                                                                                                                      
*____    ____             _                                                                                                           
|  _ \  / ___|  ___  _ __| |_ ___                                                                                                     
| |_) | \___ \ / _ \| '__| __/ __|                                                                                                    
|  _ <   ___) | (_) | |  | |_\__ \                                                                                                    
|_| \_\ |____/ \___/|_|   \__|___/                                                                                                    
                                                                                                                                      
;                                                                                                                                     
                                                                                                                                      
* make input same as above;                                                                                                           
filename bin "d:/bin/have.bin" lrecl=32000 recfm=f;                                                                                   
data _null_;                                                                                                                          
 array tmp[1000000] _temporary_;                                                                                                      
 do _n_=1 to 1000000;                                                                                                                 
    tmp[_n_] =ceil(1000000*rand('uniform'));                                                                                          
    file bin ;                                                                                                                        
    put tmp[_n_] rb8. @ ;                                                                                                             
 end;                                                                                                                                 
 stop;                                                                                                                                
run;quit;                                                                                                                             
                                                                                                                                      
NOTE: 250 records were written to the file BIN.                                                                                       
NOTE: DATA statement used (Total process time):                                                                                       
      real time           0.15 seconds                                                                                                
                                                                                                                                      
options ls=171;                                                                                                                       
                                                                                                                                      
%utl_submit_r64('                                                                                                                     
library(haven);                                                                                                                       
library(microbenchmark);                                                                                                              
library(data.table);                                                                                                                  
microbenchmark(read.from <- file("d:/bin/binmat.bin", "rb"));                                                                         
float <- readBin(read.from, n=1000000, "double");                                                                                     
close(read.from);                                                                                                                     
integer<-as.integer(float);                                                                                                           
microbenchmark(integerout<-sort(integer, method = "radix", index.return = FALSE),times=30);                                           
microbenchmark(radixout<-sort(float, method = "radix", index.return = FALSE),times=30);                                               
microbenchmark(quickout<-sort(float, method = "quick", index.return = FALSE),times=30);                                               
microbenchmark(shellout<-sort(float, method = "shell", index.return = FALSE),times=30);                                               
microbenchmark(rparout <- fsort(float));                                                                                              
microbenchmark(writeBin(radixout, "d:/bin/radix.bin", size=8));                                                                       
');                                                                                                                                   
                                                                                                                                      
  expr       Min         Q1     Mean  Median       Q3     Max   Runsl                                                                 
                                                                                                                                      
 readbin    43.458    45.51 50.82838 47.2215   50.644 268.616    100                                                                  
 writeBin 22.68074 23.69206 24.58991 24.5246 25.09879 32.5915    100                                                                  
                                                                                                                                      
                                                                                                                                      
                  Q1      Mean   Median       Q3       Min       Max                                                                  
                                                                                                                                      
 rparout     46.4193  49.59216  46.7222  47.6397  45.78407  136.2777 (100 runs)                                                       
 radxInt     75.5528  78.54976  77.9974  80.5097  74.15843   87.2394 (30 runs)                                                        
 radixFloat 180.6907  190.4046 185.9263 189.3155  180.0299  270.6139 (30 runs)                                                        
 quickSort  101.9230  108.0750 102.8029 110.2778  101.6667  186.1461 (30 runs)                                                        
 shellSort  169.6538  175.6991 169.8340 178.3241  169.3048  256.3592 (30 runs)                                                        
                                                                                                                                      
                                                                                                                                      
* very very fast - get R output back to SAS;                                                                                          
filename bin "d:/bin/radix.bin" lrecl=32000 recfm=f;                                                                                  
data _null_;                                                                                                                          
  infile bin;                                                                                                                         
  array tmp[1000000] _temporary_;                                                                                                     
  do i=1 to 1000000;                                                                                                                  
    input tmp[i] rb8. @;                                                                                                              
  end;                                                                                                                                
  put tmp[1]= tmp[2]= tmp[3]= tmp[1000000]=;                                                                                          
  stop;                                                                                                                               
run;quit;                                                                                                                             
                                                                                                                                      
TMP[1]=1 TMP[2]=1 TMP[3]=1 TMP[1000000]=1000000                                                                                       
                                                                                                                                      
NOTE: 250 records were read from the infile BIN.                                                                                      
NOTE: SAS went to a new line when INPUT statement reached past the end of a line.                                                     
NOTE: DATA statement used (Total process time):                                                                                       
      real time           0.08 seconds                                                                                                
                                                                                                                                      
                                                                                                                                      
                                                                                                                                      
