# Parking-Allotment-Application
This project is an implementation of a structured parking system using Java.

## About the Project :-
When a user enters the website for the first time, they are requested to fill out a one time registration with necessary details and set a secure password. Furthermore a one time password (OTP) is sent to the user for verification. After the user is logged in, they are given a variety of choices to select a parking location and parking timings based on available parking slots. If in case all of the parking slots are filled, the user is redirected to a page that puts them on waiting list and is further updated when a parking slot is free. The details regarding the availability of parking slots is handled by the admin who will have an all-time access to the database of parking slots and can dynamically update availability based on in-time and out-time given by users. The tariff for parking is calculated based on the number of hours a user wishes to park their car in a parking slot. The transaction of amount payable is performed through a secure payment gateway based on Pay-U Money. Once the transaction is completed, a copy of the bill with a reference ID is provided to the user for conformation and future references. Additionally a QR code is sent to the registered mail of the user, which can be used for instant access to their parking slot at the proposed time, making the entire experience simple, secure, reliable and hassle-free.

## Requirements :-
```
  1. Eclipse IDE
  2. XAMPP
  3. Apache Tomcat v9.0
```

## Installation :-
  1. Add JAR files to build path.
  2. Set Tomcat port numbers.
  3. Import parking.sql to your database and connect MySQL with Eclipse


## Output
![otp](https://user-images.githubusercontent.com/48529434/121774348-bb724980-cb9f-11eb-89b1-811b9e8273cc.png)
![booking](https://user-images.githubusercontent.com/48529434/121774484-3c314580-cba0-11eb-8b55-38e7ad2d3b0c.png)
![payment](https://user-images.githubusercontent.com/48529434/121774489-3fc4cc80-cba0-11eb-8d3d-d11efb0d394e.png)
![summary](https://user-images.githubusercontent.com/48529434/121774490-42bfbd00-cba0-11eb-9da9-d899e0ce38dd.png)


