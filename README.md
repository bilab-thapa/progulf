# Progulf Mobile Application

Ride With Power

## Introduction
<p align="justify">ProGulf is a motor lubricant oil company based in Nepal. The following proposal is to build a mobile app to commercialize the products of the company for more reach. 
Automotive is in daily need of us humans, constantly using and changing out transportation medium, very populated field consisting of various types and sizes engines. Lubricants help them run with maximum efficiency and the owner should have basic concept and knowledge of their lubricants type and how to use them. 
ProGulf App comes in handy where users can freely slide among various categories of the lubricants and find the optimal product that they are in need of. </p> 

## Features

Flutter build mobile application has a beautiful UI. Similarly, Progulf app has a beautiful UI with many functionalities for the users. Some of them are:

a)	Login/Register <br/>
b)	View the products <br/>
c)	Category to navigate <br/>
d)	Add to Favorite <br/>
e)	Add to Cart <br/>
f)	Checkout Cart <br/>
g)	Change User Details <br/>
h)	Map <br/>
i)	Website view inside the app <br/>
j)	Sensor applications <br/>
k)	WearOS Compatible notifications <br/>

## Technology Used

### Sensors
![image](https://res.cloudinary.com/bilabthapa/image/upload/v1659499108/progulf/documentation/Screen_Shot_2022-08-03_at_09.43.22_hwmjhs.png)
<p align="justify">Sensor2 package helps our app connect with the physical sensors of the device. I have used Sensors such as Proximity/ Accelerometer and used them for functionality such as viewing map button and clear the favorite section. </p>

### Google Maps
![image](https://res.cloudinary.com/bilabthapa/image/upload/v1659499196/progulf/documentation/Screen_Shot_2022-08-03_at_09.44.51_n7gojb.png)
<p align="justify">Google Maps package was used as it gave us the options to map widgets that helps to create google map markers with the map view. Key is required form google cloud to use this package.</p>

### WebView
![image](https://res.cloudinary.com/bilabthapa/image/upload/v1659499219/progulf/documentation/Screen_Shot_2022-08-03_at_09.45.14_bz8zvi.png)
<p>WebView package made it possible to view the website within the mobile application.</p>

### WearOS
![image](https://user-images.githubusercontent.com/63627361/181904741-7ba7fd35-3a1b-4b8a-a0a0-6c1d4d640a4d.png)
<p> Wear is a plugin that offers flutter support for Wear Os devices. This package help with the connectivity with android wearable devices</p>

<p align = "justify">The project was done after the completion of the prototype in Figma. App building process took a lot of time as there were constant modifications to the plans and new ideas took over the old ones. The challenges I faced during this project were a lot more than I expected it to be as I was a complete beginner in this field. Some of them as mentioned below:</p>

a)	Connecting to the API took a lot of time for the registration and login process.</br>
b)	Products were not showing because of various type errors.</br>
c)	Clear code was not written as multiple children were made instead of multiple widgets.</br>
d)	Initialization part in the main file were difficult to implement.</br>
e)	Favorite section faced error for multiple days as range index were not clear.</br>
f)	Getx Controllers Setup.</br>
g)	Increasing and decreasing the controller of product quantity.</br>
h)	Clearing the data in cart.</br>


## Future Features

<p align="justify">The app as of right now is responsive and easy to use. It contains all the basic functionality however; we can work on many patches in the future. We have used stripe demo as of right now for the payment however we can add the gateway to digital wallets such as Esewa and Khalti in the near future for the online payment system. Other features we can add are:</p>

a)	Tracking system of the order.</br>
b)	Admin login and panel for CRUD operations.</br>
c)	Comment and Rating system for the products.</br>
d)	Fingerprint sensor for checkout.</br>
e)  Knowledge on lubricant features.</br>

## Project Architecture
<p align = "justify">Model-View-Controller (MVC) architectural pattern's descendant, MVP pattern, is mostly used to create user interfaces. The presenter in MVP takes on the role of the middleman. In MVP, the presenter receives all presentation logic.</p>

![image](https://user-images.githubusercontent.com/63627361/182371981-5f3ee474-7f5f-45b2-aa26-5252bd301c2e.png)

<p align = "justify">Model: A layer used to store data. In addition to interacting with the database and network layers, it is in charge of managing domain logic (real-world business rules)</p>

<p align="justify">View: User interface (UI) layer. In addition to providing data visualization, it also monitors user activity and notifies the presenter accordingly.</p>

<p align="justify">Presenter: Pull data from the model and use UI logic to determine what to show. In response to the user's input notice from the View, it manages the state of the View and takes appropriate action.</p>

### Agile Methodology

<p align="justify">The Agile technique divides a project into many parts and uses these phases to manage the project. Continuous improvement at every stage and ongoing collaboration with stakeholders are required. Teams cycle through a process of planning, carrying out, and assessing once the job starts. Collaboration between team members and project stakeholders must always be ongoing.</p>

![image](https://user-images.githubusercontent.com/63627361/182371830-92249c92-0c3e-4129-82b5-fe84c37f246c.png)

<p align="justify">Agile project management is a word that can be used to refer to a variety of frameworks rather than a specific methodology. Extreme Programming (XP), Scrum, Kanban, and Adaptive Project Framework are examples of words associated with agile project management (APF).</p>

## State Managemenent

Data transport is made possible via state management within the program. Additionally, every time data is delivered, the application's state is altered, which forces a system rebuild.

<img width="468" alt="image" src="https://user-images.githubusercontent.com/63627361/182370971-f1e9a41e-b14f-4e2c-b1e2-d8ba44e94bb6.png">

<p align ="justify">Flutter provides stateful widget for such conditions however we rebuild the whole screen in such process consuming much more memory and the application to be slow and choppy. Using Getx is really easy and simple. We separate the UI and business logic in different files. After creating the structure of the project, we make a controller class for Getx.</p>

<img width="449" alt="image" src="https://user-images.githubusercontent.com/63627361/182371062-5027d2cd-496e-4965-9637-993c696bfd7e.png">

<p align ="justify">Here I have created a Getx controller to observe and pass the quantity of the product. Here, I've used the .obs prefix to indicate that the items variable is observable, allowing us to use the controller class to keep track of any changes to its value. We don't need to call notifylisteners, in contrast to providers. I'm just increasing the value of the count variable using the increment function.</p>

<img width="592" alt="getx" src="https://user-images.githubusercontent.com/63627361/182517260-a0d30bab-6363-45f0-85a1-70a30fe8c334.png">

<p align = "justify">Above image show cart controller that I have used var _product is used to store the contents of the product so that calculation can be made addproduct is the function that I have made in order to add the products in the cart. The function clearproduct is used so that the products can be cleared after checkout or by the user. Funtion total return the total amount of the cart by performing necessary calculations.</p>

## Appendix

### Mobile Phone

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182373992-8b5f9ecb-eaef-41ff-bb6f-80804fb2c4ae.png">
<p align ="left">Login Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374068-a84e08df-c9a4-4314-9a5e-f69244cb5985.png">
<p align ="left">Register Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374101-9d4acec8-0023-4fd2-bc8a-971ba66faeb3.png">
<p align ="left">Forgot Password Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374189-05d5e031-2bde-4994-a1f0-d12c40147758.png">
<p align ="left">Profile Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374216-b3bebc77-40b3-4fb6-9a2f-7a34b065f3cc.png">
<p align ="left">Message Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374237-9183027e-5409-4877-a821-2839ccc8cc35.png">
<p align ="left">Home Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374329-fcdd0e92-097e-4383-a8fe-e367126a7746.png">
<p align ="left">Empty Favourite Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374349-91bd3f43-dadb-44d1-ae37-dae9c195b0c0.png">
<p align ="left">Empty Cart Screen</p>


<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374382-1d0a089f-73e9-4645-993e-bde0f6959c92.png">
<p align ="left">Category Directed Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374502-f245f5df-5e5a-412a-8734-5dfbfeed230f.png">
<p align ="left">Product Detail Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374560-fa8a886c-7510-4d8c-92c5-3c528b001292.png">
<p align ="left">Product Favourited</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374629-cd428c27-2d4b-4abb-b131-b93393ca8a48.png">
<p align ="left">Favourite Screen Populated</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374713-e360dba6-2d19-445e-9e8a-ff3760f2264b.png">
<p align ="left">Cart Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374776-a6f5e353-6529-4e46-8684-655bea4a2700.png">
<p align ="left">Payment Screen</p>

<img width="307" alt="image" src="https://user-images.githubusercontent.com/63627361/182374813-6d193b10-8159-4377-8be1-26cdda554031.png">
<p align ="left">Success Screen</p>


### Tablet

![login](https://res.cloudinary.com/bilabthapa/image/upload/v1659495372/progulf/documentation/1.login_ncun0s.png)
<p align ="center">Login Screen</p>

![register](https://res.cloudinary.com/bilabthapa/image/upload/v1659495372/progulf/documentation/2.register_xgknag.png)
<p align ="center">Register Screen</p>

![profile](https://res.cloudinary.com/bilabthapa/image/upload/v1659495373/progulf/documentation/3.profile_uvgzt1.png)
<p align ="center">Profile Screen</p>

![message](https://res.cloudinary.com/bilabthapa/image/upload/v1659495372/progulf/documentation/4.message_mi4n5z.png)
<p align ="center">Message Screen</p>

![homescreen](https://res.cloudinary.com/bilabthapa/image/upload/v1659495373/progulf/documentation/5.home_knhusl.png)
<p align ="center">Home Screen</p>

![categoryview](https://res.cloudinary.com/bilabthapa/image/upload/v1659495373/progulf/documentation/6.product_tqelto.png)
<p align ="center">Category Product Screen</p>

![productdetail](https://res.cloudinary.com/bilabthapa/image/upload/v1659495374/progulf/documentation/7.productview_u1plxp.png)
<p align ="center">Product View Screen</p>

![favourite](https://res.cloudinary.com/bilabthapa/image/upload/v1659495376/progulf/documentation/8.favourite_sswm45.png)
<p align ="center">Favourite Screen</p>

![cart](https://res.cloudinary.com/bilabthapa/image/upload/v1659495376/progulf/documentation/9.cart_xqifd9.png)
<p align ="center">Cart Screen</p>

![checkout](https://res.cloudinary.com/bilabthapa/image/upload/v1659495376/progulf/documentation/10.checkout_ptnjlj.png)
<p align ="center">Checkout Screen</p>

![success](https://res.cloudinary.com/bilabthapa/image/upload/v1659495384/progulf/documentation/11.success_pbtr28.png)
<p align ="center">Success Screen</p>

### WearOS

![cartadded](https://res.cloudinary.com/bilabthapa/image/upload/v1659496580/progulf/documentation/cart_added_loqsze.png)
<p align ="left">Success Notification</p>

![order](https://res.cloudinary.com/bilabthapa/image/upload/v1659496580/progulf/documentation/order_placed_iukck6.png)
<p align ="left">Order Placed Notification Screen</p>
  
![logout](https://res.cloudinary.com/bilabthapa/image/upload/v1659496580/progulf/documentation/log_out_kw7r3n.png)
<p align ="left">Logged Out Notification</p>

## Conclusion

<p align="justify">This application was created with the intention of providing efficient results for dealing with the online purchase of motor lubricants. The events for the app while it was being developed are those listed above. The target audience for the android app created with the aid of flutter and using agile development principles will be vehicle owners. The program was built using the MVP approach, which divided it into sections and tested each one to create a finished product with a user-friendly interface.</p>

## References 

<p align="justify">GeeksforGeeks. 2022. MVP (Model View Presenter) Architecture Pattern in Android with Example - GeeksforGeeks. [online] Available at: <https://www.geeksforgeeks.org/mvp-model-view-presenter-architecture-pattern-in-android-with-example/> [Accessed 1 August 2022].</p>

<p align = "justify">Wrike.com. 2022. What Is Agile Methodology in Project Management?. [online] Available at: <https://www.wrike.com/project-management-guide/faq/what-is-agile-methodology-in-project-management/> [Accessed 1 August 2022].</p>




![Hits](https://hitcounter.pythonanywhere.com/count/tag.svg?url=https://github.com/bilab-thapa/progulf)
