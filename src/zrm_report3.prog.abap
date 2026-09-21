*&---------------------------------------------------------------------*
*& Report ZRM_REPORT3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZRM_REPORT3.




PARAMETERS:
            username type char20,
            userln type char20,
            usercont type i,
            useradd  type string.



Write : / 'Hello', username , userln ,'!!',
        /'this is your personal chatbot thank you for providing your deatils :',
        /'Your address is :',useradd,
        /'your contact is :',usercont.



data(num1) = 10 .
data(num2) = 20 .
data(result) =  num1 + num2.
write : result.
