*&---------------------------------------------------------------------*
*& Report ZRM_REPORT2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRM_REPORT2.

parameters:
            num1 type i,
            num2 type i.

data(resultadd) = num1 + num2.
data(resultsub) = num1 - num2.
data(resultmul) = num1 * num2.
data(resultdiv) = num1 / num2.



write:  'addition of',num1 ,'and' ,num2,'is:',resultadd.
ULINE.
write:  'subtraction of',num1,'and' ,num2,'is:',resultsub.
ULINE.
write:  'multiplication of',num1,'and',num2,'is:',resultmul.
ULINE.
write:  'division of ',num1,'and',num2,'is:',resultdiv.
