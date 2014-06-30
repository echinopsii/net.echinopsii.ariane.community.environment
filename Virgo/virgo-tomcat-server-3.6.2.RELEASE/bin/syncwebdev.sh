#/bin/sh

SCRIPT="$0"

# SCRIPT may be an arbitrarily deep series of symlinks. Loop until we have the concrete path.
while [ -h "$SCRIPT" ] ; do
  ls=`ls -ld "$SCRIPT"`
  # Drop everything prior to ->
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    SCRIPT="$link"
  else
    SCRIPT=`dirname "$SCRIPT"`/"$link"
  fi
done

# determine kernel home
KERNEL_HOME=`dirname "$SCRIPT"`/..

# make KERNEL_HOME absolute
KERNEL_HOME=`cd "$KERNEL_HOME"; pwd`

cd ../../../

ARIANE_HOME=`pwd`

rm -rf $KERNEL_HOME/ariane/static/css/*
rm -rf $KERNEL_HOME/ariane/static/fonts/*
rm -rf $KERNEL_HOME/ariane/static/images/*
rm -rf $KERNEL_HOME/ariane/static/js/*

cp -R $ARIANE_HOME/ariane.community.core.portal/wresources/ariane/static/* $KERNEL_HOME/ariane/static/
cp -R $ARIANE_HOME/ariane.community.core.mapping/taitale/ariane/static/* $KERNEL_HOME/ariane/static/





