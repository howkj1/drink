#!/bin/bash

# Drink is for Jekyll

# Drink is built to automate

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
## "Begin Drinking" should be dead last in this file.


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
  cd $drinkDIR;

  # recommend using instead? --> git add $prepDIR/*
  # TODO: all of these functions should maybe be able to respond to parameters handling repo directory to work within

  # commit with message "today's date along with youtube id or title?"
  # git commit -m "$date $youtubeid";
  echo "Committing Drink Output...";
  cd $drinkDIR;
  cd ../;
  git commit -m "Drink : generated files on `date +'%Y-%m-%d %H:%M:%S'`";
  cd $drinkDIR;

  # git push origin/master ?
  # TODO git push AFTER testing everything! Just uncomment next line.
  cd $drinkDIR;
  cd ../;
  git push;
  cd $drinkDIR;


  # update config / modalid
  # drink_cleanup;

  # echo "Congrats! You just got basic drunk."
  echo "Basic Drinking has completed.";

}




# full auto cli run :
basicDrink;
echo "You have quit Drinking.";
