---
layout: post
title: System.String Or StringBuilder
date: '2007-02-08T14:03:00.000+05:30'
author: aks
tags:
- Tips
modified_time: '2007-02-02T10:34:14.795+05:30'
blogger_id: tag:blogger.com,1999:blog-7475258030496424805.post-6756508585934542230
blogger_orig_url: http://techyfreak.blogspot.com/2007/02/systemstring-or-stringbuilder.html
---

<p class="MsoNormal"><span style="font-family:Verdana;font-size:85%;"><span 
style="font-size: 10pt; font-family: Verdana;">Many of us know that we should 
use  StringBuilder object instead of String while building strings when the 
content  of the string variable is unknown at the time of coding.  Some of us 
may not  know the real reason behind this guidance other than the high-level 
fact that  StringBuilder is more optimized.  Here is the fact, if you are  
interested. 
<o:p> </o:p></p> <p class="MsoNormal"><span 
style="font-family:Verdana;font-size:85%;"><span style="font-size: 10pt; 
font-family: Verdana;">The System.String class is  immutable which means that 
the value cannot be changed once assigned.  Every  time you assign a value to 
a string variable, .NET allocates a new memory  location and stores the value. 
 Consider the following snippet of code.  The  .NET Framework would allocate 
memory for the variable four times.  At the end of  the fourth assignment, 
only the fourth allocation will have the reference.  The  previous three would 
be discarded and collected later by garbage collector.   If  the number of 
allocations is more, so will be the number of times an allocation  is 
discarded.  StringBuilder, on the other hand, is mutable and does not follow  
this approach to allocating space for strings.<o:p></o:p></p> <p 
class="MsoNormal"><span style="font-family:Verdana;font-size:85%;"><span 
style="font-size: 10pt; font-family: Verdana;"><o:p> </o:p></p> <p 
class="MsoNormal"><span style="font-family:Verdana;font-size:85%;"><span 
style="font-size: 10pt; font-family: 
Verdana;">/***************************************************************<o:p></o:p></p> 
<p class="MsoNormal"><span style="font-family:Microsoft Sans 
Serif;font-size:85%;"><span style="font-size: 10pt; font-family: 'Microsoft 
Sans Serif';">            <span style="color:blue;"><span style="color: 
blue;">string  s;<o:p></o:p></p> <p class="MsoNormal"><span 
style="font-family:Microsoft Sans Serif;font-size:85%;"><span 
style="font-size: 10pt; font-family: 'Microsoft Sans Serif';"><o:p> </o:p></p> 
<p class="MsoNormal"><span style="font-family:Microsoft Sans 
Serif;font-size:85%;"><span style="font-size: 10pt; font-family: 'Microsoft 
Sans Serif';">            s  =<span style="color:maroon;"><span style="color: 
maroon;">"This  ";<o:p></o:p></p> <p class="MsoNormal"><span 
style="font-family:Microsoft Sans Serif;font-size:85%;"><span 
style="font-size: 10pt; font-family: 'Microsoft Sans Serif';">            s += 
 <span style="color:maroon;"><span style="color: maroon;">"is the first  
";<o:p></o:p></p> <p class="MsoNormal"><span style="font-family:Microsoft Sans 
Serif;font-size:85%;"><span style="font-size: 10pt; font-family: 'Microsoft 
Sans Serif';">            s +=  <span style="color:maroon;"><span 
style="color: maroon;">"sentence in the line.  ";<o:p></o:p></p> <p 
class="MsoNormal"><span style="font-family:Microsoft Sans 
Serif;font-size:85%;"><span style="font-size: 10pt; font-family: 'Microsoft 
Sans Serif';">            s +=  <span style="color:maroon;"><span 
style="color: maroon;">"The sentence was formed using  multiple assignment 
statements.";<o:p></o:p></p> <p class="MsoNormal"><span 
style="font-family:Microsoft Sans Serif;font-size:85%;"><span 
style="font-size: 10pt; font-family: 'Microsoft Sans Serif';">             
System.Diagnostics.<span style="color:teal;"><span style="color: 
teal;">Debug.WriteLine(s);<span 
style="font-family:Verdana;font-size:85%;"><span style="font-size: 10pt; 
font-family: Verdana;"><o:p></o:p></p> <p class="MsoNormal"><span 
style="font-family:Verdana;font-size:85%;"><span style="font-size: 10pt; 
font-family: 
Verdana;">/***************************************************************<o:p></o:p></p> 
<p class="MsoNormal"><span style="font-family:Verdana;font-size:85%;"><span 
style="font-size: 10pt; font-family: Verdana;"><o:p> </o:p></p> 