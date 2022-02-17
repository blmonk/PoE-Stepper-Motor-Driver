EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ECE445:LT4293 U2
U 1 1 620EF4DF
P 9450 4125
F 0 "U2" H 9450 4590 50  0000 C CNN
F 1 "LT4293" H 9450 4499 50  0000 C CNN
F 2 "" H 9300 4575 50  0001 C CNN
F 3 "" H 9300 4575 50  0001 C CNN
	1    9450 4125
	1    0    0    -1  
$EndComp
$Comp
L ECE445:LT4321 U1
U 1 1 620EF4E5
P 8425 1975
F 0 "U1" H 7975 2625 50  0000 C CNN
F 1 "LT4321" H 8000 2525 50  0000 C CNN
F 2 "" H 8075 2525 50  0001 C CNN
F 3 "" H 8075 2525 50  0001 C CNN
	1    8425 1975
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C7
U 1 1 620EF4EC
P 9800 1875
F 0 "C7" H 9892 1966 50  0000 L CNN
F 1 "0.047uF" H 9892 1875 50  0000 L CNN
F 2 "" H 9800 1875 50  0001 C CNN
F 3 "~" H 9800 1875 50  0001 C CNN
F 4 "100V" H 9892 1784 50  0000 L CNN "Voltage"
	1    9800 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 1725 9800 1775
$Comp
L device:R_Small R9
U 1 1 620EF4F3
P 9475 1875
F 0 "R9" H 9534 1921 50  0000 L CNN
F 1 "0" H 9534 1830 50  0000 L CNN
F 2 "" H 9475 1875 50  0001 C CNN
F 3 "~" H 9475 1875 50  0001 C CNN
	1    9475 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	9475 1725 9475 1775
Wire Wire Line
	9475 1725 9800 1725
Wire Wire Line
	9475 1975 9475 2025
Wire Wire Line
	9475 2025 9025 2025
Wire Wire Line
	9025 2125 9175 2125
Wire Wire Line
	9800 1975 9800 2125
Text GLabel 9325 1500 2    50   Input ~ 0
PWRGD
Wire Wire Line
	9025 1925 9150 1925
Wire Wire Line
	9150 1925 9150 1500
Wire Wire Line
	9150 1500 9325 1500
Wire Wire Line
	9250 1825 9250 1725
Wire Wire Line
	9250 1725 9475 1725
Wire Wire Line
	9025 1825 9250 1825
Connection ~ 9475 1725
Text Label 8575 1300 1    50   ~ 0
BG36
Wire Wire Line
	8575 1300 8575 1375
Text Label 8475 1300 1    50   ~ 0
BG12
Wire Wire Line
	8475 1300 8475 1375
Text Label 8375 1300 1    50   ~ 0
POE_CT12
Wire Wire Line
	8375 1300 8375 1375
Text Label 8275 1300 1    50   ~ 0
TG12
Wire Wire Line
	8275 1300 8275 1375
Text Label 7750 1825 2    50   ~ 0
TG36
Wire Wire Line
	7750 1825 7825 1825
Text Label 7750 1925 2    50   ~ 0
POE_CT36
Wire Wire Line
	7750 1925 7825 1925
Text Label 7750 2025 2    50   ~ 0
POE_CT45
Wire Wire Line
	7750 2025 7825 2025
Text Label 7750 2125 2    50   ~ 0
TG45
Wire Wire Line
	7750 2125 7825 2125
Text Label 8275 2650 3    50   ~ 0
TG78
Wire Wire Line
	8275 2650 8275 2575
Text Label 8375 2650 3    50   ~ 0
POE_CT78
Wire Wire Line
	8375 2650 8375 2575
Text Label 8475 2650 3    50   ~ 0
BG78
Wire Wire Line
	8475 2650 8475 2575
Text Label 8575 2650 3    50   ~ 0
BG45
Wire Wire Line
	8575 2650 8575 2575
$Comp
L power:GND #PWR04
U 1 1 620EF51F
P 9175 2300
F 0 "#PWR04" H 9175 2050 50  0001 C CNN
F 1 "GND" H 9180 2127 50  0000 C CNN
F 2 "" H 9175 2300 50  0001 C CNN
F 3 "" H 9175 2300 50  0001 C CNN
	1    9175 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9025 2275 9175 2275
Wire Wire Line
	9175 2275 9175 2300
Wire Wire Line
	9175 2125 9175 2275
Connection ~ 9175 2125
Wire Wire Line
	9175 2125 9800 2125
Connection ~ 9175 2275
Text Label 10250 1725 0    50   ~ 0
VPORTP
Text Label 10250 2125 0    50   ~ 0
VPORTN
Wire Wire Line
	9800 1725 10250 1725
Connection ~ 9800 1725
Wire Wire Line
	9800 2125 10250 2125
Connection ~ 9800 2125
$Comp
L Transformer:TG111-MSC13LF TR1
U 1 1 620F0175
P 4050 3000
F 0 "TR1" H 4050 3967 50  0000 C CNN
F 1 "Transformer" H 4050 3876 50  0000 C CNN
F 2 "Transformer_SMD:Transformer_Ethernet_HALO_TG111-MSC13" H 4050 2150 50  0001 C CNN
F 3 "https://www.haloelectronics.com/pdf/discrete-genesus.pdf" H 4150 3950 50  0001 C CNN
	1    4050 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector:RJ45_Shielded J1
U 1 1 620FAD09
P 1575 2975
F 0 "J1" H 1245 2922 50  0000 R CNN
F 1 "RJ45_Shielded" H 1245 3013 50  0000 R CNN
F 2 "" V 1575 3000 50  0001 C CNN
F 3 "~" V 1575 3000 50  0001 C CNN
	1    1575 2975
	1    0    0    1   
$EndComp
$Comp
L power:GNDPWR #PWR01
U 1 1 620FC3DA
P 1775 2300
F 0 "#PWR01" H 1775 2100 50  0001 C CNN
F 1 "GNDPWR" H 1779 2146 50  0000 C CNN
F 2 "" H 1775 2250 50  0001 C CNN
F 3 "" H 1775 2250 50  0001 C CNN
	1    1775 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1775 2300 1775 2250
Wire Wire Line
	1775 2250 1575 2250
Wire Wire Line
	1575 2250 1575 2475
Wire Wire Line
	3550 2300 2075 2300
Wire Wire Line
	2075 2300 2075 2675
Wire Wire Line
	2075 2675 1975 2675
Wire Wire Line
	3550 2500 2200 2500
Wire Wire Line
	2200 2500 2200 2775
Wire Wire Line
	2200 2775 1975 2775
Wire Wire Line
	1975 2875 2525 2875
Wire Wire Line
	2525 2700 3550 2700
$Comp
L device:R_Small R1
U 1 1 62108EE3
P 2300 4125
F 0 "R1" H 2359 4171 50  0000 L CNN
F 1 "75" H 2359 4080 50  0000 L CNN
F 2 "" H 2300 4125 50  0001 C CNN
F 3 "~" H 2300 4125 50  0001 C CNN
	1    2300 4125
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R2
U 1 1 62109960
P 2675 4125
F 0 "R2" H 2734 4171 50  0000 L CNN
F 1 "75" H 2734 4080 50  0000 L CNN
F 2 "" H 2675 4125 50  0001 C CNN
F 3 "~" H 2675 4125 50  0001 C CNN
	1    2675 4125
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R3
U 1 1 6210AA79
P 3025 4125
F 0 "R3" H 3084 4171 50  0000 L CNN
F 1 "75" H 3084 4080 50  0000 L CNN
F 2 "" H 3025 4125 50  0001 C CNN
F 3 "~" H 3025 4125 50  0001 C CNN
	1    3025 4125
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R4
U 1 1 6210AA7F
P 3400 4125
F 0 "R4" H 3459 4171 50  0000 L CNN
F 1 "75" H 3459 4080 50  0000 L CNN
F 2 "" H 3400 4125 50  0001 C CNN
F 3 "~" H 3400 4125 50  0001 C CNN
	1    3400 4125
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C1
U 1 1 62111055
P 2300 4375
F 0 "C1" H 2392 4421 50  0000 L CNN
F 1 "0.01uF" H 2350 4300 50  0000 L CNN
F 2 "" H 2300 4375 50  0001 C CNN
F 3 "~" H 2300 4375 50  0001 C CNN
	1    2300 4375
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C2
U 1 1 62113F1C
P 2675 4375
F 0 "C2" H 2767 4421 50  0000 L CNN
F 1 "0.01uF" H 2725 4300 50  0000 L CNN
F 2 "" H 2675 4375 50  0001 C CNN
F 3 "~" H 2675 4375 50  0001 C CNN
	1    2675 4375
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C4
U 1 1 62114CB9
P 3025 4375
F 0 "C4" H 3117 4421 50  0000 L CNN
F 1 "0.01uF" H 3075 4300 50  0000 L CNN
F 2 "" H 3025 4375 50  0001 C CNN
F 3 "~" H 3025 4375 50  0001 C CNN
	1    3025 4375
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C5
U 1 1 621157D3
P 3400 4375
F 0 "C5" H 3492 4421 50  0000 L CNN
F 1 "0.01uF" H 3450 4300 50  0000 L CNN
F 2 "" H 3400 4375 50  0001 C CNN
F 3 "~" H 3400 4375 50  0001 C CNN
	1    3400 4375
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C3
U 1 1 6211D1B6
P 2875 4725
F 0 "C3" H 2967 4816 50  0000 L CNN
F 1 "1000pF" H 2967 4725 50  0000 L CNN
F 2 "" H 2875 4725 50  0001 C CNN
F 3 "~" H 2875 4725 50  0001 C CNN
F 4 "2kV" H 2967 4634 50  0000 L CNN "Voltage"
	1    2875 4725
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4475 2300 4575
Wire Wire Line
	2300 4575 2675 4575
Wire Wire Line
	2875 4575 2875 4625
Wire Wire Line
	2675 4475 2675 4575
Connection ~ 2675 4575
Wire Wire Line
	2675 4575 2875 4575
Wire Wire Line
	3025 4475 3025 4575
Wire Wire Line
	3025 4575 2875 4575
Connection ~ 2875 4575
Wire Wire Line
	3400 4475 3400 4575
Wire Wire Line
	3400 4575 3025 4575
Connection ~ 3025 4575
$Comp
L power:GNDPWR #PWR02
U 1 1 62122917
P 2875 4850
F 0 "#PWR02" H 2875 4650 50  0001 C CNN
F 1 "GNDPWR" H 2879 4696 50  0000 C CNN
F 2 "" H 2875 4800 50  0001 C CNN
F 3 "" H 2875 4800 50  0001 C CNN
	1    2875 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2875 4825 2875 4850
Wire Wire Line
	2300 4225 2300 4275
Wire Wire Line
	2675 4225 2675 4275
Wire Wire Line
	3025 4225 3025 4275
Wire Wire Line
	3400 4225 3400 4275
Wire Wire Line
	1975 3375 2400 3375
Wire Wire Line
	2400 3375 2400 3500
Wire Wire Line
	2400 3500 3550 3500
Wire Wire Line
	1975 3275 2625 3275
Wire Wire Line
	2625 3275 2625 3700
Wire Wire Line
	2625 3700 3550 3700
Wire Wire Line
	1975 2975 2925 2975
Wire Wire Line
	2925 2975 2925 3300
Wire Wire Line
	2925 3300 3550 3300
Wire Wire Line
	1975 3075 3150 3075
Wire Wire Line
	3150 3075 3150 3100
Wire Wire Line
	3150 3100 3550 3100
Wire Wire Line
	1975 3175 2775 3175
Wire Wire Line
	2775 3175 2775 2900
Wire Wire Line
	2775 2900 3550 2900
$Comp
L device:R_Small R5
U 1 1 6213ACF8
P 4675 4050
F 0 "R5" H 4734 4096 50  0000 L CNN
F 1 "75" H 4734 4005 50  0000 L CNN
F 2 "" H 4675 4050 50  0001 C CNN
F 3 "~" H 4675 4050 50  0001 C CNN
	1    4675 4050
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R6
U 1 1 6213ACFE
P 4925 4050
F 0 "R6" H 4984 4096 50  0000 L CNN
F 1 "75" H 4984 4005 50  0000 L CNN
F 2 "" H 4925 4050 50  0001 C CNN
F 3 "~" H 4925 4050 50  0001 C CNN
	1    4925 4050
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R7
U 1 1 6213AD04
P 5175 4050
F 0 "R7" H 5234 4096 50  0000 L CNN
F 1 "75" H 5234 4005 50  0000 L CNN
F 2 "" H 5175 4050 50  0001 C CNN
F 3 "~" H 5175 4050 50  0001 C CNN
	1    5175 4050
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R8
U 1 1 6213AD0A
P 5425 4050
F 0 "R8" H 5484 4096 50  0000 L CNN
F 1 "75" H 5484 4005 50  0000 L CNN
F 2 "" H 5425 4050 50  0001 C CNN
F 3 "~" H 5425 4050 50  0001 C CNN
	1    5425 4050
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C6
U 1 1 6213DC8E
P 5050 4375
F 0 "C6" H 5142 4466 50  0000 L CNN
F 1 "1000pF" H 5142 4375 50  0000 L CNN
F 2 "" H 5050 4375 50  0001 C CNN
F 3 "~" H 5050 4375 50  0001 C CNN
F 4 "2kV" H 5142 4284 50  0000 L CNN "Voltage"
	1    5050 4375
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR03
U 1 1 6213DC94
P 5050 4500
F 0 "#PWR03" H 5050 4300 50  0001 C CNN
F 1 "GNDPWR" H 5054 4346 50  0000 C CNN
F 2 "" H 5050 4450 50  0001 C CNN
F 3 "" H 5050 4450 50  0001 C CNN
	1    5050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4475 5050 4500
Wire Wire Line
	4925 4200 4925 4150
Wire Wire Line
	3550 3600 3400 3600
Wire Wire Line
	3400 3600 3400 3950
Wire Wire Line
	3550 3200 3025 3200
Wire Wire Line
	3550 2800 2675 2800
Wire Wire Line
	2675 2800 2675 3850
Wire Wire Line
	2525 2875 2525 2700
Wire Wire Line
	3550 2400 2300 2400
Wire Wire Line
	2300 2400 2300 3800
Text Label 1900 3750 2    50   ~ 0
POE_CT12
Text Label 1900 3850 2    50   ~ 0
POE_CT36
Text Label 1900 3950 2    50   ~ 0
POE_CT45
Text Label 1900 4050 2    50   ~ 0
POE_CT78
Wire Wire Line
	1900 3850 2675 3850
Connection ~ 2675 3850
Wire Wire Line
	2675 3850 2675 4025
Wire Wire Line
	3025 3200 3025 3900
Wire Wire Line
	1900 3950 2125 3950
Wire Wire Line
	2125 3950 2125 3900
Wire Wire Line
	2125 3900 3025 3900
Connection ~ 3025 3900
Wire Wire Line
	3025 3900 3025 4025
Wire Wire Line
	1900 4050 2175 4050
Wire Wire Line
	2175 4050 2175 3950
Wire Wire Line
	2175 3950 3400 3950
Connection ~ 3400 3950
Wire Wire Line
	3400 3950 3400 4025
Wire Wire Line
	1900 3750 2125 3750
Wire Wire Line
	2125 3750 2125 3800
Wire Wire Line
	2125 3800 2300 3800
Connection ~ 2300 3800
Wire Wire Line
	2300 3800 2300 4025
Wire Wire Line
	5175 4200 5175 4150
Wire Wire Line
	4925 4200 5050 4200
Wire Wire Line
	5175 4200 5425 4200
Wire Wire Line
	5425 4200 5425 4150
Connection ~ 5175 4200
Wire Wire Line
	4925 4200 4675 4200
Wire Wire Line
	4675 4200 4675 4150
Connection ~ 4925 4200
Wire Wire Line
	5050 4200 5050 4275
Connection ~ 5050 4200
Wire Wire Line
	5050 4200 5175 4200
Wire Wire Line
	4550 3600 4675 3600
Wire Wire Line
	4675 3600 4675 3950
Wire Wire Line
	4550 3200 4925 3200
Wire Wire Line
	4925 3200 4925 3950
Wire Wire Line
	4550 2800 5175 2800
Wire Wire Line
	5175 2800 5175 3950
Wire Wire Line
	4550 2400 5425 2400
Wire Wire Line
	5425 2400 5425 3950
Text Label 4600 2300 0    50   ~ 0
RX+
Wire Wire Line
	4550 2300 4600 2300
Text Label 4600 2500 0    50   ~ 0
RX-
Wire Wire Line
	4600 2500 4550 2500
Text Label 4600 2700 0    50   ~ 0
TX+
Wire Wire Line
	4550 2700 4600 2700
Wire Wire Line
	4550 3300 4600 3300
Text Label 4600 3300 0    50   ~ 0
TX-
$EndSCHEMATC
