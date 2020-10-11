# articles_

This flutter application helps to add a title and description to an image, and displays all the images added. Images can be uploaded just by giving image url as an input.

# Points to Note-

1. I have used Firebase and Firestore for the uploading to, storing and fetching back the data.
2. I have used Provider package for the purpose of state managemnet of the Collection constructed in Firestore for realtime and smooth display of the added data.
3. I have used models to make a custom object of the data field receive from Firestore, hence using only using the three (title, description and imageUrl) properties that I wanted.
4. I have implemented the concept of OOPs to made the code more readable.
5. I have to still work on making the UI better.
6. I have to work on overflowing of the pixels.
7. I have to add comments in my code.
8. I experienced a very unusal error where it said that-----
  #           No matching client found for package name 'com.example.articles'-
   -----it was because I had accidentally uploaded the json file of another project, and did not realise it till very late.



Video of my app-
![ezgif com-gif-maker](https://user-images.githubusercontent.com/32004692/95677431-24ee2280-0be3-11eb-93b2-b4c895602df9.gif)
