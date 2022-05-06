<p style="color: red; font-weight: bold">>>>>>  gd2md-html alert:  ERRORs: 0; WARNINGs: 0; ALERTS: 15.</p>
<ul style="color: red; font-weight: bold"><li>See top comment block for details on ERRORs and WARNINGs. <li>In the converted Markdown or HTML, search for inline alerts that start with >>>>>  gd2md-html alert:  for specific instances that need correction.</ul>

<p style="color: red; font-weight: bold">Links to alert messages:</p><a href="#gdcalert1">alert1</a>
<a href="#gdcalert2">alert2</a>
<a href="#gdcalert3">alert3</a>
<a href="#gdcalert4">alert4</a>
<a href="#gdcalert5">alert5</a>
<a href="#gdcalert6">alert6</a>
<a href="#gdcalert7">alert7</a>
<a href="#gdcalert8">alert8</a>
<a href="#gdcalert9">alert9</a>
<a href="#gdcalert10">alert10</a>
<a href="#gdcalert11">alert11</a>
<a href="#gdcalert12">alert12</a>
<a href="#gdcalert13">alert13</a>
<a href="#gdcalert14">alert14</a>
<a href="#gdcalert15">alert15</a>

<p style="color: red; font-weight: bold">>>>>> PLEASE check and correct alert issues and delete this message and the inline alerts.<hr></p>


**# Week 2/28**

This week we mainly focused on getting all the components necessary for the project and creating a parts list that included everything we would need for the project. The chip shortage had caused some issues so we had to act fast and do the research to find the best components needed. 

**Mar 1, 2022**

I did some research on the PHY chip that we would use and I ended my search on the DP 83848 chip based on some criteria. We were told to stay away from GFN packages so I knew we wanted it to be QFP. I also knew that we needed support for RMII or MII as that is the protocol that we would need to communicate with the microcontroller. Fortunately or unfortunately this dwindled my list to very few components and the prices dwindled the choices even more. Most of the PHY chips that were left at this point were $20+ and this was just too much for one component, especially with the price of everything else. I then came across the aforementioned chip and realized that it was around the same price on amazon with a development board. It was cheaper than all the other chips and came with a development board that we figure would make it easier for debugging and testing purposes. Also, after doing some quick research it appears that this PHY chip had been used with our microcontroller in some tutorials so it seemed like a no brainer to go with this.

**Mar 2, 2022-Mar 5, 2022**

Today I added a couple components to the parts list and also started adding reference numbers that matched with our pcb design for ease of use later. I mostly focus on the searching for the capacitors and resistors.  

**# Week 3/7 **

This week the team mostly worked on getting the PCB complete in time for the first round of orders. My main objective this week was to complete the parts list and get it well documented and organized so I could send out the order. I also revised the design doc based on the feedback given.

**Mar 7, 2022**

I wanted to get the order for parts as soon as possible so that we could begin working on our project so I double checked all the references in our PCB design and organized the parts list in the same order as the references listed in the design so I could easily check if we were missing any parts in our parts list. After doing that I looked at all the parts and made sure that the footprint matched the intended footprint. I took note of duplicate parts and combined them so I could determine the quantity needed for each part.

**Mar 8, 2022**

I remembered that our budget was limited and I believe it was mentioned to be $100 so I took note of the parts and tried to order all the components from the motor subsystem in case we wanted to work on that first. Then I moved on to all the capacitors and resistors. I wanted to get all the tedious soldering out of the way first when the remainder of the larger parts that were above our budget arrived. 

After doing all this I created a parts list order form on Digikey and set up the order through the ECE order portal. 

**Mar 9, 2022**

Everything went well and the order was approved today so it should be shipping soon. I hope that the parts arrive so we can start soldering soon after spring break.

**# Week 3/21**

This week our main objective was to get all the parts that we ordered soldered. There were still some remaining parts left and those were marked separately to be sent through Argonne's order portal that Bryan had access to. 

**Mar 21, 2022**

Seeing as we had received our parts during spring break and it included most of the parts I decided to start soldering the components on the PCB right away. There were so many parts and most of them were very tiny. I had learned how important not losing the smaller components was during the earlier soldering assignment. Although I had ordered extras for most things for this very reason I did not want to make many mistakes.

My main objective for today was to get everything organized so soldering would go as smoothly as possible. I spent several hours going through each package and labeling them with the reference numbers that I had saved on the spreadsheet. I also organized them in ascending reference numbers so they would be easier to find. This made it easier for me when it came time to solder as Bryan had included the references on the PCB layout. 

Organizing everything had taken longer than expected and it was getting late so I only soldered a couple of components for the motor control subsystem.

**Mar 22, 2022-Mar 25, 2022**

The goal for the rest of the week was just to get all the components that we ordered soldered. I was already familiar with soldering but had not soldered this many very small components. Bryan had more experience than me and he showed me how to use flux to get a better solder. I focused on getting all of the capacitors and resistors on the board. Bryan focused more on the ICs. We almost got all the ordered parts soldered this week and only had a handful left.



<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image1.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image1.png "image_tooltip")




<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image2.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image2.png "image_tooltip")


**Week 3/28**

This week my main goal was to get started with the motor control subsystem. So most of my time would be spent researching the motion controller and stepper driver to find out what commands would need to be sent to move the motors. 

**Mar 30, 2022**

I found an API for both the TMC 429 and the TMC 2660 on the Trinamic website so I plan to just integrate this into our current code. It seems very complicated as they abstract all the bits and use lots of macros to control the registers. I have also gotten through some of the datasheets so I am aware of the different registers but I still need to read further to understand what values I need to send to each register. Below is an example of the code found in the API. The API is tricky to work with because this Shadow Register is used since it the API was intended to work with certain development boards so I will have to decouple this. 



<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image3.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image3.png "image_tooltip")


**Apr 1, 2022**

I have been reading mostly about the TMC 2660 and my plan is to change the register which controls the direction and amount of current in the coils A and B. I want to focus on getting the motor to move using only the TMC 2660 first and then adding the extra functionality with the stepper driver. The API did not include the portion needed to interface so I included some functions so that the micrnotroler could cujminaitetr with the chip through SPI. This spi wrapper function that I created took in the register to write to and the data needed to write to it. The overflow of the program was as follows. 



<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image4.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image4.png "image_tooltip")


I used the following HAL library command to transmit this data.

_HAL_SPI_TransmitReceive(&hspi1, DATA_SENT, DATA_RECIEVED, NUM_BYTES_READ,TIMEOUT);_

**# Week 4/4**

The main objective of this week was to get the motor to have any sort of movement using the Trinamic API and my SPI wrapper function. After the motor was controlled with just the 2660 I would move on and use the 429.

**Apr 6, 2022**

I had many difficulties debugging the code. I was unfamiliar with the STM32 IDE’s debugging tools so I decided to get UART communication configured so I could use print statements. I followed a quick tutorial online and since I already had Putty installed the process was smooth. Unfortunately after going through all the work of changing the code to pass by pointer the spi output buffer so print statements would work in the API I realized that the issue must be somewhere in the API. I say this because as I was changing the register contents in the structure I would print them out after and realize that none of them were actually changing. The same was true in the initialization function.

**Apr 7, 2022-Apr 9. 2022**

For the past couple of days I tried to fix the aforementioned issue however I was just not understanding how it was going through the functions but never actually changing the register continents when I had just changed them in the line before. So after much frustration I decided to ditch the overly complicated API and create my own drivers seeing as I had worked with the API long enough to understand what it was trying to do. 

**# Week 4/11**

This is an especially busy week for me so my workload will not be as great this week. With this in mind, I intend to continue to work on creating my own driver gaining inspiration from both the Trinamic API and various online forums.

**Apr 11, 2022**

I started on creating my own files for the TMC 429 and the TMC 2660 and created structures for them. I had already written the SPI wrapper functions in the API so I just copied those functions over. I was not able to test today. 

**Apr 14, 2022**

Today I plan on testing the code that I wrote earlier in the week and sending the correct initializations needed. I was looking over the API again and am unsure if I should use the same initialization. I will test it with the same initialization and then change it if it doesn't work. I have added UART and print statements again after not being able to move the motors. I suspect that I am not sending the correct initialization values needed to set up the motion controller. I know that Rindra has wanted to take a break from Ethernet so I will push what I have and sometime this week he can also take a look at it. 

**# Week 4/18**

The main objective of this week was to fix all the bugs with the motor control subsystem so that all the commands would work as intended. The other objectives were a closer look at the ethernet subsystem and starting to design the 3d enclosure in Inventor. So I would need to get some measurements of our layout thus far and take a look into the progress that had been made on the ethernet side of things.

**Apr 18, 2022**

Today the main goal was to look for any discrepancies in our design and the datasheet from the PHY development board. I took a look at our layout for the PHY chip and compared it to the datasheet provided by WaveShare. After comparing everything and looking at our schematic layout I realized that we should have used 51-ohm resistors instead of our 18-ohm resistors. [take pics of schematic layout] I doubted that this could fix the PHY chip but it did seem important enough especially since it was the data lines for the PHY so I took one of our old dev boards that already had the PHY chip removed and desolder our resistors and replaced it with the 51-ohm ones from the dev board. I could not finish testing this fix as I did not have access to a working PHY development board.

**Apr 19, 2022**

I decided to get started on designing the case. I took some measurements. I also drew out how I wanted it to look by hand first before starting it in Inventor. 

 

<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image5.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image5.png "image_tooltip")


<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image6.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image6.png "image_tooltip")




<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image7.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image7.png "image_tooltip")


**Apr 20, 2022**

I now had a good idea and the measurements needed to start modeling the enclosure for the final project. I decided that I wanted to get most of it done today as we would have limited time to print and I was going on a field trip on Saturday that would take up almost all of my day. I finished the bottom part today and got most of the way done with the top.

**Apr 21, 2022**

I finished the top of the case today and double-checked it with the dimensions of the bottom. The clips are a little small in width and I probably should have gone with magnets but I did not think that I would have time on getting magnets shipped and deal with a redesign so decided to stay with the clip idea. 

**Apr 22, 2022**

The goal of today was to get the motor subsystem to act as intended. We can get the motor to move at constant velocity and to a certain position; however, it is erratic in the sense that there is no direction to the movement. Meaning that a negative velocity will not drive the motor in the opposite direction as it should. 

Bryan had mentioned that he had scoped the CS pins and although they did seem a little suspicious the signals were being sent. For whatever reason, it was getting the step pulses but not the direction. I went back to the only place I knew I could get more answers-the datasheet. We had followed the guide to initialize them from here. 



<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image8.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image8.png "image_tooltip")


<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image9.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image9.png "image_tooltip")


We had wrongly assumed that this was all that would be needed. After looking at places where step/direction was being mentioned I noticed some things. Firstly, I read that if we only touched the registers we did in initialization then our TMC429 chip would be acting like its predecessor the TMC 428 chip. With this in mind, I thought to look at the TMC 428 for any possible answers. After reading for a good while I came up with nothing so instead I looked into the registers that we hadn’t touched in the initialization. The registers that (when altered) make it a TMC 429 chip. That is when I came across the IF_CONFIGURATION_429 register. It had many attribute bits that modified different configurations for the motor. As shown by the image below.



<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image10.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image10.png "image_tooltip")


However, the STEP/DIR enable was the only one that I was interested in. Given this fact I was very confused about how we even got the motor to move up to this point because the datasheet had described that the SPI mode is set and STEP/DIR is disabled by default. This meant that if we hadn’t enabled it then it must still be in SPI mode. This made it hard for me to understand why the commands we were sending still worked. 

Moving on from the confusion, I decided it was time to change the step/dir bit in the register. Since it had been working with the defaults and we had not set up structures to change certain bitfields I decided to read the register as it currently was and only change the bit that enabled step/direction mode. 

 



<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image11.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image11.png "image_tooltip")


Now that I had read the datasheet further I found more registers that may need to change. The 4'b1111 register also had some important things that needed to be changed such as mot1r and refmux for the limit switches to work. So I made note of it for a later day. 

The change worked! Now that the motor functionality was fully working I decided to shift my attention to Ethernet. I now had all the components necessary to start testing the data communication portion of the ethernet subsystem. The main goal was to try and follow some of the many guides only to get the DP 83848 to work without the STM32 discovery dev board. I took all the necessary equipment home to test the Ethernet communication. I downloaded wire shark to see if I had any luck at picking up the static IP address that I had set up after reading some tutorial documentation. Unfortunately, I was not able to configure the boards to need ethernet peripherals so I was not able to get it tested. 

**Apr 23, 2022**

Late at night, the STM32 got bricked. I spent a couple of hours trying to figure out how to fix it. Link some websites. Unfortunately after a while, it was recognized that the STM32 was destroyed and there was nothing that could be done to fix it. Once the option is toggled to 2 the STM32 can no longer be written to.

**Apr 24, 2022**

The objective of today was to get the case printed as soon as possible as there were only 24 hours until the deadline and the print was estimated to take about 8 hours. With this in mind and still no access to 3d filament that would arrive on time or that we can buy in-store we had to ask around to see if anyone could spare us some. In the afternoon we finally managed to get some from a friendly 445 course to let us use his filament in an open lab so after handing over the STL files in the afternoon I continued to work on adding functions to the code so that it would work on input commands.

After a couple of hours, I came back to the open lab to find the test print had failed. To save time as there would be no more open lab instructors I included another group's STL file print at the same time and this seemed to mess up the print. 



<p id="gdcalert12" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image12.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert13">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image12.png "image_tooltip")


With this print now ruined and the deadline less than 12 hours to go, I message one of my friends that is a lab monitor for some assistance; however, the wireless capabilities of the printers were not online so there was nothing he could do from home. I spent the next couple of hours learning how to use a 3d printer and how to calibrate it. After watching some videos I was able to calibrate the x,y,z, and first layer print. With that it was midnight so I loaded the SD card and started the print again. After watching it for the first couple of layers I went home for the day and woke up to this image from Rindra.



<p id="gdcalert13" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image13.jpg). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert14">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image13.jpg "image_tooltip")


**# Week 4/25**

This week we had our demo and mock presentation. Originally we had our demo scheduled for Monday; however, after bricking our microcontroller late at night Saturday we emailed our TA to see if we can get an extension. Fortunately for us, Bryan had a dev board with a different STM32 on it so the day after that we were able to desolder it and use it. The goal of this week was to attempt ethernet last time and if successful finish integrating it with the functions already written for the motor. If ethernet was not set to work then we would go with the serial communication route and send the commands through UART instead. 

**Apr 25, 2022**

We were still scheduled to demo at this today so we were preparing for the demo and were testing the code one last time.

After Rindra’s message, I quickly came back and reset the print, still unsure of what could be causing the issues as I had calibrated it. I knew that the print wouldn’t finish in time for our demo but I figured it would be nice to have. This time I could only watch it for a little while. I came back after two hours to find this.



<p id="gdcalert14" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image14.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert15">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image14.png "image_tooltip")


However, after we found out that our extension was granted until wednesday we decided to switch course and make another attempt at ethernet. This extension also granted me another chance to get a fully printed enclosure. .

**Apr 26, 2022**

This was the fourth attempt at printing the case and after looking at it in the morning I saw that the print had stopped itself. I quickly realized that it was due to the filament getting tangled. However, it also appeared that the print was canceled and there was no way to restart it to where it had left off so unfortunately this meant that I would have to start a new print.



<p id="gdcalert15" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image15.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert16">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image15.png "image_tooltip")


I reloaded the file and went in for the final attempt. However, I had noticed that the print looked very good before it had stopped and not failed as quickly as the last ones. The two hours I had spent calibrating the printer and testing the first layer print the day before had been worth it. With that, I started it again and would expect it to finish at 10:30 pm. With the demo being in the afternoon the next day it would most likely have to be the final attempt.

Midday I went to that lab and was reading the ethernet instructions from the guide and set up the ethernet to work on the STM32 project. One part that I was suspicious about and thought could lead to the ethernet not working for the previous times we tried is maybe in the way we allocated the space in the ram or lack thereof. In my previous attempts in trying to get Ethernet to work, I stumbled across this website. [https://community.st.com/s/question/0D50X0000BOtfhnSQB/how-to-make-ethernet-and-lwip-working-on-stm32](https://community.st.com/s/question/0D50X0000BOtfhnSQB/how-to-make-ethernet-and-lwip-working-on-stm32)

I saw issues with setting up the Tx and Rx buffer and description in the Flash file. So I did more research on this and decided to implement manually changing the FLASH file as they suggested. 

Afterward to test what we had configured we would need to go to some other place as the Illinois ethernet would not be suitable for our testing purposes. When we arrived at the apartment we tried another ping test with the configuration we had previously tried but again there was no success. We all tried debugging and looking at multiple different forms trying different suggestions for hours but still in the end we were not able to see the IP address of our device on wire shart.  

**April 27, 2022**

After trying ethernet again and still not being able to even get a successful ping we had moved on to getting everything else working this included getting all the UART commands to work. There were some issues with getting the position as most times it would only read back the first position that it was sent. We tried for a long time to fix this the previous days to no avail. I had written the get position function and modeled it after my previous function that printed the position printing straight from the UART to my putty so I didn’t think that it was an issue with the c code on the STM32 project. With this in mind, I figured that it must have been an issue with the Arduino code. Now I had only had very little experience with Arduino code but after noticing the previous night that getting position would work sometimes I had the hunch that it had to do with how the information was being stored on the Arduino buffer. In the Arduino code, we used Serial.Available() to check when the buffer had received a message over UART and it was ready to read it. I was not too familiar with this command so I did some research on it but the Arduino code and some stack overflow threads mentioned that I could clear the buffer after use by using Serial.Clear(); however, after using this function it did not seem to do anything as I believed that the buffer was still not clear as I had wanted it to be. I had the idea that maybe the data was being stored in the next 32-bit section so I attempted to read the first 32-bits as always but then discard the next 32-bits which I believed had duplicate data or something else. After doing this I noticed that getting a position worked only when being called twice! Hazah, I had figured something out so with this I tried to clear the next 32-bits to see if that did anything; however, the same issue persisted. We simply changed the function and called it twice and this fixed the get position issue.

After about two hours until the demo, we went ahead and attempted to get the limit switches configured. I had made note of the registers that needed to be altered earlier, mainly the register indexed by four one bits (4b’1111). Changing the required values enabled the limit switch as a left and right limit switch for motor one. 

**Apr 29, 2022**

Today is the day of the mock presentation. I had finished polishing up the slides in the morning and I practiced my parts before the presentation. 

**May 2, 2022**

I had added more slides for the motor control subsystem this morning and we plan to have a couple practice runs today before our final demo.
