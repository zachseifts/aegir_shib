#!/bin/bash

AEGIR=/var/aegir
HOSTMASTER=$AEGIR/hostmaster-6.x-1.2/profiles/hostmaster/modules
PROVISION=$AEGIR/.drush/provision
HERE=$(pwd)
SHIB_AUTH=shib_auth
SHIB_SERVICE=shib_service

if [ ! -d "$AEGIR" ]
then
  echo "Is aegir installed?"
  exit 1
fi

if [ -L $PROVISION/$SHIB_SERVICE ]; then
  rm $PROVISION/$SHIB_SERVICE
fi
ln -s $HERE/$SHIB_SERVICE $PROVISION/$SHIB_SERVICE

if [ -L $HOSTMASTER/$SHIB_AUTH ]; then
  rm $HOSTMASTER/$SHIB_AUTH
fi
ln -s $HERE/$SHIB_AUTH $HOSTMASTER/$SHIB_AUTH

