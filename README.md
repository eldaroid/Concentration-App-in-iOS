## Concentration-App-in-iOS

Concentration game development stage by stage:

        1. Project creation and cofiguration
        2. Creating UIButtons and Label
                1. Creating UIButtons
                2. Creating Label
                3. Outlet Collection
        3. Dynamic Counter and the ability to flip the map when pressed
        4. Game model design
                1. Creating files for model
                2. Creating structure of our application
                3. Using our class to alive application
                4. Disappearance of cards
  
# 1. Project creation and configuration

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/project_creation0.png)

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/project_creation01.png)

Move unnecessary files to the new folder. 
Press Command and select files

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/project_creation2.png)

Right-click and choose New Group from Selection

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/project_creation3.png)

Give him the name: Supporting Files

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/project_creation4.png

# 2. Creating UIButtons and Label

   # 1. Creating UIButtons

On Main.storyboard set up background to black

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons_and_Label.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons_and_Label2.png)

Click the plus to add a features or ⌘ + ⇧ + L

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons%20_and_Label3.png)

Select Buttons and transfer them to our phone

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons%20_and_Label4.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons%20_and_Label5.png)

Background to orange and delete text

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons%20_and_Label6.png)

And copy it 

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons%20_and_Label7.png)

Select and transfer Buttons to our ViewController with CTRL

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons%20_and_Label8.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/Creating_UIButtons%20_and_Label9.png)

   # 2. Creating Label

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/creating_label.png)

⌘ + ⇧ + L

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/creating_label2.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/creating_label3.png)

Color to white

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/creating_label4.png)

Select and transfer Label to ViewController with CTRL

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/creating_label5.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/creating_label6.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/creating_label7.png)

   # 3. Outlet Collection
   
Creating Outlet Collection with handling CTRL and transfer our button to ViewController
   
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/outlet_collection.png)

Next, we should add other our Buttons to outlet collection, exactly with CTRL

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/outlet_collection2.png)

3. Dynamic Counter and the ability to flip the map when pressed

Сonnect our flipCountLabel with a button:

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/outlet_collection3.png)

FlipCard:

We look if the array of buttons contains the index of our pushed button, then we call the flipCard function

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/flip_card.png)

АlipCard looks if its text is equal emoji, then we change the text to "" and the color to orange and does the opposite if the card is faceDown

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/flip_card2.png)

So that we have not only 1 emoji for all cards, we create an array of emoji

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/flip_card3.png)

and refer to its index

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/flip_card4.png)

 This is what we have at the output

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/flip_card5.png)

Now you need to make emoji randomly select. For this we create a dictionary

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/flip_card6.png)

And function which takes an array of buttons and our touched button and looks if there are already emoji in our array by the index of the touched button

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/flip_card7.png)

Then it creates a random index in our emoji array and assigns it to the array. At the same time, we delete the emoji itself so that we no longer meet it.

# 4. Game model design

   # 1. Create files: Concentration and Card

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design2.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design3.png)

and also create a card file

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design4.png)

   # 2. Creating structure of our application

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design5.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design6.png)

And just initialize the empty class

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design7.png)

But we need to gameble construction, not empty.
So, we need to create some cards.

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design8.png)

And identifier will be automatically numerated, started with 1

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design9.png)

To calculate how many cards we need, we use this

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/game_model_design10.png)

!!! But why cardButtons does not initialized yet, it is a question. Even we put our code below the line,where cardButtons initializing.
To solve this problem, you can add a lazy before the var.

  # 3. Using our class to alive application

Call the variable.

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/alive_applecation.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/alive_applecation2.png

Now we need to link our model to View using new function updateViewFromModel()

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/alive_applecation3.png)
![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/alive_applecation4.png)

and slightly change emoji func

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/alive_applecation5.png)

Egegey! Our application works!

   # 4. Disappearance of cards

In order to check whether the cards are identical or not, we need to remember the identifier of the previous card. We create var indexOfOneAndOnlyFaceUpCard for these purposes.

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/disappearance.png)

Then we check if the cards have not yet been found, that is, there are two options: when 1 card has already been selected and other options (no 1 has been selected yet, 2 have been selected)

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/disappearance2.png)

matchIndex! = index to check if not the same map is selected

When updating the View, you need to see if the map already matches

![alt text](https://github.com/eldaroid/pictures/blob/master/Concentration/disappearance3.png)

















