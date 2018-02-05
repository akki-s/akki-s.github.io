---
layout: post
title: An ASP.NET Picasa Image Gallery
date: '2012-10-01T10:07:00.000+05:30'
author: aks
tags:
- Image Gallery
- ".Net"
- ASP.NET
- Tutorials
- Articles
- Picasa
modified_time: '2012-10-01T11:09:22.105+05:30'
thumbnail: http://2.bp.blogspot.com/-9pk01508_C8/UGksZI2I-wI/AAAAAAAAFxg/wzLnkv7KZ08/s72-c/gallery.PNG
blogger_id: tag:blogger.com,1999:blog-7475258030496424805.post-4367423925819788156
blogger_orig_url: http://techyfreak.blogspot.com/2012/10/an-aspnet-picasa-image-gallery.html
---

<div dir="ltr" style="text-align: left;" trbidi="on"><div 
style="margin-bottom: .0001pt; margin: 0cm;"><span lang="EN-US" 
style="font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 
11.0pt; mso-ansi-language: EN-US;">Few days back I was thinking of creating an 
Image Gallery of the collection of photos I have. Although, there are multiple 
options available over the internet that you can download and get ready on the 
go; most of them involves saving the images on your own server. But what I was 
more concerned was to just have a display only image in my web site to 
showcase my photos to the word. And, I wanted to make use of one of my social 
network account – Facebook, Google+, Twitter or Flickr to host the images. 
<o:p></o:p><div style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">All the major 
social network sites provide API to get the photos from an album. First, I 
tried to make use of Facebook, but it’s access token gets expired in few 
hours and you need to get a new token. This normally involves a user to login 
to your application first, but I wanted a permanent access token or a way to 
refresh the access token without user’s intervention. I think it is possible 
to achieve it somehow, I tried my hand on Picasa (Google+) and it was much 
easier. <o:p></o:p><div style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="margin: 0cm 0cm 0.0001pt;"><span style="background-color: white; 
background-position: initial initial; background-repeat: initial initial; 
font-family: Calibri, sans-serif; font-size: 11pt; line-height: 18pt;">Using 
<span style="background-color: white; background-position: initial initial; 
background-repeat: initial initial; font-family: Calibri, sans-serif; 
font-size: 12pt; line-height: 18pt;">[Picasa Web Albums Data 
API](https://developers.google.com/picasa-web/)<span style="background-color: 
white; background-position: initial initial; background-repeat: initial 
initial; font-family: Calibri, sans-serif; font-size: 11pt; line-height: 
18pt;"> <span style="background-color: white;"><span style="font-family: 
Calibri, sans-serif;"><span style="font-size: 11pt; line-height: 18pt;"> , you 
can query any public album and get the photos. You need two things for this 
– Album Id and User Name. In case you need to show photos from one of your 
private albums, you need to authenticate yourself using the <span 
style="font-size: 15px; line-height: 24px;">API<span style="font-size: 11pt; 
line-height: 18pt;"> with your Google account credentials. <span 
style="font-family: Calibri, sans-serif;"><span style="font-size: 11pt; 
line-height: 18pt;"><o:p></o:p><div style="line-height: 18.0pt; margin-bottom: 
.0001pt; margin: 0cm;"> 
<div style="line-height: 18.0pt; margin-bottom: .0001pt; margin: 0cm;"><span 
style="background: white; font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">Let’s go 
step by step and see how to achieve this. To achieve this I am using 
[GoogleData API for 
.NET](https://code.google.com/p/google-gdata/downloads/list) <span 
style="font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 
11.0pt;"><span style="background: white;"> and [Galleriffic 
](http://www.twospy.com/galleriffic/)<span style="background: white;">[ 
](http://www.twospy.com/galleriffic/)jquery  plugin for the image 
library.<o:p></o:p><div style="line-height: 18.0pt; margin-bottom: .0001pt; 
margin: 0cm;"> 
<div style="line-height: 18.0pt; margin-bottom: .0001pt; margin: 0cm;"><span 
style="background-color: white; background-position: initial initial; 
background-repeat: initial initial; font-family: Calibri, sans-serif;">**<span 
style="font-size: large;">Step 1: Design your gallery.**<span 
style="font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 
11.0pt;"><o:p></o:p><div style="line-height: 18.0pt; margin-bottom: .0001pt; 
margin: 0cm;"><span style="background: white; font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">First step is 
to create your image gallery base. I am using the 
[Galleriffic](http://www.twospy.com/galleriffic/)<span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;"><span 
style="background: white;"> jquery plugin and for this there should be few 
style sheet files (css) and javascript files need to be included in the 
project. <o:p></o:p><div style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="background: 
white; font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 
11.0pt;">First, go to this link <span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;;">[http://www.twospy.com/galleriffic/](http://www.twospy.com/galleriffic/)<span 
style="background: white; font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">and download 
the plugin from there. You should copy the css and js folders into your 
ASP.Net website/application project. Above link showcases 5 examples and I am 
using the second one (<span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;;">[<span style="background: white; 
font-size: 9.0pt; mso-fareast-font-family: Calibri; mso-fareast-theme-font: 
minor-latin;">Thumbnail rollover effects and slideshow 
crossfades](http://www.twospy.com/galleriffic/example-2.html)<span 
style="background: white; font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">), as it is 
closest to the image gallery looks and feel I wanted. <span 
style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;;"><o:p></o:p><div 
style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="background: 
white; font-family: &quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 
11.0pt;">CSS file used for example 2 is <span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 
11.0pt;">galleriffic-2.css. You can exclude other css files named such as 
galleriffic-1.css, galleriffic-3.css etc, but you will need other remaining 
css and image files.<o:p></o:p><div style="margin-bottom: .0001pt; margin: 
0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">After you are 
done with including css and js folders, next step is to include them in you 
page. In this example, I am using Default.aspx to be my image gallery page, 
but it can be anything for you such as Gallery.aspx. In the head tag include 
the following tags:<o:p></o:p><div style="margin-bottom: .0001pt; margin: 
0cm;"> 
<div class="MsoNormal"><span style="color: blue; font-family: Consolas; 
font-size: 9.5pt;">    &lt;<span style="color: maroon; font-family: Consolas; 
font-size: 9.5pt;">link<span style="font-family: Consolas; font-size: 9.5pt;"> 
<span style="color: red;">rel<span style="color: blue;">="stylesheet" <span 
style="color: red;">href<span style="color: blue;">="css/basic.css" <span 
style="color: red;">type<span style="color: blue;">="text/css" <span 
style="color: blue;">/&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">    <span style="color: 
blue;">&lt;<span style="color: maroon;">link<span style="color: red;">rel<span 
style="color: blue;">="stylesheet"<span style="color: red;">href<span 
style="color: blue;">="css/galleriffic-2.css"<span style="color: 
red;">type<span style="color: blue;">="text/css"<span style="color: 
blue;">/&gt;<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">    <span style="color: blue;">&lt;<span 
style="color: maroon;">script<span style="color: red;">src<span style="color: 
blue;">="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"<span 
style="color: red;">type<span style="color: 
blue;">="text/javascript"&gt;&lt;/<span style="color: maroon;">script<span 
style="color: blue;">&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">    <span style="color: 
blue;">&lt;<span style="color: maroon;">script<span style="color: 
red;">type<span style="color: blue;">="text/javascript"<span style="color: 
red;">src<span style="color: blue;">="js/jquery.galleriffic.js"&gt;&lt;/<span 
style="color: maroon;">script<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">    
<span style="color: blue;">&lt;<span style="color: maroon;">script<span 
style="color: red;">type<span style="color: blue;">="text/javascript"<span 
style="color: red;">src<span style="color: 
blue;">="js/jquery.opacityrollover.js"&gt;&lt;/<span style="color: 
maroon;">script<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">    
<span style="color: darkgreen;"><!-- We only want the thumbnails to display 
when javascript is disabled --><o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">    <span style="color: 
blue;">&lt;<span style="color: maroon;">script<span style="color: 
red;">type<span style="color: blue;">="text/javascript"&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
  document.write(<span style="color: maroon;">'<style>.noscript { display: 
none; }</style>');<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">    <span style="color: blue;">&lt;/<span 
style="color: maroon;">script<span style="color: blue;">&gt;<o:p></o:p><div 
style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">Next, include 
the following script in your page:<o:p></o:p><div style="margin-bottom: 
.0001pt; margin: 0cm;"> 
<div class="MsoNormal"><span style="color: blue; font-family: Consolas; 
font-size: 9.5pt;">    &lt;<span style="color: maroon; font-family: Consolas; 
font-size: 9.5pt;">script<span style="font-family: Consolas; font-size: 
9.5pt;"> <span style="color: red;">type<span style="color: 
blue;">="text/javascript"&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">        
jQuery(document).ready(<span style="color: blue;">function ($) 
{<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">            <span style="color: darkgreen;">// We only want 
these styles applied when javascript is enabled<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
      $(<span style="color: maroon;">'div.navigation').css({ <span 
style="color: maroon;">'width': <span style="color: maroon;">'300px', <span 
style="color: maroon;">'float': <span style="color: 
maroon;">'left'});<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">            $(<span style="color: 
maroon;">'div.content').css(<span style="color: maroon;">'display', <span 
style="color: maroon;">'block');<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;"> 
           <span style="color: darkgreen;">// Initially set opacity on thumbs 
and add<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">            <span style="color: darkgreen;">// additional 
styling for hover effect on thumbs<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">            <span 
style="color: blue;">varonMouseOutOpacity = 0.67;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
      $(<span style="color: maroon;">'#thumbs ul.thumbs 
li').opacityrollover({<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
mouseOutOpacity: onMouseOutOpacity,<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
mouseOverOpacity: 1.0,<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                fadeSpeed: 
<span style="color: maroon;">'fast',<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
exemptionSelector: <span style="color: maroon;">'.selected'<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
      });<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;"> 
           <span style="color: darkgreen;">// Initialize Advanced Galleriffic 
Gallery<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">            <span style="color: blue;">vargallery = $(<span 
style="color: maroon;">'#thumbs').galleriffic({<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          delay: 2500,<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                numThumbs: 
15,<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                preloadAhead: 10,<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          enableTopPager: <span style="color: blue;">true,<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          enableBottomPager: <span style="color: blue;">true,<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          maxPagesToShow: 7,<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
imageContainerSel: <span style="color: maroon;">'#slideshow',<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          controlsContainerSel: <span style="color: 
maroon;">'#controls',<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
captionContainerSel: <span style="color: maroon;">'#caption',<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          loadingContainerSel: <span style="color: 
maroon;">'#loading',<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
renderSSControls: <span style="color: blue;">true,<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          renderNavControls: <span style="color: blue;">true,<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          playLinkText: <span style="color: maroon;">'Play 
Slideshow',<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                pauseLinkText: <span 
style="color: maroon;">'Pause Slideshow',<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          prevLinkText: <span style="color: maroon;">'‹ Previous 
Photo',<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                nextLinkText: <span style="color: 
maroon;">'Next Photo ›',<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
nextPageLinkText: <span style="color: maroon;">'Next ›',<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          prevPageLinkText: <span style="color: maroon;">'‹ 
Prev',<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                enableHistory: <span style="color: 
blue;">false,<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                autoStart: <span style="color: 
blue;">false,<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                syncTransitions: <span 
style="color: blue;">true,<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
defaultTransitionDuration: 900,<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
onSlideChange: <span style="color: blue;">function (prevIndex, nextIndex) 
{<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                    <span style="color: darkgreen;">// 
'this' refers to the gallery, which is an extension of 
$('#thumbs')<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                    <span style="color: 
blue;">this.find(<span style="color: 
maroon;">'ul.thumbs').children()<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                              
                  .eq(prevIndex).fadeTo(<span style="color: maroon;">'fast', 
onMouseOutOpacity).end()<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                              
                  .eq(nextIndex).fadeTo(<span style="color: maroon;">'fast', 
1.0);<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                },<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                
onPageTransitionOut: <span style="color: blue;">function (callback) 
{<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                    <span style="color: 
blue;">this.fadeTo(<span style="color: maroon;">'fast', 0.0, 
callback);<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                },<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          onPageTransitionIn: <span style="color: blue;">function () 
{<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                    <span style="color: 
blue;">this.fadeTo(<span style="color: maroon;">'fast', 1.0);<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          }<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">            });<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
  });<o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">    <span style="color: blue;">&lt;/<span style="color: 
maroon;">script<span style="color: blue;">&gt;<o:p></o:p><div 
style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">Next step is 
to have necessary div tags as detailed in the documentation for Galleriffic 
([<span style="font-size: 12.0pt; mso-fareast-font-family: Calibri; 
mso-fareast-theme-font: 
minor-latin;">http://www.twospy.com/galleriffic/](http://www.twospy.com/galleriffic/)). 
The galleriffic plugin shows each image’s thumbnail as a list item in an 
HTML unordered list (ul tag). As we will be getting our images at run time 
only via call to Picasa API we need to have the li items generated from within 
code. Therefore, I have added a div (divSlider) and marked it to 
runat=”server” so that I can assign a value to its innerHTML with 
constructed html.<o:p></o:p><div style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">Within you 
form tag in your aspx include following:<o:p></o:p><div style="margin-bottom: 
.0001pt; margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"> 
<div class="MsoNormal" style="mso-layout-grid-align: none; text-autospace: 
none; text-indent: 36.0pt;"><span style="color: blue; font-family: Consolas; 
font-size: 9.5pt;"> &lt;<span style="color: maroon; font-family: Consolas; 
font-size: 9.5pt;">div<span style="font-family: Consolas; font-size: 9.5pt;"> 
<span style="color: red;">id<span style="color: 
blue;">="page"&gt;<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">            <span style="color: blue;">&lt;<span 
style="color: maroon;">div <span style="color: red;">id<span style="color: 
blue;">="container"&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                <span 
style="color: blue;">&lt;<span style="color: maroon;">h1<span style="color: 
blue;">&gt;<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                    <span style="color: 
blue;">&lt;<span style="color: maroon;">a <span style="color: red;">href<span 
style="color: blue;">="#"&gt;My Website<span style="color: blue;">&lt;/<span 
style="color: maroon;">a<span style="color: blue;">&gt;&lt;/<span 
style="color: maroon;">h1<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          <span style="color: blue;">&lt;<span style="color: maroon;">h2<span 
style="color: blue;">&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                    
Gallery<span style="color: blue;">&lt;/<span style="color: maroon;">h2<span 
style="color: blue;">&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                <span 
style="color: darkgreen;"><!-- Start Advanced Gallery Html Containers 
--><o:p></o:p><div class="MsoNormal"><span style="font-family: Consolas; 
font-size: 9.5pt;">                <span style="color: blue;">&lt;<span 
style="color: maroon;">div <span style="color: red;">id<span style="color: 
blue;">="gallery" <span style="color: red;">class<span style="color: 
blue;">="content"&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                    <span 
style="color: blue;">&lt;<span style="color: maroon;">div <span style="color: 
red;">id<span style="color: blue;">="controls" <span style="color: 
red;">class<span style="color: blue;">="controls"&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
              <span style="color: blue;">&lt;/<span style="color: 
maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
              <span style="color: blue;">&lt;<span style="color: maroon;">div 
<span style="color: red;">class<span style="color: 
blue;">="slideshow-container"&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                        <span 
style="color: blue;">&lt;<span style="color: maroon;">div <span style="color: 
red;">id<span style="color: blue;">="loading" <span style="color: 
red;">class<span style="color: blue;">="loader"&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
                  <span style="color: blue;">&lt;/<span style="color: 
maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
                  <span style="color: blue;">&lt;<span style="color: 
maroon;">div <span style="color: red;">id<span style="color: 
blue;">="slideshow" <span style="color: red;">class<span style="color: 
blue;">="slideshow"&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                        <span 
style="color: blue;">&lt;/<span style="color: maroon;">div<span style="color: 
blue;">&gt;<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                    <span style="color: 
blue;">&lt;/<span style="color: maroon;">div<span style="color: 
blue;">&gt;<o:p></o:p><div class="MsoNormal"><span style="font-family: 
Consolas; font-size: 9.5pt;">                    <span style="color: 
blue;">&lt;<span style="color: maroon;">div <span style="color: red;">id<span 
style="color: blue;">="caption" <span style="color: red;">class<span 
style="color: blue;">="caption-container"&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
              <span style="color: blue;">&lt;/<span style="color: 
maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          <span style="color: blue;">&lt;/<span style="color: 
maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          <span style="color: blue;">&lt;<span style="color: maroon;">div 
<span style="color: red;">id<span style="color: blue;">="thumbs" <span 
style="color: red;">class<span style="color: 
blue;">="navigation"&gt;<o:p></o:p><div class="MsoNormal"><span 
style="font-family: Consolas; font-size: 9.5pt;">                    <span 
style="color: blue;">&lt;<span style="color: maroon;">div <span style="color: 
red;">id<span style="color: blue;">="divSlider" <span style="color: 
red;">runat<span style="color: blue;">="server"&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
              <span style="color: blue;">&lt;/<span style="color: 
maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          <span style="color: blue;">&lt;/<span style="color: 
maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
          <span style="color: blue;">&lt;<span style="color: maroon;">div 
<span style="color: red;">style<span style="color: blue;">="<span 
style="color: red;">clear<span style="color: blue;">: both;"&gt;&lt;/<span 
style="color: maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"> 
<div class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;"> 
           <span style="color: blue;">&lt;/<span style="color: 
maroon;">div<span style="color: blue;">&gt;<o:p></o:p><div 
class="MsoNormal"><span style="font-family: Consolas; font-size: 9.5pt;">      
  <span style="color: blue;">&lt;/<span style="color: maroon;">div<span 
style="color: blue;">&gt;<o:p></o:p><div style="margin-bottom: .0001pt; 
margin: 0cm;"> 
<div style="margin-bottom: .0001pt; margin: 0cm;"><span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 11.0pt;">Next, we will 
make a call to Picasa API, get the images within a specific album and 
construct an unordered list html and assign this html to 
divSlider.<o:p></o:p><div style="margin-bottom: .0001pt; margin: 0cm;"> 
<div style="line-height: 18.0pt; margin-bottom: .0001pt; margin: 0cm;"><span 
style="background-color: white; background-position: initial initial; 
background-repeat: initial initial; font-family: Calibri, sans-serif;">**<span 
style="font-size: large;">Step 2: Query the API**<span style="font-family: 
&quot;Calibri&quot;,&quot;sans-serif&quot;; font-size: 
11.0pt;"><o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal">Download and install [Google Data API SDK for 
.NET](https://code.google.com/p/google-gdata/downloads/detail?name=Google_Data_API_Setup_2.1.0.0.msi&amp;can=2&amp;q=). 
 Once installed add references to the following dlls in your ASP.NET 
project:<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal">Google.GData.Client.dll<o:p></o:p><div 
class="MsoNormal">Google.GData.Photos.dll<o:p></o:p><div 
class="MsoNormal">Google.GData.Extensions.dll<o:p></o:p><div 
class="MsoNormal"> 
<div class="MsoNormal">After you have installed the SDK, the default location 
for these dlls will be C:\Program Files (x86)\Google\Google Data API 
SDK\Sample on 64 bit system and C:\Program Files\Google\Google Data API 
SDK\Samples on x86.<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal">Next include the following namespaces in aspx.cs 
file:<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal"><span style="color: blue; font-family: Consolas; 
font-size: 9.5pt;">using<span style="font-family: Consolas; font-size: 
9.5pt;"> Google.GData.Photos;<o:p></o:p><div class="MsoNormal"><span 
style="color: blue; font-family: Consolas; font-size: 9.5pt;">using<span 
style="font-family: Consolas; font-size: 9.5pt;"> 
Google.GData.Client;<o:p></o:p><div class="MsoNormal"><span style="color: 
blue; font-family: Consolas; font-size: 9.5pt;">using<span style="font-family: 
Consolas; font-size: 9.5pt;"> Google.GData.Extensions;<o:p></o:p><div 
class="MsoNormal"><span style="color: blue; font-family: Consolas; font-size: 
9.5pt;">using<span style="font-family: Consolas; font-size: 9.5pt;"> 
Google.GData.Extensions.Location;<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal"> 
<div class="MsoNormal">There can be two scenarios you can use to display the 
images<o:p></o:p><div class="MsoListParagraph" style="mso-list: l0 level1 
lfo1; text-indent: -18.0pt;"><!--[if !supportLists]-->1.<span 
style="font-size: 7pt;">       <!--[endif]-->You can display any public album 
which can belong to you or any other user. For this you will need Google 
account username (yours or the username of person whose album you are 
accessing) and the album id.<o:p></o:p><div class="MsoListParagraph" 
style="mso-list: l0 level1 lfo1; text-indent: -18.0pt;"><!--[if 
!supportLists]-->2.<span style="font-size: 7pt;">       
<!--[endif]-->Accessing your own private album. Here you will need to provide 
your username, password and album id. You will need to authenticate with API 
using your credentials and then access the album.<o:p></o:p><div 
class="MsoNormal"> 
<div class="MsoNormal">For any of the above cases, it’s a good idea to have 
username and album id information in Web.config or in a Constant 
class.<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal"><span style="color: blue; font-family: Consolas; 
font-size: 9.5pt;">  &lt;<span style="color: #a31515; font-family: Consolas; 
font-size: 9.5pt;">appSettings<span style="color: blue; font-family: Consolas; 
font-size: 9.5pt;">&gt;<span style="font-family: Consolas; font-size: 
9.5pt;"><o:p></o:p><div class="MsoNormal"><span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;">    &lt;<span style="color: #a31515; 
font-family: Consolas; font-size: 9.5pt;">add<span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;"> <span style="color: red; 
font-family: Consolas; font-size: 9.5pt;">key<span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;">=<span style="font-family: Consolas; 
font-size: 9.5pt;">"<span style="color: blue;">albumid"<span style="color: 
blue;"> <span style="color: red;">value<span style="color: blue;">="<span 
style="color: blue;">5792668263385651889"<span style="color: 
blue;">/&gt;<o:p></o:p><div class="MsoNormal"><span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;">    &lt;<span style="color: #a31515; 
font-family: Consolas; font-size: 9.5pt;">add<span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;"> <span style="color: red; 
font-family: Consolas; font-size: 9.5pt;">key<span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;">=<span style="font-family: Consolas; 
font-size: 9.5pt;">"<span style="color: blue;">user"<span style="color: 
blue;"> <span style="color: red;">value<span style="color: blue;">="<span 
style="color: blue;">username@gmail.com"<span style="color: 
blue;">/&gt;<o:p></o:p><div class="MsoNormal"><span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;">    &lt;<span style="color: #a31515; 
font-family: Consolas; font-size: 9.5pt;">add<span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;"> <span style="color: red; 
font-family: Consolas; font-size: 9.5pt;">key<span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;">=<span style="font-family: Consolas; 
font-size: 9.5pt;">"<span style="color: blue;">password"<span style="color: 
blue;"> <span style="color: red;">value<span style="color: blue;">=""<span 
style="color: blue;">/&gt;<o:p></o:p><div class="MsoNormal"><span 
style="color: blue; font-family: Consolas; font-size: 9.5pt;">  &lt;/<span 
style="color: #a31515; font-family: Consolas; font-size: 
9.5pt;">appSettings<span style="color: blue; font-family: Consolas; font-size: 
9.5pt;">&gt;<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal"> 
<div class="MsoNormal">To get album id for the album that contains the photos 
you want to display, you can simply brose to the album and from the url in the 
address bar, you can get the album id. For example in case of 
[https://plus.google.com/u/0/photos?tab=mq#photos/114107981519387242086/albums/5792668263385651889](https://plus.google.com/u/0/photos?tab=mq#photos/114107981519387242086/albums/5792668263385651889), 
the album id is 5792668263385651889.<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal">Now, include the following in your Page_Load 
:<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal" style="mso-layout-grid-align: none; text-autospace: 
none; text-indent: 36.0pt;"><div class="MsoNormal" style="text-indent: 
36pt;"><span style="color: blue; font-family: Consolas; font-size: 
9.5pt;">string<span style="font-family: Consolas; font-size: 9.5pt;"> userName 
= <span style="color: #2b91af;">ConfigurationManager.AppSettings[<span 
style="color: #a31515;">"user"];<o:p></o:p><div class="MsoNormal" 
style="text-indent: 0px;"><span style="font-family: Consolas; font-size: 
9.5pt;">            <span style="color: blue;">string password = <span 
style="color: #2b91af;">ConfigurationManager.AppSettings[<span style="color: 
#a31515;">"password"];<o:p></o:p><div class="MsoNormal" style="text-indent: 
0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">            <span style="color: 
#2b91af;">PicasaService service = <span style="color: blue;">new <span 
style="color: #2b91af;">PicasaService(<span style="color: 
#a31515;">"freak.roach-sample");<o:p></o:p><div class="MsoNormal" 
style="text-indent: 0px;"><span style="font-family: Consolas; font-size: 
9.5pt;">            <span style="color: 
green;">//service.setUserCredentials(userName, password);  //-- needed when 
you need to show albums with private visibility<o:p></o:p><div 
class="MsoNormal" style="text-indent: 0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">            <span style="color: 
#2b91af;">PhotoQuery query = <span style="color: blue;">new <span 
style="color: #2b91af;">PhotoQuery(<span style="color: 
#2b91af;">PicasaQuery.CreatePicasaUri(userName, <span style="color: 
#2b91af;">ConfigurationManager.AppSettings[<span style="color: 
#a31515;">"albumid"]));<o:p></o:p><div class="MsoNormal" style="text-indent: 
0px;"><span style="font-family: Consolas; font-size: 9.5pt;">            <span 
style="color: #2b91af;">PicasaFeed feed = service.Query(query);<o:p></o:p><div 
class="MsoNormal" style="text-indent: 0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">            <span style="color: 
#2b91af;">StringBuilder html = <span style="color: blue;">new <span 
style="color: #2b91af;">StringBuilder();<o:p></o:p><div class="MsoNormal" 
style="text-indent: 0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">            html.Append(<span style="color: 
#a31515;">"&lt;ul class=\"thumbs noscript\"&gt;");<o:p></o:p><div 
class="MsoNormal" style="text-indent: 0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">            <span style="color: blue;">foreach 
(<span style="color: #2b91af;">PicasaEntry entry <span style="color: blue;">in 
feed.Entries)<o:p></o:p><div class="MsoNormal" style="text-indent: 0px;"><span 
style="font-family: Consolas; font-size: 9.5pt;">            {<o:p></o:p><div 
class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">                <span style="color: blue;">string 
title = entry.Title.Text.Substring(0, entry.Title.Text.LastIndexOf(<span 
style="color: #a31515;">"."));<o:p></o:p><div class="MsoNormal" 
style="text-indent: 0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">                html.Append(<span style="color: 
#2b91af;">String.Format(<span style="color: #a31515;">"<span style="color: 
#a31515; font-family: Consolas; font-size: 13px;">&lt;<span style="color: 
#a31515; font-family: Consolas; font-size: 9.5pt;">li&gt;<span style="color: 
#a31515; font-family: Consolas; font-size: 13px;">&lt;<span style="color: 
#a31515; font-family: Consolas; font-size: 9.5pt;">a class=\"thumb\" name={0} 
href=\"{1}\" title=\"{2}\"&gt;<span style="color: #a31515; font-family: 
Consolas; font-size: 13px;">&lt;<span style="color: #a31515; font-family: 
Consolas; font-size: 9.5pt;">img src=\"{3}\" alt=\"{4}\"/&gt;<span 
style="color: #a31515; font-family: Consolas; font-size: 13px;">&lt;<span 
style="color: #a31515; font-family: Consolas; font-size: 9.5pt;">/a&gt;"<span 
style="font-family: Consolas; font-size: 9.5pt;">,<div class="MsoNormal" 
style="text-indent: 0px;"><span style="font-family: Consolas; font-size: 
9.5pt;">                    title, entry.Media.Content.Url, title, 
entry.Media.Thumbnails[0].Url, title));<o:p></o:p><div class="MsoNormal" 
style="text-indent: 0px;"><span style="font-family: Consolas; font-size: 
9.5pt;">                html.Append(<span style="color: 
#2b91af;">String.Format(<span style="color: #a31515;">"<span style="color: 
#a31515; font-family: Consolas; font-size: 13px;">&lt;<span style="color: 
#a31515; font-family: Consolas; font-size: 9.5pt;">div 
class=\"caption\"&gt;<span style="color: #a31515; font-family: Consolas; 
font-size: 13px;">&lt;<span style="color: #a31515; font-family: Consolas; 
font-size: 9.5pt;">div class=\"image-title\"&gt;{0}<span style="color: 
#a31515; font-family: Consolas; font-size: 13px;">&lt;<span style="color: 
#a31515; font-family: Consolas; font-size: 9.5pt;">/div&gt;<span style="color: 
#a31515; font-family: Consolas; font-size: 13px;">&lt;<span style="color: 
#a31515; font-family: Consolas; font-size: 9.5pt;">div 
class=\"image-desc\"&gt;{1}<span style="color: #a31515; font-family: Consolas; 
font-size: 13px;">&lt;<span style="color: #a31515; font-family: Consolas; 
font-size: 9.5pt;">/div&gt;<span style="color: #a31515; font-family: Consolas; 
font-size: 13px;">&lt;<span style="color: #a31515; font-family: Consolas; 
font-size: 9.5pt;">/div&gt;<span style="color: #a31515; font-family: Consolas; 
font-size: 13px;">&lt;<span style="color: #a31515; font-family: Consolas; 
font-size: 9.5pt;">/li&gt;"<span style="font-family: Consolas; font-size: 
9.5pt;">,<div class="MsoNormal" style="text-indent: 0px;"><span 
style="font-family: Consolas; font-size: 9.5pt;">                    title, 
entry.Summary.Text));<o:p></o:p><div class="MsoNormal" style="text-indent: 
0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">            }<o:p></o:p><div class="MsoNormal" 
style="text-indent: 0px;"> 
<div class="MsoNormal" style="text-indent: 0px;"><span style="font-family: 
Consolas; font-size: 9.5pt;">            html.Append(<span style="color: 
#a31515;">"<span style="color: #a31515; font-family: Consolas; font-size: 
13px;">&lt;<span style="color: #a31515; font-family: Consolas; font-size: 
9.5pt;">/ul&gt;"<span style="font-family: Consolas; font-size: 9.5pt;">);<span 
style="font-family: Consolas; font-size: 9.5pt; text-indent: 0px;">           
<span style="font-family: Consolas; font-size: 9.5pt; text-indent: 0px;"> 
<span style="font-family: Consolas; font-size: 9.5pt; text-indent: 
0px;">divSlider.InnerHtml = html.ToString();<span style="color: blue; 
font-family: Consolas; font-size: 9.5pt;">    <div class="MsoNormal"> 
<div class="MsoNormal">That’s it, now when you run this project you will be 
able to view nice image gallery as below:<o:p></o:p> 

<div class="separator" style="clear: both; text-align: center;">[<img 
border="0" height="277" 
src="http://2.bp.blogspot.com/-9pk01508_C8/UGksZI2I-wI/AAAAAAAAFxg/wzLnkv7KZ08/s400/gallery.PNG" 
width="400" 
/>](http://2.bp.blogspot.com/-9pk01508_C8/UGksZI2I-wI/AAAAAAAAFxg/wzLnkv7KZ08/s1600/gallery.PNG) 
<div class="MsoNormal"> 
<div class="MsoNormal">**<span style="font-size: large;">Next 
Steps**<o:p></o:p><div class="MsoNormal">The above approach can be extended to 
show images from Twitter, Flickr, Facebook,  Photobucket etc as 
well.<o:p></o:p><div class="MsoNormal"> 
<div class="MsoNormal">**<span style="font-size: large;">Source 
Code**<o:p></o:p><div class="MsoNormal">Source code is available at the MSDN 
Samples Gallery below and you can use it as is; it is ready to go after you 
change the configuration key values.<o:p></o:p> 

source code - 
[http://code.msdn.microsoft.com/Picasa-Google-Image-bc8bc8d6](http://code.msdn.microsoft.com/Picasa-Google-Image-bc8bc8d6)<span 
class="fullpost"> 