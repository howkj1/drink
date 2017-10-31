
[![Build Status](https://travis-ci.org/joshmccall221/drink.svg?branch=master)](https://travis-ci.org/joshmccall221/drink)
# Drink

![image](./tty.gif)
## Looking to contribute?

### Roadmap

MVP:
git pull
check youtube against current post/
generate posts for missing videos
set "published: false" for any videos older than newest 7 posts/videos
git mv posts/olderThanNewest7 to archive/
git commit -m "added (filenames) archived (filenames)"
git push


#### ToDo :

- [x] take parameters and set as variables
- [ ] check repo status and pull
- [x] scraping a youtube channel
- [ ] creating new post based on scraped data
- [ ] automatically updating post modal id
- [ ] updating youtube embed url
- [ ] commit
- [ ] push

### Drink is for Jekyll

[note: ] Drink is a work in progress with limited functionality as we get the initial code written for it.

Drink is built to automate Jekyll.

As of Oct. 3, 2017
Drink is being built to scrape a youtube channel and post new videos.

This is, however, nowhere near done.

For now, Drink will take an input of a youtube id parameter and do some magical stuffs. Complex scraper and additional functionality is only documented here for where we wish this project to go, whether it ever gets there or not. Be kind and pull request.




### Project History

Originally, we sought to automate a weekly routine task of posting a youtube video from a channel as a post. The first run of this automation system is built around our modified 'Agency Template'. The parser has been updated to handle video content pulled directly from the metadata tags in our modified theme _+_.

The original method was done by hand. A customer requested weekly updates to their site with a youtube post as the content. We would create a new post, screenshot the youtube video, save that to the img/ folder, update the image metatag accordingly, update the modal id, update the date tag, write in a youtube embed code, and push.
ALL BY HAND :(

We sliced a ton of this (up to) hour long tedious process by editing and updating the post/modal parser in Agency to handle external content natively. Image tags now handle external urls and the description can handle an embedded youtube link which gets displayed as a playable video. Initially, Drink will be writing posts in this new/modified format since its first role is a youtube channel scraper.

_+_ [todo : ] We have not made a clean / non-customer edition of the updated theme as a template to work with Drink. That may be next once Drink is up and going.



### Drink <param1>
(default)
drink.post(video tag)

### Drink <param1> <param2>
drink.param1(param2)

ex.
drink scrape channel
drink.scrape(channel)


### scraper:
- check repo status and pull
- scraping a youtube channel
- creating new post based on date
- automatically updating post modal id
- updating youtube embed url
- commit
- push


### future:
Drink might also be used to setup a local server to give Jekyll a place to Hyde.

1.) You don't want to "always" test in prod, do you?

2.) ...or do you?

Well, if your preference is the second option, then "Y.O.L.O."! and you can just forget about this (currently) non-existent Drink extension.


### MIT license :

Essentially, feel free to use (at your own risk), copy, clone, update, pull request... while keeping attribution of the original project owner for their idea(s) and work.

Drink ©2017 Jim Howk (howkj1)
