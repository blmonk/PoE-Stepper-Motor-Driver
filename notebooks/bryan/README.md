# ECE445 Lab Notebook
## Bryan Monk - blmonk2
### Group 28
### Project: Universal PoE Stepper Motor for Argonne National Lab
### Spring 2022

# Week of 2/7

Since we got our project approved last week, the goal for this week was to come up with a plan for the general design of our project and the specific systems required in order to create our project proposal.

As a brief overview, our project is a power over ethernet (PoE) stepper motor driver. The aim is to be able to control stepper motors remotely, with both communications and power being provided on one cable for a clean, compact design.

From the idea’s conception we knew that we were going to use the Analog Devices DC2911A eval board as a starting point for our design. This is an eval board that features the LT4293 PoE PD controller and the LT4321 diode bridge controller. Essentially, this board provides a reference design to handle the negotiations necessary for PoE. This separates data and power, making the data available to travel to an ethernet PHY and the 48V power available to be used for any purpose. I already had this eval board in my possession from Argonne, and it can provide up to 90W of power (including various standards up to that level), so it was perfect for our design. Argonne has PoE+ (30W standard) network switches widely installed throughout the beamline, and PoE++ (60W standard) switches becoming more and more available, so we wanted to make these two standards available in our design. On the DC2911A, the specific standard is chosen with jumpers between pin headers, so we planned to do the same, just with fewer headers.

![alt text](https://lh4.googleusercontent.com/SHGeVG8f4AlZGenopEQu4l8XiMbwSJ4f4K_L9Ed71iLE5jgYfm1wMD_5TGtFber1S_KOoKrZ6wJ9DwyPIXiOQFgQjl5jvgW2M87hPofN6_9kGhsz4R1ochCKeoFMf4hd0xtJBOhpA4zfDMpC_A)

For controlling the motors, we knew that the drivers had to be highly accurate to actually be useful for Argonne, as extremely precise alignments are necessary. One brand of driver that Argonne uses a fair amount is Trinamic Motion Control. This is a German company that provides driver ICs and embedded solutions for laboratory automation purposes. We started by looking at one of the block diagrams for one of their most powerful single-axis drivers.

![alt text](https://lh5.googleusercontent.com/ckPZuUDaqI4aREJBaC80YuMSLVpAr-m3XJVzzxNrJZbkb6nEdl7DYlg00s-a9dzEtWbl8GExF8_zj3hgLmNWEE3AWI7bwIx5Fof6eE42NPXmCn07Z-JQtebui80dCPKEX5wbxr13qAyaP8DagQ)

This is the TMC-1161, whose block diagram is shown above. Serial communication to a MCU is interpreted into SPI commands into the TMC429 motion controller. This does the heavy lifting in terms of ramp calculations and creating smooth acceleration in the form of a STEP/DIR output, which controls the TMC262. The TMC262 is a gate driver IC, which pulses the gates of the MOSFET driver stage with the right timings to step the motor.

For our design, we decided to use the same TMC429 chip. While this is not explicitly necessary and the MCU could directly produce STEP/DIR pulses, it takes some of the work off our shoulders since we don’t have to worry about complex calculations and timing in the code or use look-up tables. It should be more accurate as well. For the actual motor driver, we decided to swap out the TMC262 + MOSFETs with the TMC2660C driver IC. Trinamic creates ICs that combine both the gate driver and FETs into a single IC. This simplifies board design, but there is a slight tradeoff in power, as the 2660 can only provide 2.8A per motor phase. However, this is more than enough for the vast majority of motors at Argonne.

With this information, we created our rough block diagram, shown below.

![alt text](https://lh3.googleusercontent.com/izQzx3uif8x0pun_RISvk-K9CMPPMS6ZqriHCiJ7vHdfn4-tXk_wFIXM8zpC0vOpk8apbshbm7ogWX0ITiK_x938CX9EANQPhA4NnKRxixGmuLXEQxdyPMCAJfnLTRqMoihnBI-Ec0k5LdgGxA)

References:

“LT4293IDD, LT4321IUF DEMO CIRCUIT 2911A,” 2018, https://www.analog.com/media/en/technical-documentation/eval-board-schematic/DC2911A1-SCH.pdf

TMCM-1161 Product Information Page:

https://www.trinamic.com/products/modules/details/tmcm-1161/

# Week of 2/14

This week was focused on creating the ethernet schematic and diving more in depth on PoE and how it works.


We mainly followed the schematic from the DC2911A eval board. I essentially used the same schematic with some changes. First, there are some components labeled as optional, which I left out. Second, there is a box surrounding some components that is labeled for lab testing only and not necessary for the final design, which I also omitted. Third, I only added jumpers for PoE class 4 and 6 (PoE+ and PoE++). Finally, on the right side of the transformer, the data signals go to another RJ45 port for output, however, we want to route these directly to a PHY. Therefore, I left these open for the time being.


Below is the schematic for the DC2911A:

![alt text](https://lh3.googleusercontent.com/4JoDxzn-r7se9pbTH8aa9HwofO6ckp1VvlJJNvCntgK18JDQw0tVIPA_vtJpa3ZlJJ9dWGxTYluLMKfECY1PT7xBNJKT2xvuvaK3FV85dpwG_Pq6I0mZngyfFeqYvWOXO2XplPCaauwJVPw1Wg)
![alt text](https://lh3.googleusercontent.com/sMLnk1sUY9O7jUEOBcxzjmUeqYKACHcI-8E_QB-Uyv_NKyOEif03Sl1w2HlOkl1W8LchEnBkV2c7ctcztAISGczgjs24Ltkm3WDv4b6Di4YYiVn6dVBaoqr27GByYaZ_wPJvYTXF_DiaYw9w6w)

For comparison, our ethernet schematics are shown below:

![alt text](https://lh6.googleusercontent.com/0wvO3ihWMM9nuNrbZXINW_I9MoD8Bt0Hhu7rTQAfXVKt1yioGTKXrbOzD6w84zeAWEj1DCLPrGAMYgoKERsI0geWh2Nj6eiI0VTQWhPoidCDbFdkIPjaa03mGamfkDBOAj0cU7Ax24yvg7FAZw)
![alt text](https://lh4.googleusercontent.com/F5hkg098jOFqJgCBI6kXAcEaYtNroGJH1jVRxMFxAK5klQPSKsbtWE-VqgT41QXiv4PpLsecvOzYNOjJOKodpOX_bpgwNUnFmqe9-qCeRqjV6SD8FnIgu7cImNGPEXc_d7-8XrdrqUNQCwyx_w)
![alt text](https://lh6.googleusercontent.com/LGf6sSq9XxTTNIHk6-H7rdaxTAIGgB14oz0LN0qFWZIGLC-IMnM4Oiiws0sCfwYD9bmV0E98F-qSxJZv5fRiQbT0xZ8lqAjaTrRITvhahPvqCKf-hNu1uV_8cJdeoo2wc0BQEKD2Zd2-AlNI3w)

To make sense of these schematics, I briefly read the datasheets of the LT4293 and LT4321. First, the diode bridge controller is necessary since power can come on different pins and polarities depending on which standard is used. +48V will be connected to one of the “POE_CT” nets on the transformer circuit, and so will GND. A passive diode bridge rectifier could be used, but this is not as power efficient as active MOSFETs, which is why the diode bridge controller (LT4321) is needed. Each POE_CT signal connects between the drain and source of two n-channel MOSFETs, as well as inputs into the diode bridge controller. The diode bridge controller senses which pins the power is coming in on and subsequently drives the gates of the top and bottom MOSFETs so that positive power is output onto “VPORTP” and ground is connected to “VPORTN”.


We’re still unsure as to what PHY we will be using, although a strong possibility is the LAN8671. This, along with pretty much any standard 10/100 ethernet PHY is out of stock due to the parts shortage, so we will probably have to desolder one from somewhere.


References:


“LT4293IDD, LT4321IUF DEMO CIRCUIT 2911A,” 2018, https://www.analog.com/media/en/technical-documentation/eval-board-schematic/DC2911A1-SCH.pdf


# Week of 2/21


This week was focused on finishing up the schematics and also deciding what PHY and MCU to use.


The next part of the schematic that I focused on since we were certain about the parts was the motor control subsystem. This consists of two main ICs: the TMC429 motion controller and the TMC2660C driver IC. We used the TMC429-I, which is the smallest of 3 possible packages (16-pin as opposed to 24 or 32). The other packages only really contain features necessary for driving multiple motors, and this was also the only version in stock on Digi-key, which is why we chose this chip.


I started with the TMC2660. Following the datasheet, SPI is needed to initialize the chip and configure key parameters, while the STEP/DIR interface is needed to actually drive the motor. This chip can also operate in SPI mode (accepting motor commands through SPI), although this is less accurate. The datasheet gives guidelines on capacitors on the power inputs, such as a 10uF ceramic cap along with a 100uF electrolytic cap in parallel on VSA and VSB, a 220nF cap between VHS and 12V, and a 470uF cap between 5VOUT and GND. A 16 MHz oscillator is recommended, and I plan to use a timer on the MCU.

![alt text](https://lh5.googleusercontent.com/VXThTNfhdIS-v1VKZzKhG-jbO8ySmmoWq1rHixQBAcm09yakUFilh32JfEm1UpNxEbd3H5u3E41OiXiAnmvu_fVUfR5u7vtEm0vQtl5oTeVnFlGA5CnRReXyyUjBmAukzJg_0BA_5sj2oU6RjA)

To finish the schematic, we also needed to figure out what ethernet PHY and MCU to use. After some searching, we finally landed on the STM32F407 for the MCU and the TI DP83848 for the PHY. This was for a couple of reasons. The first was that development boards containing the DP83848 were pretty cheap compared to other options. Since we needed to desolder this part for our board, we would potentially need more than one, and this would not be feasible if the board was expensive. Secondly, I already had in my possession a dev board for the STM32F407. This is one the of the STM32 chips with an integrated ethernet MAC. Finally, there are ethernet examples online for the exact same STM32 dev board I had working with the DP83848 module, so our thought process was that we could first recreate the ethernet examples with these boards to narrow any potential problems down to either hardware or software. With these boards, we could also write the ethernet software in parallel to the hardware development and have something to work on while creating and waiting for our PCB.

Additionally, this week I had a meeting with Guy Jennings, a software engineer at Argonne who also works a lot with the hardware involved in beamline control. We discussed what the end goal would be to make sure I was on the right track. First, I wanted to make sure that our choice of driver provided enough current to be considered “universal”. Guy said that providing 2.8A per phase would be enough to cover 80-85% of all stepper motors at Argonne. Additionally, it’s not that common to drive a stepper at max current all the time anyway. Next, there were two potential options for the control software used to control our device in the end. The first is EPICS, which is considered more general, but would most likely require our device to run some kind of OS due to its architecture. Obviously, a standard MCU, even as powerful as an ARM Cortex M4, would not be able to run an OS like this. As a result, SPEC was the clear option, which Guy also prefers to use. This is a program that runs a simple terminal interface that allows users to send control commands to devices on the beamline.



# Week of 2/28

My goal for this week was to get most of the PCB layout done in preparation for the order next week. This was quite challenging, as none of us have created a PCB this complex in the past. While I mainly worked on this, Armando and Rindra finalized the parts list. Unfortunately, a few parts were unavailable through digikey or mouser. These included the PoE MOSFETs, the MCU, the TMC2660, the PHY, and the LT4321. We decided to buy these ourselves from various sources. We also found alternatives for the PoE MOSFETs.


I started with the layout for the ethernet subsystem, as this was by far the most involved area in the layout. We used the DC2911A layout as a general guideline, looking at the gerber files and trying to decipher them. Since this was a 6 layer board, and our board is 2 layers, we mainly just referenced the general component placement, and routed as we saw necessary. Due to the high component density, we had to use many vias. One thing to pay attention to was the routing of the traces that would actually be carrying power, namely the POE_CT signals. For these we were able to use planes in combination with thick traces, which can be seen below:

![alt text](https://lh3.googleusercontent.com/JHr_hV1BOOjX20L-edu0e4WJYZEMQglLOACSrPkmojjmIiLssd2VvhI4ikRVJXp_o0V8ZyjysijlI8kuu_ynAs-9yVLmyVXU2Xi5_uABL1NUBhOKzH2LZhmdaQTn5iNsDIrwQ6Tr_BiME_bcTA)

The VPORTP and VPORTN nets will also carry the full power, and I used the bottom layer primarily as a plane for VPORTN and the top layer mainly for the VPORTP plane.


Unfortunately, one of the components we were forced to use was a QFN package: the LT4321. None of us have had much experience SMD soldering, let alone soldering with hot air, so we expect this to be a challenge. We are considering using a stencil and solder paste to solder this component, but I think we will end up trying to solder by hand to be as economical as possible.


# Week of 3/7

This week it was necessary to finish the PCB layout in order to submit our board for the 1st round order.


Rindra created an initial draft of the motor control subsystem layout. This used thick traces to connect the TMC2660 to the motor. However, after further looking at the datasheet for this chip, we decided to follow their example board layout more closely and use planes for each motor connection. The final layout for the TMC2660 can be seen below:

![alt text](https://lh4.googleusercontent.com/8_t1ddzqvaAECXTqhlgX8K8gK3ZBODqi9G-Are46IKfM9Zcy7ZD6102CliFnYiMLD0CQC-HAGkVF3RM-u8wbafj5D5aYkho1bD0dkSxJFlLHeqXLKKaRkTZLX2chtmkvxv3vZri4YUj2Zn4eNQ)

As you can see, 4 planes are placed on the bottom layer of the PCB with vias to transport the current from the top layer to these planes. The planes are then routed to the motor connection with thick traces. The full motor current will also be running through the sense resistors, R28 and R26, in order for the TMC2660 to measure the motor current. As a result, these are large 2W resistors.


After laying out these two subsystems, the rest of the layout was more or less straightforward. One consideration for the ethernet subsystem was to keep the traces for each data pair (Rx and Tx) approximately the same length in order to keep the impedance the same. These travel from the transformer to our PHY. We then placed our MCU and remaining components.


To keep our board within the 100x100mm limit, we decided to put the power components on a separate board. Since our 12 DC/DC converter is so large, it didn’t make much sense to use valuable board space for this component. We plan to connect this board to our main board with simple jumper wires.This board can be seen below:

![alt text](https://lh5.googleusercontent.com/i97K0IK3UGWcZxP2yRyY43lqBDhnPPxyNQCCiXG92Nxu6QXZ6OIo-85pw4HG3UVaOa9NIbzcj13n0xgvzvovwC_2f7Tz7goQjcnIPhVdQVdtYZsFf-wVwyQd0nXeaAjxWLOmppv-Wa3GceUcTg)

Thankfully, we were able to pass the PCB audit before the deadline for both our PCBs, and submitted the order successfully. We also sent out a digikey order for the majority of our parts, which we will start soldering after spring break when we receive them along with our PCBs.


# Week of 3/21


This week we mainly focused on soldering our PCB. Armando and I were responsible for this, although I focused more on the ICs with large pin count and those that required hot air soldering. Given the quantity of components on our board and some of the packages, this was a considerable undertaking and took the entire week. We first started by soldering the basic surface mount components such as resistors and capacitors. The method for soldering these was as follows:


Tin one of the pads on the PCB.
Use tweezers to place the component on the board and use a soldering iron to reflow the tinned pad to secure the component on the board.
Apply solder to the other pad.
If joints are messy or have an excess of solder, use flux and touch joint with a clean soldering iron, causing the excess solder to flow onto the soldering iron

I found it efficient to solder the components in groups, soldering one pin of many components to secure them all and then returning afterwards to solder the second pad.


After the basic components, we moved onto the large ICs. We started with the TMC2660C chip because this is a rather large 10x10mm QFP-44 package. As a result the pin pitch is pretty large and thus easy to solder. Our process for soldering these components was:


Place the component on the footprint.
Apply a generous amount of flux to all of the pins.
Apply some solder to the soldering iron (using a flat tip).
Solder a few pins on one side to secure the component.
Solder the other sides by repeating step 3 and dragging the tip across the pins. The flux will keep the solder from bridging between pins (for the most part)
Apply more flux and return to solder the first side of the component
To fix any bridges, apply flux to the area and touch with a clean soldering iron. If this doesn't work, then use some solder wick for excess solder.

One thing I found was that the flux paste worked much better than the flux pen. Not only did it help the solder flow better, but it also worked to keep the ICs in place due to its thick consistency.


The most challenging components to solder were those that required the use of hot air. These included the LT4321 diode bridge controller, which is a 4x4mm QFN-16 package, and the MOSFETs, which were an LFPAK33 package. I think next time, I might want to try solder paste and hot air, but my process for these chips was the following:


Apply flux to the entire footprint.
Put some solder on a soldering iron and tin all of the pads on the footprint.
Put the chip onto the pad.
Heat with hot air at 380C until the solder reflows.
Check that the solder is fully melted and that the chip is in place by tapping with some tweezers. If it is fully melted, then the chip should pop back into place due to the surface tension of the solder.
Take away heat, inspect with a microscope.

In the case of the QFN chip, it looked as though some of the pins didn’t make a full connection with the pad. While it’s possible that the connection was just under the IC, I wanted to make sure so I applied flux and ran a tinned soldering iron along the edges. This made the connection visible and ensured that the joint was solid.


We also ordered a 2nd DP83848 PHY dev board since we will have to desolder this part from an external source. We will solder this part next week.



# Week of 3/28


The goals for this week were to finish up soldering and to start initial testing of the hardware.


This week we received the 2nd PHY module and soldered this, in addition to the last couple headers.


To test that we could successfully program our STM32 with the ST-Link via the SWD interface, we wrote a simple program to blink one of the status LEDs on the board. We used the STM32CubeIDE and configured the status LED pins as GPIO outputs. In the main loop, we used the HAL library to toggle the GPIO pin and delay for a short period. At first, the program downloaded successfully according to the IDE, however, nothing happened. After looking through the software, we realized that we had chosen the wrong MCU in our project. We had selected the STM32F407VGT instead of the STM32F407VET, which has a slightly different flash size. After creating a new project with the new chip, our program now downloaded and the LED blinked as it should.


We conducted our first PoE power test which was to simply plug our board into our PoE network switch. Since there is no programming/configuration of the PoE circuitry other than the headers to choose between the PoE+ and PoE++ standards, this should've resulted in 48V being provided to our board as the PD controller mediates the PoE negotiation. Unfortunately, nothing happened when we plugged in our board, testing both the PoE+ and PoE++ ports. We measured the voltage across the ethernet power pins and found that there was no voltage across them. My first thought was that the PoE negotiation wasn’t taking place, so either the LT4321 (diode bridge controller) or LT4293 (PD controller) could be faulty. In addition, we used different MOSFETs than the ones on the DC2911A eval board that we referenced, so this could be the culprit. To verify the LT4321 was working, I desoldered this chip from both our board and the DC2911A eval board and swapped them. Plugging the eval board into our network switch, it powered up normally. This showed that both LT4321s were working correctly. Unfortunately, the IC package that we used for the LT4293 on our board was different from the one on the eval board since we opted for the MSOP instead of DFN (actual pins vs. a flat pack). As a result, I could not conduct the same test. However, I did do this same procedure with the 9 MOSFETs on the board. Similarly, the eval board powered up fine after I switched out the FETs, which our board still did not.


I’m now thinking that the problem might be the actual PD controller. After inspecting under the microscope, all of the soldering looked fine. My plan is to read the datasheet for this IC in depth and fully understand the PoE negotiation, and then conduct further testing next week.





# Week of 4/4


The main objective that I had for this week was to figure out what was wrong with the PoE circuitry and hopefully fix it. In parallel, Armando mainly focused on the motor control subsystem while Rindra worked with ethernet communication.


Fortunately, we succeeded in diagnosing the PoE issues. After reading the datasheet of the LT4293 PD controller, we realized there should be some voltage on the ethernet pins even if the PoE negotiation was unsuccessful. The datasheet details what should occur in a standard negotiation.


From the datasheet: “During detection, the PSE looks for a 25k signature resistor which identifies the device as a PD. The PSE will apply two voltages in the range of 2.7V to 10.1V and measure the corresponding currents… The PSE calculates the signature resistance using a ∆V/∆I measurement technique.”


The datasheet then explains that the PSE applies a classification voltage of 14.5-20.5V and then measures the current response. If this is correct, the PSE brings the voltage down to a “mark” to signify the end of the first classification test. For PoE+ and PoE++, there should be 3 of these classifications.


Below shows what a negotiation should look like:

![alt text](https://lh5.googleusercontent.com/mjTeoAVKo1lHEV-x4MYAMCliMPXMofCE12cOPmagkcW8ajAqg7LoZ_JW4p7XZxv5ki1dbO8fHxyCXFaiuT0gqswri7k4QFBhewOa6EIdcMPb-_WMVq5M1B3nQ24KexK83BXH2E-ZbmRAiHDpNQ)


Ignoring the class and mark voltages, we should be seeing the initial detect voltages because these will be applied no matter what.


With this information, we decided to monitor the voltage with an oscilloscope. First, we soldered wires to the pins responsible for power in the PoE++ standard, which are pins 4, 5, 7, and 8. Pins 4 and 5 are responsible for DC+ (+48V) and pins 7 and 8 are responsible for DC- (GND). When plugging our board into the PoE network switch, we found no change in voltage whatsoever. This was alarming, as we expect voltages between 2.7V and 10.1V for the PoE detect sequence.


From using the DC2911A LT4293/LT4321 eval board, we knew that our PSE (network switch) was functioning correctly. This means that somehow the voltage is not getting through our RJ45 port. This finally brought us to the problem. When choosing parts, we naively thought that all RJ45 ports were more or less created equal. As it turns out, some ports have an internal transformer to simplify PCB layout, including the part we chose, the WIZnet J1B1211CCD. This is what the internal schematic looks like:

![alt text](https://lh4.googleusercontent.com/ZA-zR9HoOKKQ3pEZWw5XZeWcWro8p_Qb6D4DFf4k1Bszd26bXUuIbXM_jE8gyADAKnv2Ge0HwRGmImiTOcvA75Sx2prALA92SFB3SzCHvY-CdFdkuAUG_WnGpHuQt-h47hQAHrzWGShDMIKIzA)

For normal ethernet applications, this would be helpful. However, it completely prevents PoE from functioning. The DC 48V for PoE has no way of transmitting through the transformer like normal AC ethernet signals, which explains why we were getting no voltage response.


Using hot air, we desoldered our ethernet port and swapped it out with one of the ports from the DC2911A board. After plugging our board into the network switch, an amber light appeared next to the port on the switch. According to the datasheet of our network switch, this means that a “PoE fault” has occurred for any number of reasons. This occurred while the headers on our board were in the PoE++ setting, so we then switched the headers to PoE+ mode. Interestingly, this resulted in the LED signifying 48V lighting up on our board, and a green light on the network switch signified that PoE was working correctly. To verify, we measured just over 50V on the ethernet pins of our board with a multimeter.


At first we were puzzled as to how one standard could work while the other didn’t. Since one worked, that meant the PD controller was sending negotiation signals and that the diode bridge controller was passing the voltage through and correctly controlling the gates of the FETs at least for one standard. Therefore, we thought the most likely cause was a fault in the components specific to the PoE++ standard. We first checked the RCLASS resistors which are connected to the jumpers and to the PD controller. The values of these resistors select between PoE+ and PoE++. The value of these resistors were correct according to the multimeter.


I remembered that different PoE standards can have different pinouts. For 10/100 ethernet, there are 2 main pinouts:

![alt text](https://lh4.googleusercontent.com/uVwS7NZPhkRZVjib_tTF2hTmFjSuBaHYp7jfVgnJDTnwqXB9snRaxJpY_H6Jbi4tAi-FMQ4XdXE6Urjlp7eXKHMRBpDdd5LyUOyhw_36j0rmbpC0G7DCZvusrStb6-uV_-8swDJDJ7t9eSCQlw)

started probing for continuity on the MOSFETs controlled by the diode bridge, as some of these are only active in mode A and some only in mode B. Sure enough, one of them was shorted across the drain and source. My hypothesis is that this was caused by heat damage when I desoldered these from the eval board, as unleaded solder was used, requiring high temperatures >400C for desoldering. Fortunately, we had a few extra MOSFETs, so I replaced the faulty one. After this repair, both standards were able to successfully power up the board when connecting to the network switch.


References:


“LT4293IDD, LT4321IUF DEMO CIRCUIT 2911A,” 2018, https://www.analog.com/media/en/technical-documentation/eval-board-schematic/DC2911A1-SCH.pdf


“LTPoE++/IEEE 802.3bt PD Interface Controller,” 2019,

https://www.analog.com/media/en/technical-documentation/data-sheets/lt4293.pdf


RJ45 port schematic:

https://www.wiznet.hk/en/index.php?controller=attachment&id_attachment=2

# Week of 4/11


This week’s objective was to get the motor control subsystem working with basic commands. Rindra also focused on ethernet communication, trying to get our STM32 dev board working with the DP83848 waveshare module.


Unfortunately, during one session of debugging with our board, suddenly the 3.3V status LED went out, and we used a multimeter to verify that 3.3V was no longer being supplied to our board, while 12V was. Sure enough, we used the continuity function and found that there was a short between 3.3V and GND. To find the location of this short, the ideal method would be to use a thermal camera while power is supplied to see the location that is giving off the most heat. However, we did not have one of these, so we looked for a different procedure. Our method was to provide some voltage to the board and then measure the voltage drop across components with a multimeter. Since there are many decoupling caps throughout the board, we mainly measured the voltage across these. Since board traces have a nonzero impedance, the closer you are to the short on the board, the lower the voltage drop will be across the component measured. We found that this was smallest near the ethernet PHY, and this was confirmed when we desoldered the PHY and the board was able to power up again. From Rindra’s research, there is a good chance that this was the result of transient voltages from the PoE coupling through the transformer. However, we set this aside for the time being and started to work on motor control.


The first step in getting the motor to run was to configure the TMC2660 motor driver chip. In order to unit test this chip and not have to rely on the TMC429 to send step/dir pulses, we decided to use an Arduino to send step/dir signals directly to the TMC2660. Unfortunately, we forgot to add headers for the step and direction pins, so we had to solder wires directly into the pins on the 2660. This wasn’t an impossible task, as the pin pitch on this IC is rather wide.


Armando was mainly responsible for the motor driving code, first trying to use Trinamic’s API. However, this had many levels of abstraction since it’s meant for many different Trinamic drivers, so it was pretty hard to read. We decided to start building our own drivers.


We read the datasheet to figure out what commands to send this chip to initialize it with SPI. Each register is 20 bits, but we have to send a byte at a time, so to write to each register we write 3 bytes. This is no problem, since only the last 20 bits of data sent are recognized.

![alt text](https://lh5.googleusercontent.com/Z-RTlfj8IsgimxQjL0Ox7ya9T2vo3tq6iamxRDz3_IUvjNNFvxtSw1Erhp2ADTv7vGZKE9Q6O2QyuNv1bYGbdrot8ZGde-iBHH_o0CUB5Bex3CFP0qjd1P1M9XMW_sFWjQ8az3nAi93cKqf9tw)

The six registers on the TMC2660 are shown above. To point out a few of the most important registers, first, the DRVCONF configures safety features like short to ground detection, shutdown at 150C, and motor damping. Most importantly, the SDOFF bit determines if the chip is in step/dir mode or SPI mode. SPI mode is for writing the coil currents directly via SPI. We don’t want this, we need to control it with step and direction, so this bit must be 0.


Moving on, the DRVCTROL register sets the microstep resolution in the last 5 bits. We want the max resolution of 256 microsteps per full rotation, which is why we set this as 00000.

One other very important register is the SGCSCONF, in which current scaling is set. The last 5 bits create a number between 0 and 31 which corresponds to the fraction of the max current that is supplied to the motor. The actual value will have 1 added to it, so if 0x0 is sent, the fraction of the max current will be (0+1)/32. We are mostly keeping this around 0xA or 10 so that we would supply approximately 1A.


After initially being confused about what SPI mode meant and thus had the SDOFF bit set wrong, we were then able to send step and direction signals from an Arduino YUN which I had on hand. The motor then moved without a problem.


References:

“TMC2660C Datasheet”, 2020, https://www.trinamic.com/fileadmin/assets/Products/ICs_Documents/TMC2660C_Datasheet_Rev1.01.pdf


# Week of 4/18


At this point, we are somewhat disappointed that we were unable to get all our subsystems working by now, but the goal for this week was to get the motor subsystem fully working for the demo, and to have a UART interface to demonstrate our device’s ability to process data from an external sources and convert it to motor commands.


After we got the TMC2660 working with the arduino we could focus on the TMC429 with confidence that everything involving the 2660 is already set up correctly. To write to the TMC429, a 32 bit datagram must be sent. All the registers are shown in the table below:

![alt text](https://lh4.googleusercontent.com/Lz6IGRPVxqzgf_fwsK-DohO1ypCpa0lKtQGl82q0Sead0DuInjD-_DJOoN6WTNKCRYkEyXo3Zzu7AVWpr-MjfstcEKbB3NUO_-ozarfI4YjPWVotYpW4O8Xr2vQdqvyP6Yf5Aa12bMN5Y8EM-g)

The first 7 bits correspond to the register address and the 8th bit specifies a read or write. Using the HAL_SPI_TransmitReceive function from the STM32 HAL library, the response is automatically put into a buffer passed in through the function’s arguments if a read operation is made. After initialization, which I personally was not responsible for, there are only a few registers written to during normal operation. First, the two bits corresponding to R_M in the register map signify if the device is in ramp mode, soft mode, or velocity mode. In ramp mode and soft mode, the X_TARGET register can be written to and the motor will move to that position (in microsteps). Soft mode simply means that the movements are not sudden. In velocity mode, by contrast, a constant velocity can be written to the V_TARGET register. We were able to successfully send SPI commands and read registers, however the commands for driving the motor did not work properly. The movement was jittery and inconsistent, and for some reason it would only move one direction in velocity mode. Armando spotted the issue: by default the TMC429 is configured in SPI mode, when we thought that by default it was in STEP/DIR mode. This is accessed through the IF_CONFIGURATION_429 register. To be perfectly honest, I am unsure how our commands were moving the motor at all, since it should be sending SPI commands rather than step/dir commands in the default mode. After we solved this, though, position and velocity commands worked smoothly, and we were able to fulfill our subsystem requirements for the motor control subsystem. Setting a positioning of 52800 microsteps successfully moves the shaft 360°.


In parallel, I also tried to solder on a 2nd PHY chip in case our first one shorting was an anomaly. However, this turned out to be too optimistic, as it once again shorted 3.3V ground within a short period of time. We removed the PHY and turned our focus to other remaining aspects of the project.


Once we got the motor control working, we started to focus on writing Arduino code to send UART commands for our demo. However, we encountered a rather interesting and frustrating hardware problem with our STM32. One time when we were trying to program, one of the programming wires came loose. After this, an error was displayed stating that the memory could no longer be erased. Inspecting some more with the STM32CubeProgrammer software, we found that the value in memory for the “read protection” was 0xFF, which was not actually a legal value. As a result, the programmer cannot properly determine if the memory is able to be read, effectively making this issue unsolvable. After hours of looking for a solution, we had to go with our last resort which was desoldering the MCU off of the STM32F4 discovery board and soldering it onto our PCB. Since this MCU has a slightly different amount of memory, it required a whole new project to be created in the STM32CubeIDE. We were able to program this new MCU and flash the LED to verify that the program was running. However, we initially found that no commands would move the motor. Eventually, after using an oscilloscope to inspect the SPI signals, we found that the CS pin on the TMC429 was not behaving properly, and simply not responding to setting it high or low. This pin on the new MCU was broken. Fortunately, since this is a simple GPIO, we remapped the CS pin to one of the status LEDs that were unused and soldered a wire from one side of the LED, connecting the other end to the 429 chip select header. This solved the issue, and the motor could once again be moved.


We then focused on getting UART communication to work for our demo. We decided to implement a few different commands: set motor position, set motor velocity, set current scaling, and get position. To implement UART on the STM32 side, we used a DMA method in which the received UART command is stored directly in memory without the interference of the CPU. Sending a UART command on the Arduino side was extremely simple, and we were able to get the arduino to successfully send the data for the first 3 commands that I listed. Each command was 32 bits, the first byte being a unique command number and the remaining data being the value. The STM32 simply checks the value of the UART buffer and writes the data to the TMC429 via SPI depending on the command number.  


References:

“TMC429 Datasheet,” 2015, https://www.trinamic.com/fileadmin/assets/Products/ICs_Documents/TMC429_datasheet.pdf



# Week of 4/25


This was the week of our demo, which was originally scheduled to be on Monday, however we really wanted to try and get the ethernet communication working in some capacity, so we were able to push it back until Wednesday.


Our setup this week was slightly different than the previous ethernet tests. We could no longer use the Waveshare DP83848 module and the STM32F407 discovery board together since we harvested the MCU off of the discovery board. Fortunately, we routed the ethernet RMII signals to headers on our board. Sadly, I somehow missed the routing of one critical signal: the oscillator. This 50MHz signal must be shared between the PHY and the MCU for timing purposes. Since the DP83848 module has an onboard oscillator, we had to somehow connect this signal to the correct pin on our MCU. After some painstaking soldering, I managed to solder a very thin gauge wire directly to this pin, and then solder this wire to a female header to fit onto the waveshare board. This most likely contributed to the ethernet not working properly, as this must have created a lot of noise, and the solder joint was probably not great.


We then tried focusing on the software and configuring many different parameters on the STM32CubeIDE, we ran the code to try to ping the device. However, no packets were received.


At this point even if we did get the ethernet to ping, we would still have a considerable amount of work to get it receiving and interpreting commands. Therefore, we focused all of our attention back onto getting all of the UART commands working to have more substance in our demo, as well as getting the stop switches to work. The command for reading position was giving us problems, and after hours of not understanding the problem, we began altering the delays in the arduino code and in the STM32 code. We were able to find a sweet spot, verifying that this was a timing issue, likely something in the arduino serial library that was abstracted away and not visible to us.


Finally, we wanted the stop switches working for our demo, but these were giving us issues as well. The day of our demo, we finally realized that the register that configured ramp mode or velocity mode also wrote a bit for disabling the stop switches. We were setting this register each time an arduino command was received since it can set either position or velocity, so it was overwriting the initialization, disabling the stop switches each time. Once we altered the register value, the switches worked as intended, stopping the motor instantly, with one switch for each motor direction.