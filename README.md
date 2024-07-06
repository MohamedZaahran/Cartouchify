# Hieroglyphic Language Identification in Ancient Egyptian Manuscripts

## Project Overview:
This project, developed as part of our graduation requirement from Ain Shams University's Faculty of Computer & Information Sciences, aims to identify and interpret Egyptian hieroglyphic symbols using a user-friendly application. The app utilizes advanced image recognition technology to make the study of ancient Egyptian writings accessible to everyone.

## Team Members:
- Mustafa Hosny Mohamed El-Sayed.
- Mohamed Ashraf Sayed Hussein.
- Mohmed Ehab Fathy Zahran.
- Seif ElDin Hesham Mohamed Raafat.
- Salma Adel Shahin Omar.
- Salma Hossam Ahmed Abdo.

## Supervisors:
- Dr. Mona Abdel Azim, Information Systems Department.
- Mohamed Essam, Bioinformatics Department.
  
## Abstract:
The complexity of Egyptian hieroglyphics limits the ability of tourists and enthusiasts to fully appreciate Egypt's cultural heritage. Our application identifies and interprets hieroglyphic symbols from images or sketches, provides historical context, and displays related locations on Google Maps.

## Features:
- Hieroglyphic Symbol Recognition: Uses image recognition to identify symbols.
- User-Friendly Interface: Easy to navigate for all users.
- Historical Information: Provides detailed information about symbols and their historical context.
- Google Maps Integration: Shows locations of historical places.

## System Architecture of the Hieroglyphic Identification Application:
![Screenshot 2024-07-06 144105](https://github.com/SeifHesham2/HieroSecret/assets/90388102/c647b3d2-2db4-4e70-a76e-92f57c715027)


The system architecture for the hieroglyphic identification application is designed to ensure modularity, scalability, and ease of maintenance. It consists of three primary layers: Presentation Layer, Business Layer, and Database Layer. Each layer has specific responsibilities and interacts with the others to provide a seamless user experience.

#### 1. Presentation Layer

- **User Interface (UI)**: The front-end component where users interact with the system. Users can upload images for hieroglyph scans, view results, and access their history of scans. The UI is designed using Flutter, ensuring responsiveness and an intuitive experience across different devices.

#### 2. Business Layer

- **Image Preprocessing**: Prepares images for analysis by resizing, reducing noise, and normalizing them to ensure optimal format for processing.
  
- **Object Detection**: Utilizes advanced techniques such as Convolutional Neural Networks (CNNs) to identify and isolate hieroglyph symbols within the images.

- **Image Classification**: Classifies each detected hieroglyph using pre-trained models, recognizing individual symbols from a predefined set.

- **Symbol Mapping**: Maps the identified symbols to their corresponding meanings using a hieroglyphics dictionary, providing semantic interpretation.

- **Hieroglyphic Name Generation**: Generates names or phrases in hieroglyphs based on user input in English.

- **History of Last Detected Scans**: Maintains a log of all scans performed by the user, including details such as date, input image, detected symbols, and their meanings.

- **Historical Places**: Provides information about historical places, including images, descriptions, and locations on Google Maps, enriching the user's experience by offering contextual information.

#### 3. Database Layer

- **Users Database**: Stores user-related information, including login credentials, personal details, and scan history.

- **Places Database**: Contains information about various historical places, supporting the historical places module in the business layer.

#### Interactions Between Components

- **User Interface to Business Layer**: When a user uploads an image, the UI sends it to the Image Preprocessing module in the business layer. After preprocessing, the image is passed to the Object Detection and Image Classification modules to identify and classify hieroglyph symbols. The detected symbols are then mapped to their meanings using the Hieroglyphics Dictionary. The results are sent back to the UI for display, and the scan details are stored in the History of Last Detected Scans.

- **Database Layer Access**: The business layer accesses the Users Database to store and retrieve user-specific data, including scan history. It also accesses the Places Database to fetch and display information about historical places.

This multi-layered architecture ensures that the system is well-organized, with each component performing its designated role efficiently, providing users with a robust and informative hieroglyph identification experience.

## Model Architectures Used:

#### 1. SqueezeNet

**Explanation**: SqueezeNet is a small and efficient convolutional neural network architecture designed for image classification. It achieves AlexNet-level accuracy with 50x fewer parameters and a model size of less than 0.5MB. SqueezeNet uses a "squeeze" and "expand" strategy to reduce the number of parameters:

- **Squeeze Layers**: Reduce the number of input channels using 1x1 convolutions.
- **Expand Layers**: Increase the number of output channels using a combination of 1x1 and 3x3 convolutions.

**Modifications**: The original SqueezeNet architecture was modified to create "SqueezeNet Tuning Through Gradual Unfreezing." Initially, all layers were frozen, and layers were gradually unfrozen from the bottom to the top during the training process. This approach helped fine-tune the model more effectively, improving performance on the specific dataset without overfitting.

**Gradual Unfreezing**: This technique involves starting the training process with all layers frozen except the final layer. Gradually, layers are unfrozen from the last layer to the first, allowing them to learn and adjust weights based on the new data【7:2†source】.

#### 2. YOLOv8m (Object Detection)

**Explanation**: YOLO (You Only Look Once) is a state-of-the-art object detection algorithm known for its speed and accuracy. YOLOv8m is a variant of the YOLOv8 model optimized for medium-sized models. It uses a single neural network to predict bounding boxes and class probabilities directly from full images in one evaluation, making it extremely fast.

- **Architecture**: YOLOv8m consists of multiple convolutional layers followed by fully connected layers. It divides the image into grids and predicts bounding boxes and probabilities for each grid cell.

- **Object Detection**: The model predicts multiple bounding boxes per grid cell and applies non-max suppression to refine the final set of boxes, ensuring only the most likely detections are retained.

**Metrics**:

- **Recall**: Measures the model's ability to find all relevant objects in the test images.


- **mAP50**: Mean Average Precision at IoU threshold 0.50, evaluating how well the model detects objects with a moderate margin of error.

- **mAP50-95**: Mean Average Precision at IoU thresholds from 0.50 to 0.95 in increments of 0.05, providing a comprehensive evaluation across different IoU thresholds.

These models, SqueezeNet and YOLOv8m, form the core of the image classification and object detection processes within the hieroglyphic identification application, ensuring high accuracy and efficient performance.

## Screenshots:
- Onboarding Screen: This screen shows the name of the application.

![Screenshot 2024-07-06 123536](https://github.com/SeifHesham2/HieroSecret/assets/90388102/3cd5b561-037a-403f-96d7-acd624957739)



- Login Screen: This screen allows the user who is already registered to enter his email and password to log in to the app.
Steps:
- Enter Your Email.
- Enter Your Password.
- Press on the login button to navigate to the app.
- If you are a new user you can press on Sign Up to navigate to registration.
   
![Screenshot 2024-07-06 123733](https://github.com/SeifHesham2/HieroSecret/assets/90388102/535de5c5-57f1-4a5e-9aad-d9a4fc33ade7)


Signup Screen: This screen makes the user enter his Full Name, Email, password, and Confirm password.
Steps:
- Enter Full Name.
- Enter Email.
- Enter Password and Confirm Password.
- Press on the Sign Up button.

![Screenshot 2024-07-06 123826](https://github.com/SeifHesham2/HieroSecret/assets/90388102/6cd89287-05ff-42a8-9f52-cbd40ebe98ce)



Welcome Screen: This screen welcomes the user when they sign in or sign up.

![Screenshot 2024-07-06 123938](https://github.com/SeifHesham2/HieroSecret/assets/90388102/a2ee84d9-19d4-459d-af79-577e5e6300b5)



Home Screen: This screen contains news about museums and the activities of the app.
Steps: 
- Click on Name Generator if you want to generate your name with hieroglyphic symbols.
- Click on Explore Places if you want the locations of museums.
- Click on learn hieroglyphics to view the hieroglyphics dictionary (Gardiner's list)
- Click on last scanned if you want to see your history
- Click on the lens to capture or to select a picture for symbol for detection
- Click “on profile” button to view your profile.

![Screenshot 2024-07-06 124027](https://github.com/SeifHesham2/HieroSecret/assets/90388102/afff31de-64a7-49d0-a3a4-d85b0d9721c4)



Explore Places Screen: This screen contains names and descriptions of Museums and temples, if you want to get more information click on it.

![Screenshot 2024-07-06 124116](https://github.com/SeifHesham2/HieroSecret/assets/90388102/6549ca5d-7106-46a4-a2c6-8dc82d7ddeda)



Details Screen: This screen contains details about the selected item, and you can get the location by clicking on the Get Address button. 

![Screenshot 2024-07-06 124147](https://github.com/SeifHesham2/HieroSecret/assets/90388102/2992afa4-572b-4144-b1c4-b42ebd76988f)


Name Generator Screen: This screen generates your name in hieroglyphics.

![Screenshot 2024-07-06 124513](https://github.com/SeifHesham2/HieroSecret/assets/90388102/8671169f-28b5-4b1f-b744-bf033777526c)


Learn Hieroglyphic Screen: This screen displays the hieroglyphics dictionary (Gardiner's list).

![Screenshot 2024-07-06 124606](https://github.com/SeifHesham2/HieroSecret/assets/90388102/9693602b-3c66-4390-a8ea-c33f8a658b7c)



Scanned Result Screen: This screen shows the details of the detected symbol.

![Screenshot 2024-07-06 124632](https://github.com/SeifHesham2/HieroSecret/assets/90388102/508a917e-e9fd-4fd0-9ff0-237e32817e2a)



Last Scanned Screen: This screen shows the last scans made by the user.

![Screenshot 2024-07-06 124700](https://github.com/SeifHesham2/HieroSecret/assets/90388102/d3b2318e-37ec-4a78-9800-ec04773a2477)



User Profile Screen: This screen contains the user's information.

![Screenshot 2024-07-06 124734](https://github.com/SeifHesham2/HieroSecret/assets/90388102/ffb5c47c-b22b-4e25-b8aa-1f12c98c4408)



## Technology Stack:

![Screenshot 2024-07-06 132541](https://github.com/SeifHesham2/HieroSecret/assets/90388102/11d9f0b8-c100-4f84-813d-9ab751721608)



## Methodology:
The application processes images through object detection and classification models to identify hieroglyphic symbols. These models have been trained on extensive datasets of hieroglyphic images to ensure high accuracy.

## Results: 
Accurate recognition of hieroglyphic symbols.  
  ### Object Detection Model Result:
  
![Screenshot 2024-07-06 132808](https://github.com/SeifHesham2/HieroSecret/assets/90388102/6c6a5354-c5c2-4ddd-ada8-470ae588712a)


  ### Classification Models Results:
  
![Screenshot 2024-07-06 134018](https://github.com/SeifHesham2/HieroSecret/assets/90388102/16c23478-7d46-42b5-ac65-096b714e30a7)


## Future Work:
- Expand the database with more symbols and historical contexts.
- Improve the accuracy of the recognition system.
- Add more interactive features for learning hieroglyphics.

## Conclusion:
Our application bridges the gap between complex ancient texts and modern-day users, making the study of Egyptian hieroglyphics accessible and engaging for everyone.
