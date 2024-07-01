Feature: Registration for customer role

  Background:
     Given Login into registration page

@LPNSignin
  Scenario Outline: As a customer role, want to register in Registration page
  And user provides all inputs to register "<First name>""<Last name>""<Title>""<Country>""<Email>""<Phone number>""<Company name>""<Company Industry>""<Company URL>""<Company Size>""<Annual Revenue>""<Add info>"
 And user checks I accept the terms provided above checkbox and clicks on Register button
 Then Thank you page displayed  for registration confirmation and email send to registration admin for registration success
Examples:
|First name|Last name|Title    |Country|Email        |Phone number|Company name|Company Industry|Company URL  |Company Size|Annual Revenue|Add info|
|Carlo     |B        |Associate|India  |abc@gmail.com|9876678798  |Test Comp   |software        |www.google.in|large       |3bn           |yes     |
