# AppSquare

## Just an  Application-App

This litte Application was created to present informations about myself. Basically it is just plain HTML with some CSS- and JS-Improvements. Additionally it comes with a login which I can distribute to whomever I'd like to be able to read my information. Furthermore it is possible to have multiple accounts with different informations visible to them.

### Creating an private area

1. Generate User with `channel` of choice. (e.g. bonsai-kittens). The name and password is what the one should receive who should be able to view that specific data.

        User.create :username => "Duck-Norris", :password => "whateveritshouldbe", :channel => "bonsai-kittens"

2. Create a snippet:
  * Create new file in `app/views/pages/snippets`
  * Name it `_CHANNELNAME.html.haml` (e.g. `_bonsai-kittens.html.haml`)
  * Add content for the created user

3. (Optional) Generate a pdf-File with specific content for that user. Place it in `shared/files` and name it `CHANNEL.pdf` (e.g. `bonsai-kittens.pdf`). Then add this link to the generated snippet.

        = link_to "Click here to Download", :download

The User who logs in with that specific account will now see the content of that snippet (and can download that file if you created one and added the link). Anybody else will still see the default data (and will not be able to download the pdf. And even if they try to download that file (via calling /download manually), they won't be able due to the channel-attribute.)