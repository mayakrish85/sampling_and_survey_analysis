*Day 1 = March 21, Day 2 = March 22, Day 3 = March 25, Day 4 = March 26, Day 5 = March 27;
*Measure each 24 hours before (collection March 20-March 26);
*LIBRARY IS THE STRATIFICATION VARIABLE;

*HSL;

libname sampling "/home/u59228083/BIOS664/Sampling Collection";
run;

data hslsrs;
    infile '/home/u59228083/BIOS664/Sampling Collection/HSL Sample Frame.csv' dlm=',' firstobs=2;
    length Day $10 Library $20 Room $20 Time $10 Time_Interval $20;
    input
        Day $
        Library $
        Room $
        Time $
        Time_Interval $;
run;

/*Step 1: sort data by stratification variable (time of day)*/
proc sort data=hslsrs; by Time_Interval; run;

/*Step 2: Select PROPORTIONATE stratified sample (stratfied by 'time of day') */
proc surveyselect data=hslsrs method=srs n=34 out = hsl_sample seed = 012620241 stats; 
	strata Time_Interval;
run;

*UL;

data ulsrs;
    infile '/home/u59228083/BIOS664/Sampling Collection/UL Sample Frame.csv' dlm=',' firstobs=2;
    length Day $10 Library $20 Room $20 Time $10 Time_Interval $20;
    input
        Day $
        Library $
        Room $
        Time $
        Time_Interval $;
run;

/*Step 1: sort data by stratification variable (time of day)*/
proc sort data=ulsrs; by Time_Interval; run;

/*Step 2: Select PROPORTIONATE stratified sample (stratfied by 'time of day') */
proc surveyselect data=ulsrs method=srs n=19 out = ul_sample seed = 012620241 stats; 
	strata Time_Interval;
run;


*Davis;

data davissrs;
    infile '/home/u59228083/BIOS664/Sampling Collection/Davis Sample Frame.csv' dlm=',' firstobs=2;
    length Day $10 Library $20 Room $20 Time $10 Time_Interval $20;
    input
        Day $
        Library $
        Room $
        Time $
        Time_Interval $;
run;

/*Step 1: sort data by stratification variable (time of day)*/
proc sort data=davissrs; by Time_Interval; run;

/*Step 2: Select PROPORTIONATE stratified sample (stratfied by 'time of day') */
proc surveyselect data=davissrs method=srs n=66 out = davis_sample seed = 012620241 stats; 
	strata Time_Interval;
run;