The website displays better on an external web browser than the eclipse one.

Logging in as a student (usn:declan pw:declan) gives the user limited functionality.
Logging in as a lecturer (usn:donna pw:donna) guves the user full functionality.

File upload & download works for PDF files only (I did not know how to download with several different filetypes).
To upload a file: Choose option "Add Deferral & File"

For extra functionality we have added Expression-Based Authorization with Spring Security which allows a different menus to be displayed depending on what type of user is logged in.

To switch between the "custom login form" & "jdbc login" security:authentication-manager's swapped (comment/uncomment) in the spring-security.xml file.

Deferral listAll is the only display functionality with a gui, other deferral lista work via url only

when modifying a Deferral there is a dropdown menu to update the status if this isnt slected then there may be errors.

When adding a student deferral onl the student number is checked