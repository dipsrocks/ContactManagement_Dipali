Steps to execute Contact Management application.
1.	Execute Creation_Scripts.sql from location “~/ContactManagement\ContactManagementAPI\ContactManagementDAL\SQLScripts” in sql server managementstudio.
2.	Update connection string with your DBserver, User, Password in web.config of ContactManagement.API project.
3.	Right Click on Contact Managent.API project and select View in browser. Check the link opened in the browser. Copy the URL.
4.	If the URL does not matches to http://localhost:49809/ 
a.	Open Custom.js from  ContactManagementUI_JS/assets and update baseURl variable with the URL copied in step 3.
5.	Right Click ContactManagementUI_JS select set as startup project.
6.	Press F5 or run the project. Below screen will be displayed.
 


