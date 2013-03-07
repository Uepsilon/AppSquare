# AppSquare

## Just an  Application-App

This litte Application was created to present informations about myself. Basically it is just plain HTML with some CSS- and JS-Improvements. Additionally it comes with a login which I can distribute to whomever I'd like to be able to read my information. Furthermore it is possible to have multiple accounts with different informations visible to them.

### Creating an private area

* To create an private area for a special account, just set the `channel` to whatever you like (e.g. bonsai-kittens).
* Now create a snippet called `_bonsai-kittens.html.haml` (or whatever you called the channel) and insert the data you like.
* You can even add a file to download by renaming it to `bonsai-kittens.pdf`, placing it to "shared/files/" and adding a link to your snippet:

        = link_to "Click here to Download", :download

The User who logs in with that specific account will now see the content of that special snippet and can download that file. Anybody else will still see the default data. And even if they try to download that file (via calling /download manually), they won't be able due to the channel-attribute.