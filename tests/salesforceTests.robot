*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite

#Complete the following test cases to the best of your ability.
#First attempt to complete them with the knowledge gained from the Success Academy
#Then, search the documentation site and the QWord List at docs.copado.com
#Next, attempt searching the internet utilizing search terms such as "Robot Framework"
#Utilize whatever dummy data necessary to complete the automation

#Please document your level of success with each test case
#Along with any areas in which you had trouble. 
#Afterward we will work together to complete and improve the automation. 
*** Test Cases ***
Create a Lead
    [Documentation]    Log into salesforce, launch the sales application,
    ...                create a lead, and verify that the generated record fields match your input. 
    #login to salesforce
    Login
    #Launch Sales app 
    LaunchApp  Sales
    #create a lead
    VerifyText  Leads
    ClickText  Leads
    VerifyText  new
    ClickText  new
    TypeText  First Name  Steve 
    TypeText  Last Name  From Minecraft  
    TypeText  *Company   Mojang Studios
    
    #Not working code 
    #ClickElement  Salutation
    #DropDown  Salutation  Prof.    
    
    VerifyText  Save  partial_match=false 
    ClickText   Save  partial_match=false 
    
    #verify lead contents
    VerifyText        Edit    partial_match=false
    ClickText         Edit    partial_match=false
    TypeText  Phone  000-000-0000
    TypeText  Mobile  111-111-1111  
    TypeText  Title  Player  partial_match=false 
    VerifyText  Save  partial_match=false 
    ClickText   Save  partial_match=false

Convert a lead to an opportunity
    [Documentation]     Select the "convert" option for an opportunity. 
    ...                 Create a new contact and new opoprtunity
    ...                 Verify the lead has been converted page displays account contact and opportunity
    # Navigating to convert 
    VerifyText  Convert  
    ClickText  Convert  partial_match=false
    #Filling out convert form
    VerifyElementText  *Account Name  partialmatch= false 
    TypeText          Account Name*     Microsoft
    ClickText         Contact        partialmatch=false
    ClickText         --None--       
    ClickText         Prof. 
    TypeText          Last Name*               Mining for Diamonds 
    #exiting out of the form                   
    ClickText         Convert   anchor=Cancel  
    VerifyText        Go to Leads
    ClickText         Go to Leads

Create a quote on an opportunity
    [Documentation]    Using the existing opportunity from the previous step
    ...                navigate to the opportunity, and select "Create Quote"
    ...   
    #Getting to opperunities page
    VerifyText         Opportunities
    ClickText          Opportunities 
    #Adding quote to oppertunity
    VerifyText         Mojang Studios-
    ClickText          Mojang Studios-
    VerifyText         Create Quote 
    ClickText          Select a date for 
    ClickText          Today
    TypeText          Contract Length    100
    VerifyText        Next 
    ClickText         Next
    #ClickText          Pick a Year. --issues with this line 

Add products to an opportunity
    [Documentation]    From an opportunity, add a product from the standard pricing book named "GennWatt Diesel  500kW"
    #navigating to products section
    Verifytext      Products
    ClickText       Products
    ClickText       Add Products 
    #adding product 
    PickList        Price Book                        Standard   
    TypeText        Search Products          GennWatt Diesel 500kW  
    ClickText       "GennWatt Diesel 500kW" in Products 
    
