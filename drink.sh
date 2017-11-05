#!/bin/bash

# Drink is for Jekyll
# Drink is currently coded as a shell script (eventually move to python or other?)

# Drink is built to automate


# maybe use whiptail?


## begin magical code land ##

####    imports    ####

# this gets Drink's full path and stores as a variable for the rest of the functions.
# NOTE: this does not necessarilly equal the desired repo.
# Another variable should eventually be provisioned in addition to this one for parameterized repo locations.
drinkDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
echo $drinkDIR;
## drinkfunctions.sh: ##
# . $drinkDIR/drinkfunctions.sh --source-only;


#### end of imports ####


##### Statements Below This Line Kicks Off The Whole Shebang! #####

## This works in reverse linearity due to bash requiring functions loaded before being called.
## It is recommended to split these out into a function file...
## ...until switching to another programming language that can handle dynamic function calls.
##
## whiptail "Begin Drinking" should be dead last in this file.


### begin list of hillarious drinking jokes ###
# you must be drunk
# dead last
# I've been shot!
# you shot me!
# I must be drunk
# you finished drinking
# don't drink and drive
# beaker, elixer, drink... they're all the same... they all turn me into a monster.
# wanna play 'Hyde and seek'?
# They call me the doctor... I'll drink your problems away.
# I aint got no drinking problem... I aint got no problem drinking at all.
# A lager walks into a bar...
# They come in pints!?!
# You had a whole half already!
# I take elixir by mouth... and serum intravenously.
### end list of drank ###




## Oct 1, 2017
# (method 1) method involves reading in latest previous post, cloning, and manipulating new clone


## Oct 2, 2017
# (method 2) method uses a tracker file for modalid updates and just generates a whole new post!...
# ...so much cleaner and doesn't rely on old posts existing.
# might have a failure edge case if someone manually makes a post without updating tracker file.


## Oct 3, 2017
# (doing just the basics)
# making a choice here:
#
# use strictly bash variables and cli one-liner param setup
# vs
# stay in whiptail environment and let it handle user input / variables
#
# We'll want to eventually get it to be strictly cli capable with the ui as being optional
# strict cli would move the needle forward for full automation progress (thinking ahead for scrapers and such)


### Reminders for inital dev:
#
## Drink development doesn't have to care about:
# repo : it'll just attempt current directory
# youtube channel : basic Drink magic should only need the video id and parse data from that info
# date : just grab today's // or grab it from youtube uri somehow
#
## Drink does need to :
# remember to keep things simple in order to speed up development
# have sanity checks
# allow the user to preview and cancel when using Drink (before full auto gets built)
# eventually be able to run as an auto chron job using a config file or repo checking code for sanity
# not be able to endlessly loop into oblivion... I could see a simple error wiping all posts, leaving only the latest video, if not handled sanely.



# function drink_status {
#   # see if repo is clean so we don't have problems pushing later.
#   # also helps for protecting Drink Sanity Checks.
#
#   # git status;
#   # if clean continue,
#   # else do stuffs to reconcile... like force pull???
#
#   # we're just gonna grab the latest code for now:
#   git pull;
#
# }


# function drink_recipe {
#   # look for Drink.conf
#   # do stuffs
#   # check modal id
#
#   # look for Drink.conf
#   echo "";
#   echo -en "searching for Drink.conf \r";
#   # make a drink recipe if none found
#   [ ! -f $drinkDIR/drink.conf ] && echo -en "drink.conf not found. generating new config. \r" && touch $drinkDIR/drink.conf < "1";
#
#   ## do I make a global variable and just set it to 0 and update it if file found?
#   ## or do I make a function variable and pass it from drink_recipe over to drink_make ?
#
#   # make, set, or read in a modalid
#
#   # make, set, or read in the date for the post... use current date or video posted date or just parse video title?
#
#   # make, set, or read in the post title / video title ??? depending on youtube api, this might not be easy
#
#
#
#
# }


# function drink_make(parameter) {
#   # heavy lifting is done here
#
#   # Sanity Check!!!
#   # make new post (or cp old one)
#   # write data
#   # save file
#
# }
function drink_make() {
  #build latest drink
  echo "making drink...";
  npm start;

}

function drink_archive() {
  #cleans the _posts/ folder
  echo "putting away old drinks...";
  #if file doesn't exist in archive, move it to archive folder
  # https://unix.stackexchange.com/a/248548
  cd $drinkDIR;
  cd ..;
  mv -n ./_posts/* ./_archive/;
  cd $drinkDIR;
}

function drink_sip() {
  #run drink and generate output
  echo "sipping drink...";
  npm run demo;
}

function drink_post() {
  # posts new generated output to jekyll site
  echo "writing home about drinks...";
  mv -n $drinkDIR/output/* $drinkDIR/../_posts/;

}

# function drink_archive() {
#   # this one might be hard as it might need to read filenames for all of posts/
#
#   # Sanity Check!!!
#   # foreach older than modalid $oldnum
#   # write published:false
#   # and mv from posts/ to archive/
#
# }

# function drink_cleanup {
#
#   # Sanity Check!!!
#   # This should only get ran after successful previous functions!
#
#   # update config / modalid
#   # += $modalid
#
# }


function basicDrink {
  ## Keep It Stupidly Simple
  echo "Starting Recipe For Basic Drink...";

  # git status
  # drink_status;

  # TODO get latest repo revision
  #git pull;

  # look for config and modal info
  # drink_recipe;

  # shaken, not stirred
  drink_make;
  drink_archive;
  drink_sip;
  drink_post;



  # archive old post (leave certain number posted)
  ## drink_archive might be too complex for basicMagic and need pulled out of basicMagic routine.
  #drink_archive;

  # git status --> add all changes
  # should we re-use drink_status here in an extended form or just add all?
  echo "Adding drink output...";
  cd $drinkDIR;
  cd ../;
  git add ./* ; # this line could be dangerous and expose sensitive data if ran from wrong place

  # recommend using instead? --> git add $prepDIR/*
  # TODO: all of these functions should maybe be able to respond to parameters handling repo directory to work within

  # commit with message "today's date along with youtube id or title?"
  # git commit -m "$date $youtubeid";
  echo "Committing Drink Output...";
  cd $drinkDIR;
  cd ../;
  git commit -m "Drink : generated files on `date +'%Y-%m-%d %H:%M:%S'`";

  # git push origin/master ?
  # TODO git push AFTER testing everything! Just uncomment next line.
  #git push;

  # update config / modalid
  # drink_cleanup;

  # echo "Congrats! You just got basic drunk."
  echo "Basic Drinking has completed.";

}





# take parameters and set as variables
# - check repo status and pull
# - scraping a youtube channel
# - creating new post based on date
# - automatically updating post modal id
# - updating youtube embed url
# - commit
# - push

# function fullyAutomaticShotgun {
#   # this routine runs the full Drink automation suite
#   # ... drink the whole keg and party.
#
#   #  git diff-index --quiet HEAD -- || echo "untracked"; // do something about it
#   # git status;
#   git pull;
#   cp $lastNewestPost $newPost;
#   getHammered();
#   getWasted();
#   makeLove();
#   # add published:false line to metadata of x# old post and send it to archive folder
#   hideTheEvidence();
#   git add $postdir; echo "Look at you, you postdir child!";
#   git commit -m "$madeLove";
#
#   # $var1699 should contain today's/post's date
#   echo "PAAARRRRTTTAAAYYY! like its $var1699";
# }
#



# ###>>>> this format works for whiptail menus >>>>>
# function main_menu {
#
#   RETVAL=$(whiptail --title "Make a selection and Enter" \
#   --menu "Main Menu" 10 50 4 \
#   "1." "Fully Automatic Shotgun -->" \
#   "2." "ToDo - fix this" \
#   "3." "ToDo - be careful!" \
#   "4." "Quit Drinking" \
#   3>&1 1>&2 2>&3)
#
#   # Below you can enter the corresponding commands
#
#   case $RETVAL in
#       # a) echo "custom menu goes here"; whiptail --title "cutom menu" --msgbox "goes here" 10 50;;
#       1.) fullyAutomaticShotgun;;
#       2.) echo "ToDo";;
#       3.) echo "ToDo";;
#       4.) echo "You have quit Drinking.";;
#       *) echo "You have quit Drinking.";
#   esac
#   # c) echo "I Am The Machine!";;
#
# }
# ###<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#
#
# ### Begin Drikning - Dead Last ###
#
# if (whiptail --title "Begin Drinking" --yesno "Drink is here to help! However, Drink Assumes Ubuntu 16.04 w/ Unity desktop and comes witout warranty nor liability. Use at your own risk." --yes-button "Continue Drinking" --no-button "Quit Drinking" 8 78)
# then
#   main_menu;
# else
#   echo "You have quit Drinking." # quits right away
# fi;
#
# ### end menu ###
# #########################


# full auto cli run :
basicDrink;
echo "You have quit Drinking.";
