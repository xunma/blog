# My Blog

My Blog is a blogging website, where users can read and write. 

## Prerequisite
Set up with the following code
```bash
bundle install
yarn install
```
And be sure to run these👇 to get some random and funny and *Hitchiker's Guide to the Galaxy* related blogs written by Greek philosophers.
```bash
rails db:create
rails db:migrate
rails db:seed
```
If ```bash rails db:seed``` doesn't seed successfully, it is because there are not that many different Greek philosopher's names generated by ```Faker```, so there might be some overlapping. 
Do not worry. **Just run it again.**

Afterwards, use xun@mail.com and 1234567 to login, if you do not want to create your own account.
Have fun!

## Coding Journey
Following the basic CRUD functions, I added a **mark** feature. 
With mark, users can mark articles to read later or read again. 

### Obstacles🤡
Javascript for the mark feature took me some time to put together. I refer to my dear friend Google and codes I wrote before. Other things mostly went smooth.
There were a few silly things that took me a fair amount of time because I do not know everything by heart. For example, I know how to use devise for users, but I did not know I need to manually generate views for devise. It took me a long time to look through the folders to find a view file for...

## Design
Highligted with the most popular color of 2018 announced by Pantone, I made the design minimal. The idea is to make the webpage look like a real piece of paper in your notebook, with half-transparent bookmarks sticking out.

