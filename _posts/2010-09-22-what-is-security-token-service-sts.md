---
layout: post
title: What is Security Token Service (STS)
date: '2010-09-22T00:08:00.003+05:30'
author: aks
tags:
- What Is
- Security
- ACS
modified_time: '2010-09-22T00:40:52.838+05:30'
blogger_id: tag:blogger.com,1999:blog-7475258030496424805.post-6984888209880520106
blogger_orig_url: http://techyfreak.blogspot.com/2010/09/what-is-security-token-service-sts.html
---

Traditionally, access control was implemented within the main application by 
writing a code against user’s credentials to authenticate them and based on 
their attributes grant/deny access to various resources. This required 
application developers to be skilled in implementing security and writing a 
code which is hard to implement and maintain. 

Due to Windows Identity Foundation (WIF) all this has changed and it made the 
things much easier.  WIF externalizes authentication and thus <span 
class="fullpost">application designers can focus only on implementing Business 
Logic. So, instead of implementing authentication in our application, we use 
an external system to provide authentication. This system is nothing but a 
service, which generates secure tokens and transmits those using standard 
protocols such as SOAP. This service is known as Security Token Service or 
STS. 

Our application is configured to accept these tokens generated by STS. These 
tokens act as the proof of authentication of a user and hence there is no need 
for our application to manage these credentials.  In this case, our 
application acts as a [Relying 
Party](http://techyfreak.blogspot.com/2010/09/what-is-relying-party-rp.html). 

The tokens generated by STS also provide attributes of these users which can 
be used to prevent access to resources and customize user experience. These 
attributes are called as  
[Claims](http://techyfreak.blogspot.com/2010/09/what-are-claims.html). 

Get this great book for more clarifications directly from master of WIF, 
Vittorio Bertocci 

<iframe 
src="http://rcm.amazon.com/e/cm?t=techy02-20&o=1&p=8&l=bpl&asins=0735627185&fc1=000000&IS2=1&lt1=_blank&m=amazon&lc1=0000FF&bc1=000000&bg1=FFFFFF&f=ifr" 
style="align:left;padding-top:5px;width:131px;height:245px;padding-right:10px;"align="left" 
scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe> 