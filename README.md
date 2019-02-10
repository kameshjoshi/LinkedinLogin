Before starting application create the databaase in mysql using 

```CREATE USER 'linkedin_api'@'localhost' IDENTIFIED BY 'linkedin_api';

GRANT ALL PRIVILEGES ON linkedin_api.* TO 'linkedin_api'@'localhost';

create database linkedin_api;```

To Start server type> bin/rails s

To login with linkedin go to `http://localhost:3000/`

click on ` Login Using Linkedin `

to submit form with encrypted data visit `http://localhost:3000/profile/new`, fill the form and it will store data in encryted form in `profiles` tables, and show the decryted data after submitting.
