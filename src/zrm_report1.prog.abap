*&---------------------------------------------------------------------*
*& Report ZRITESHMETANGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrm_report1.

* old syntax *
CONSTANTS: c_pi TYPE p DECIMALS 2 VALUE '3.14'.

DATA: my_name TYPE string,
      my_id   TYPE i,
      my_dob  TYPE string,
      my_cgpa VALUE 9.

my_name = 'ritesh metange'.
my_dob = '26-11-2005'.
my_id =  2.


WRITE : / 'Student name :', My_naMe ,
        /'Student id :',my_id ,
        /'Student Dob :', my_Dob ,
        / 'Today date :',sy-datum,
        /'my cgpa:',my_cgpa,
        / 'value of pi ',c_pi.
ULINE.


* New syntax *
WRITE:'NEW SYNXTAX'.

DATA(s_id) = 34.
WRITE:/'student id with new syntax :',s_id.

DATA(s_name) = 'Salman khan'.
WRITE : / 'Student Name :',s_name.
