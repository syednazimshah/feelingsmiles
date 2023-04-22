# Feeling Smiles
 An emotion detection application for the blind.
# About the Project:
Feeling Smiles is an Android mobile application that aims to make conversations more meaningful for visually impaired people. Without any sort of aid, visually impaired people can only judge the emotions and/or reactions of the other person through the sound of their voice. However, we intended to take this a step further and allow users of the application to judge emotions based on the facial expressions of the people they talk to. The user of the application gets to differentiate between 3 classes of emotions, namely: Happy, Angry, and Sad. This differentiation is made based on haptic feedback outputs given by the application. More specifically, a unique vibration is assigned to each emotion which makes the responses easy to discern
# Screenshots
![image](https://user-images.githubusercontent.com/56303328/233780720-d5f2a41e-d4b8-44ad-aa52-9e0c91ba5ef7.png)
# Working
Flutter implementation details are as follows:
We installed the tflite package and imported our model.tflite file into our app code along with the labels. Then we installed the camera package. Then we wrote two separate functions to Initialize our camera and our tflite model, after calling them we were ready to work with the skeleton of the app. Once we had both camera and model running, we took a step further by integrating Icon faces to represent our output. The final touch was given using the vibrations and specifying the different vibrations i.e. hard for angry, medium for happy, and light for sad.
# Validation Loss and Accuracy
Heres our Graphs that show the Validation loss and accuracy
![image](https://user-images.githubusercontent.com/56303328/233780933-a21a1f1f-3afa-43d2-b104-fe766e8f1ad3.png)
