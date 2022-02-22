EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "PoE Stepper Driver"
Date "2022-02-22"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TMC429-I:TMC429-I U15
U 1 1 6293383B
P 2775 2300
F 0 "U15" H 3800 2600 60  0000 C CNN
F 1 "TMC429-I" H 3800 2500 60  0000 C CNN
F 2 "SSOP16_150MIL_TRI" H 3975 2540 60  0001 C CNN
F 3 "" H 2775 2300 60  0000 C CNN
	1    2775 2300
	1    0    0    -1  
$EndComp
Text GLabel 2725 3100 0    50   Input ~ 0
SPI1_SCK
$Comp
L power:GND #PWR027
U 1 1 62939459
P 4825 3075
F 0 "#PWR027" H 4825 2825 50  0001 C CNN
F 1 "GND" H 4830 2902 50  0000 C CNN
F 2 "" H 4825 3075 50  0001 C CNN
F 3 "" H 4825 3075 50  0001 C CNN
	1    4825 3075
	1    0    0    -1  
$EndComp
Wire Wire Line
	4775 3000 4825 3000
Wire Wire Line
	4825 3000 4825 3075
$Comp
L power:GND #PWR034
U 1 1 6293B082
P 8500 5625
F 0 "#PWR034" H 8500 5375 50  0001 C CNN
F 1 "GND" H 8505 5452 50  0000 C CNN
F 2 "" H 8500 5625 50  0001 C CNN
F 3 "" H 8500 5625 50  0001 C CNN
	1    8500 5625
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C?
U 1 1 6218906C
P 7850 2550
AR Path="/6218906C" Ref="C?"  Part="1" 
AR Path="/6293177D/6218906C" Ref="C17"  Part="1" 
F 0 "C17" H 7942 2596 50  0000 L CNN
F 1 "0.1uF" H 7942 2505 50  0000 L CNN
F 2 "" H 7850 2550 50  0001 C CNN
F 3 "~" H 7850 2550 50  0001 C CNN
	1    7850 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 62189079
P 7850 2425
AR Path="/62189079" Ref="#PWR?"  Part="1" 
AR Path="/6293177D/62189079" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 7850 2275 50  0001 C CNN
F 1 "+3V3" H 7865 2598 50  0000 C CNN
F 2 "" H 7850 2425 50  0001 C CNN
F 3 "" H 7850 2425 50  0001 C CNN
	1    7850 2425
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2425 7850 2450
$Comp
L power:+3V3 #PWR?
U 1 1 6218AB1A
P 2550 3850
AR Path="/6218AB1A" Ref="#PWR?"  Part="1" 
AR Path="/6293177D/6218AB1A" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 2550 3700 50  0001 C CNN
F 1 "+3V3" H 2565 4023 50  0000 C CNN
F 2 "" H 2550 3850 50  0001 C CNN
F 3 "" H 2550 3850 50  0001 C CNN
	1    2550 3850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 6218BE4E
P 1550 3125
F 0 "SW1" V 1625 3350 50  0000 C CNN
F 1 "STO_L" V 1550 3350 50  0000 C CNN
F 2 "" H 1550 3125 50  0001 C CNN
F 3 "" H 1550 3125 50  0001 C CNN
	1    1550 3125
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_SPST SW2
U 1 1 6218DF68
P 1850 3150
F 0 "SW2" V 1900 3000 50  0000 C CNN
F 1 "STO_R" V 1825 2950 50  0000 C CNN
F 2 "" H 1850 3150 50  0001 C CNN
F 3 "" H 1850 3150 50  0001 C CNN
	1    1850 3150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 62192B2C
P 2425 3325
F 0 "#PWR024" H 2425 3075 50  0001 C CNN
F 1 "GND" H 2430 3152 50  0000 C CNN
F 2 "" H 2425 3325 50  0001 C CNN
F 3 "" H 2425 3325 50  0001 C CNN
	1    2425 3325
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 3300 2425 3300
Wire Wire Line
	2425 3300 2425 3325
Text Label 4775 2700 0    50   ~ 0
STEP
Text Label 2775 3500 2    50   ~ 0
DIR
Text GLabel 2725 2500 0    50   Input ~ 0
SPI1_CS
Wire Wire Line
	2725 2500 2775 2500
Text GLabel 4825 2300 2    50   Input ~ 0
SPI1_MISO
Wire Wire Line
	2725 3100 2775 3100
Text GLabel 2725 3200 0    50   Input ~ 0
SPI1_MOSI
Wire Wire Line
	2725 3200 2775 3200
Wire Wire Line
	4775 2300 4825 2300
NoConn ~ 2775 3600
NoConn ~ 4775 2500
$Comp
L device:C_Small C14
U 1 1 6219FF35
P 2700 4125
F 0 "C14" H 2608 4171 50  0000 R CNN
F 1 "0.1uF" H 2608 4080 50  0000 R CNN
F 2 "" H 2700 4125 50  0001 C CNN
F 3 "~" H 2700 4125 50  0001 C CNN
	1    2700 4125
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2775 4000 2700 4000
Wire Wire Line
	2700 4000 2700 4025
$Comp
L power:GND #PWR026
U 1 1 621A3739
P 2700 4250
F 0 "#PWR026" H 2700 4000 50  0001 C CNN
F 1 "GND" H 2705 4077 50  0000 C CNN
F 2 "" H 2700 4250 50  0001 C CNN
F 3 "" H 2700 4250 50  0001 C CNN
	1    2700 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4225 2700 4250
Wire Wire Line
	2775 3900 2700 3900
Wire Wire Line
	2700 3900 2700 4000
Connection ~ 2700 4000
Wire Wire Line
	2550 3850 2550 3900
Wire Wire Line
	2550 3900 2700 3900
Connection ~ 2700 3900
Text GLabel 2725 2300 0    50   Input ~ 0
CLK_429
Wire Wire Line
	2725 2300 2775 2300
$Comp
L power:GND #PWR022
U 1 1 621E2D05
P 1700 3400
F 0 "#PWR022" H 1700 3150 50  0001 C CNN
F 1 "GND" H 1705 3227 50  0000 C CNN
F 2 "" H 1700 3400 50  0001 C CNN
F 3 "" H 1700 3400 50  0001 C CNN
	1    1700 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3325 1550 3400
Wire Wire Line
	1550 3400 1700 3400
Wire Wire Line
	1850 3350 1850 3400
Wire Wire Line
	1850 3400 1700 3400
Connection ~ 1700 3400
Wire Wire Line
	1850 2900 1850 2950
Wire Wire Line
	1850 2900 2775 2900
Wire Wire Line
	1550 2700 1550 2925
Wire Wire Line
	1550 2700 2775 2700
$Comp
L device:R_Small R23
U 1 1 621F05A6
P 1550 2500
F 0 "R23" H 1609 2546 50  0000 L CNN
F 1 "10k" H 1609 2455 50  0000 L CNN
F 2 "" H 1550 2500 50  0001 C CNN
F 3 "~" H 1550 2500 50  0001 C CNN
	1    1550 2500
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R24
U 1 1 621F9F83
P 1850 2500
F 0 "R24" H 1909 2546 50  0000 L CNN
F 1 "10k" H 1909 2455 50  0000 L CNN
F 2 "" H 1850 2500 50  0001 C CNN
F 3 "~" H 1850 2500 50  0001 C CNN
	1    1850 2500
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R25
U 1 1 62202E57
P 2125 2500
F 0 "R25" H 2184 2546 50  0000 L CNN
F 1 "10k" H 2184 2455 50  0000 L CNN
F 2 "" H 2125 2500 50  0001 C CNN
F 3 "~" H 2125 2500 50  0001 C CNN
	1    2125 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2600 1550 2700
Connection ~ 1550 2700
Wire Wire Line
	1850 2600 1850 2900
Connection ~ 1850 2900
Wire Wire Line
	2125 2600 2125 2800
Wire Wire Line
	2125 2800 2775 2800
$Comp
L power:+3V3 #PWR?
U 1 1 62208E6C
P 1850 2300
AR Path="/62208E6C" Ref="#PWR?"  Part="1" 
AR Path="/6293177D/62208E6C" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 1850 2150 50  0001 C CNN
F 1 "+3V3" H 1865 2473 50  0000 C CNN
F 2 "" H 1850 2300 50  0001 C CNN
F 3 "" H 1850 2300 50  0001 C CNN
	1    1850 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2400 1550 2350
Wire Wire Line
	1550 2350 1850 2350
Wire Wire Line
	2125 2350 2125 2400
Wire Wire Line
	1850 2400 1850 2350
Connection ~ 1850 2350
Wire Wire Line
	1850 2350 2125 2350
Wire Wire Line
	1850 2300 1850 2350
Wire Wire Line
	9500 3375 9525 3375
Wire Wire Line
	9525 3375 9525 3475
Wire Wire Line
	9525 3475 9500 3475
Wire Wire Line
	9525 3575 9500 3575
Wire Wire Line
	9500 3675 9525 3675
Wire Wire Line
	9525 3675 9525 3575
Connection ~ 9525 3475
Connection ~ 9525 3575
Wire Wire Line
	9525 3575 9525 3525
Wire Wire Line
	9500 3775 9525 3775
Wire Wire Line
	9525 3775 9525 3875
Wire Wire Line
	9525 4075 9500 4075
Wire Wire Line
	9500 3875 9525 3875
Connection ~ 9525 3875
Wire Wire Line
	9525 3875 9525 3925
Wire Wire Line
	9500 3975 9525 3975
Connection ~ 9525 3975
Wire Wire Line
	9525 3975 9525 4075
Wire Wire Line
	9500 4175 9525 4175
Wire Wire Line
	9525 4175 9525 4275
Wire Wire Line
	9525 4475 9500 4475
Wire Wire Line
	9500 4375 9525 4375
Connection ~ 9525 4375
Wire Wire Line
	9525 4375 9525 4475
Wire Wire Line
	9500 4275 9525 4275
Connection ~ 9525 4275
Wire Wire Line
	9525 4275 9525 4325
Wire Wire Line
	9500 4575 9525 4575
Wire Wire Line
	9525 4875 9500 4875
Wire Wire Line
	9500 4775 9525 4775
Connection ~ 9525 4775
Wire Wire Line
	9525 4775 9525 4875
Wire Wire Line
	9525 4575 9525 4675
Wire Wire Line
	9500 4675 9525 4675
Connection ~ 9525 4675
Wire Wire Line
	9525 4675 9525 4725
Wire Wire Line
	9525 3925 9625 3925
Wire Wire Line
	9625 3925 9625 4100
Wire Wire Line
	9625 4100 9775 4100
Connection ~ 9525 3925
Wire Wire Line
	9525 3925 9525 3975
Wire Wire Line
	9525 4325 9625 4325
Wire Wire Line
	9625 4325 9625 4200
Wire Wire Line
	9625 4200 9775 4200
Connection ~ 9525 4325
Wire Wire Line
	9525 4325 9525 4375
Wire Wire Line
	9525 3525 9725 3525
Wire Wire Line
	9725 3525 9725 4000
Wire Wire Line
	9725 4000 9775 4000
Connection ~ 9525 3525
Wire Wire Line
	9525 3525 9525 3475
Wire Wire Line
	9525 4725 9725 4725
Wire Wire Line
	9725 4725 9725 4300
Wire Wire Line
	9725 4300 9775 4300
Connection ~ 9525 4725
Wire Wire Line
	9525 4725 9525 4775
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 62931FC4
P 9975 4100
AR Path="/6292FF7A/62931FC4" Ref="J?"  Part="1" 
AR Path="/6293177D/62931FC4" Ref="J2"  Part="1" 
F 0 "J2" H 9947 3982 50  0000 R CNN
F 1 "Motor" H 9947 4073 50  0000 R CNN
F 2 "" H 9975 4100 50  0001 C CNN
F 3 "~" H 9975 4100 50  0001 C CNN
	1    9975 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8400 5575 8400 5600
Wire Wire Line
	8500 5600 8500 5575
Wire Wire Line
	8500 5600 8500 5625
Connection ~ 8500 5600
Wire Wire Line
	8400 5600 8500 5600
Wire Wire Line
	8500 5600 8600 5600
Wire Wire Line
	8600 5600 8600 5575
Text Label 7500 4975 2    50   ~ 0
STEP
Text Label 7500 5075 2    50   ~ 0
DIR
$Comp
L power:+12V #PWR033
U 1 1 622729F2
P 8500 1725
F 0 "#PWR033" H 8500 1575 50  0001 C CNN
F 1 "+12V" H 8515 1898 50  0000 C CNN
F 2 "" H 8500 1725 50  0001 C CNN
F 3 "" H 8500 1725 50  0001 C CNN
	1    8500 1725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 6227F9C4
P 7850 2675
F 0 "#PWR032" H 7850 2425 50  0001 C CNN
F 1 "GND" H 7855 2502 50  0000 C CNN
F 2 "" H 7850 2675 50  0001 C CNN
F 3 "" H 7850 2675 50  0001 C CNN
	1    7850 2675
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2650 7850 2675
$Comp
L power:GND #PWR035
U 1 1 62283BD0
P 9250 2725
F 0 "#PWR035" H 9250 2475 50  0001 C CNN
F 1 "GND" H 9255 2552 50  0000 C CNN
F 2 "" H 9250 2725 50  0001 C CNN
F 3 "" H 9250 2725 50  0001 C CNN
	1    9250 2725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 622AA972
P 9550 5200
F 0 "#PWR036" H 9550 4950 50  0001 C CNN
F 1 "GND" H 9555 5027 50  0000 C CNN
F 2 "" H 9550 5200 50  0001 C CNN
F 3 "" H 9550 5200 50  0001 C CNN
	1    9550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 5175 9550 5175
Wire Wire Line
	9550 5175 9550 5200
Text GLabel 7475 3475 0    50   Input ~ 0
CLK_2660
Wire Wire Line
	7475 3475 7500 3475
Text GLabel 7500 4475 0    50   Input ~ 0
SPI2_SCK
Text GLabel 7500 4675 0    50   Input ~ 0
SPI2_MISO
Text GLabel 7500 4575 0    50   Input ~ 0
SPI2_MOSI
Text GLabel 7500 4375 0    50   Input ~ 0
SPI2_CS
$Comp
L device:R_Small R27
U 1 1 6238B615
P 6100 3825
F 0 "R27" H 6159 3871 50  0000 L CNN
F 1 "22" H 6159 3780 50  0000 L CNN
F 2 "" H 6100 3825 50  0001 C CNN
F 3 "~" H 6100 3825 50  0001 C CNN
	1    6100 3825
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C15
U 1 1 6238BD65
P 6100 4075
F 0 "C15" H 6192 4121 50  0000 L CNN
F 1 "10nF" H 6192 4030 50  0000 L CNN
F 2 "" H 6100 4075 50  0001 C CNN
F 3 "~" H 6100 4075 50  0001 C CNN
	1    6100 4075
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R26
U 1 1 623914C8
P 5800 3875
F 0 "R26" H 5859 3921 50  0000 L CNN
F 1 "75m" H 5859 3830 50  0000 L CNN
F 2 "" H 5800 3875 50  0001 C CNN
F 3 "~" H 5800 3875 50  0001 C CNN
	1    5800 3875
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 62397C91
P 5950 4225
F 0 "#PWR028" H 5950 3975 50  0001 C CNN
F 1 "GND" H 5955 4052 50  0000 C CNN
F 2 "" H 5950 4225 50  0001 C CNN
F 3 "" H 5950 4225 50  0001 C CNN
	1    5950 4225
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3925 6100 3950
Wire Wire Line
	6100 3675 6100 3725
Wire Wire Line
	5800 3775 5800 3675
Wire Wire Line
	5800 3675 6100 3675
Wire Wire Line
	5800 3975 5800 4200
Wire Wire Line
	5800 4200 5950 4200
Wire Wire Line
	6100 4200 6100 4175
Wire Wire Line
	5950 4225 5950 4200
Connection ~ 5950 4200
Wire Wire Line
	5950 4200 6100 4200
Wire Wire Line
	6100 3950 6325 3950
Wire Wire Line
	6325 3950 6325 3775
Connection ~ 6100 3950
Wire Wire Line
	6100 3950 6100 3975
$Comp
L device:R_Small R29
U 1 1 623F4B4C
P 6825 4025
F 0 "R29" H 6884 4071 50  0000 L CNN
F 1 "22" H 6884 3980 50  0000 L CNN
F 2 "" H 6825 4025 50  0001 C CNN
F 3 "~" H 6825 4025 50  0001 C CNN
	1    6825 4025
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C16
U 1 1 623F4B52
P 6825 4275
F 0 "C16" H 6917 4321 50  0000 L CNN
F 1 "10nF" H 6917 4230 50  0000 L CNN
F 2 "" H 6825 4275 50  0001 C CNN
F 3 "~" H 6825 4275 50  0001 C CNN
	1    6825 4275
	1    0    0    -1  
$EndComp
$Comp
L device:R_Small R28
U 1 1 623F4B58
P 6525 4075
F 0 "R28" H 6584 4121 50  0000 L CNN
F 1 "75m" H 6584 4030 50  0000 L CNN
F 2 "" H 6525 4075 50  0001 C CNN
F 3 "~" H 6525 4075 50  0001 C CNN
	1    6525 4075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 623F4B5E
P 6675 4425
F 0 "#PWR029" H 6675 4175 50  0001 C CNN
F 1 "GND" H 6680 4252 50  0000 C CNN
F 2 "" H 6675 4425 50  0001 C CNN
F 3 "" H 6675 4425 50  0001 C CNN
	1    6675 4425
	1    0    0    -1  
$EndComp
Wire Wire Line
	6825 3875 6825 3925
Wire Wire Line
	6525 3975 6525 3875
Wire Wire Line
	6525 3875 6825 3875
Wire Wire Line
	6525 4175 6525 4400
Wire Wire Line
	6525 4400 6675 4400
Wire Wire Line
	6825 4400 6825 4375
Wire Wire Line
	6675 4425 6675 4400
Connection ~ 6675 4400
Wire Wire Line
	6675 4400 6825 4400
Wire Wire Line
	6100 3675 7500 3675
Connection ~ 6100 3675
Wire Wire Line
	6325 3775 7500 3775
Wire Wire Line
	6825 4125 6825 4150
Wire Wire Line
	6825 3875 7500 3875
Connection ~ 6825 3875
Wire Wire Line
	6825 4150 7050 4150
Wire Wire Line
	7050 4150 7050 3975
Wire Wire Line
	7050 3975 7500 3975
Connection ~ 6825 4150
Wire Wire Line
	6825 4150 6825 4175
NoConn ~ 9500 5075
$Comp
L power:GND #PWR037
U 1 1 6246A24C
P 9775 3100
F 0 "#PWR037" H 9775 2850 50  0001 C CNN
F 1 "GND" H 9780 2927 50  0000 C CNN
F 2 "" H 9775 3100 50  0001 C CNN
F 3 "" H 9775 3100 50  0001 C CNN
	1    9775 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3075 9525 3075
$Comp
L device:C_Small C23
U 1 1 62483CF6
P 9625 3075
F 0 "C23" V 9396 3075 50  0000 C CNN
F 1 "470nF" V 9487 3075 50  0000 C CNN
F 2 "" H 9625 3075 50  0001 C CNN
F 3 "~" H 9625 3075 50  0001 C CNN
	1    9625 3075
	0    1    1    0   
$EndComp
Wire Wire Line
	9725 3075 9775 3075
Wire Wire Line
	9775 3075 9775 3100
$Comp
L power:GND #PWR030
U 1 1 624936CE
P 7325 4075
F 0 "#PWR030" H 7325 3825 50  0001 C CNN
F 1 "GND" H 7330 3902 50  0000 C CNN
F 2 "" H 7325 4075 50  0001 C CNN
F 3 "" H 7325 4075 50  0001 C CNN
	1    7325 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	7325 4075 7325 4050
Wire Wire Line
	7325 4050 7475 4050
Wire Wire Line
	7475 4050 7475 4175
Wire Wire Line
	7475 4175 7500 4175
NoConn ~ 7500 4775
$Comp
L device:C_Small C18
U 1 1 624C2AA3
P 8500 2550
F 0 "C18" H 8325 2625 50  0000 L CNN
F 1 "220nF" H 8225 2475 50  0000 L CNN
F 2 "" H 8500 2550 50  0001 C CNN
F 3 "~" H 8500 2550 50  0001 C CNN
	1    8500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2675 8200 2450
Wire Wire Line
	8200 2450 7850 2450
Connection ~ 7850 2450
Wire Wire Line
	8500 2650 8500 2675
$Comp
L device:C_Small C20
U 1 1 624FC885
P 9100 2075
F 0 "C20" V 8950 1925 50  0000 C CNN
F 1 "10uF" V 9025 1900 50  0000 C CNN
F 2 "" H 9100 2075 50  0001 C CNN
F 3 "~" H 9100 2075 50  0001 C CNN
	1    9100 2075
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 2675 8800 2650
Wire Wire Line
	9200 2650 9250 2650
Wire Wire Line
	9250 2650 9250 2725
Wire Wire Line
	8500 1725 8500 1775
$Comp
L device:C_Small C22
U 1 1 62501E5F
P 9100 2650
F 0 "C22" V 8950 2550 50  0000 C CNN
F 1 "10uF" V 9025 2525 50  0000 C CNN
F 2 "" H 9100 2650 50  0001 C CNN
F 3 "~" H 9100 2650 50  0001 C CNN
	1    9100 2650
	0    1    1    0   
$EndComp
$Comp
L TMC2660_2:TMC2660C-PA U16
U 1 1 6221AF33
P 7500 3175
F 0 "U16" H 8500 2800 60  0000 C CNN
F 1 "TMC2660C-PA" H 8500 2675 60  0000 C CNN
F 2 "QFP_2660C-PA_TRI" H 8500 3515 60  0001 C CNN
F 3 "" H 7500 3175 60  0000 C CNN
	1    7500 3175
	1    0    0    -1  
$EndComp
$Comp
L device:CP1_Small C21
U 1 1 625835F8
P 9100 2350
F 0 "C21" V 9250 2500 50  0000 C CNN
F 1 "100uF" V 9175 2500 50  0000 C CNN
F 2 "" H 9100 2350 50  0001 C CNN
F 3 "~" H 9100 2350 50  0001 C CNN
	1    9100 2350
	0    -1   -1   0   
$EndComp
$Comp
L device:CP1_Small C19
U 1 1 62584D8C
P 9100 1775
F 0 "C19" V 9250 1925 50  0000 C CNN
F 1 "100uF" V 9175 1950 50  0000 C CNN
F 2 "" H 9100 1775 50  0001 C CNN
F 3 "~" H 9100 1775 50  0001 C CNN
	1    9100 1775
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8800 2650 9000 2650
Wire Wire Line
	8800 2650 8800 2350
Wire Wire Line
	8800 2350 9000 2350
Connection ~ 8800 2650
Wire Wire Line
	9200 2350 9250 2350
Wire Wire Line
	9250 2350 9250 2650
Connection ~ 9250 2650
Wire Wire Line
	9200 2075 9250 2075
Wire Wire Line
	9250 2075 9250 2350
Connection ~ 9250 2350
Wire Wire Line
	9200 1775 9250 1775
Wire Wire Line
	9250 1775 9250 2075
Connection ~ 9250 2075
Wire Wire Line
	9000 2075 8700 2075
Wire Wire Line
	8700 2075 8700 2675
Wire Wire Line
	8700 2075 8700 1775
Wire Wire Line
	8700 1775 8800 1775
Connection ~ 8700 2075
Wire Wire Line
	8500 1775 8600 1775
Connection ~ 8500 1775
Wire Wire Line
	8500 1775 8500 2450
Connection ~ 8700 1775
Wire Wire Line
	8800 2350 8800 1775
Connection ~ 8800 2350
Connection ~ 8800 1775
Wire Wire Line
	8800 1775 9000 1775
Wire Wire Line
	8600 2675 8600 1775
Connection ~ 8600 1775
Wire Wire Line
	8600 1775 8700 1775
$EndSCHEMATC
