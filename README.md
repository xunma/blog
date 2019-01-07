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

