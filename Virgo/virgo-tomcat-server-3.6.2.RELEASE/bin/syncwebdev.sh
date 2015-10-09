#/bin/sh

HERE=`pwd`

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

cd $KERNEL_HOME

cd ../../../

ARIANE_HOME=`pwd`

rm -rf $KERNEL_HOME/ariane/static/css/*
rm -rf $KERNEL_HOME/ariane/static/fonts/*
rm -rf $KERNEL_HOME/ariane/static/images/*
rm -rf $KERNEL_HOME/ariane/static/js/*

cp -R $ARIANE_HOME/ariane.community.core.portal/wresources/ariane/static/ $KERNEL_HOME/ariane/static/
cp -R $ARIANE_HOME/ariane.community.core.mapping/taitale/src/main/webapp/ariane/static/* $KERNEL_HOME/ariane/static/

ls $ARIANE_HOME/ariane.community.core.mapping/taitale/target/*jar > /dev/null 2>&1
if [ $? -eq 0 ]; then
	rm $ARIANE_HOME/ariane.community.core.mapping/taitale/target/*jar
fi
minifyed_taitale_target=`ls -d $ARIANE_HOME/ariane.community.core.mapping/taitale/target/net* 2>/dev/null`
if [ $? -eq 0 ]; then
	cp -R $minifyed_taitale_target/ariane/static/* $KERNEL_HOME/ariane/static/
fi

list_xhtml_files=`find $KERNEL_HOME -name "*xhtml" | grep "net.echinopsii"` 

for target_file_path in $list_xhtml_files
do
	module=`echo $target_file_path | sed "s#$KERNEL_HOME/work/deployer/s/global/[0-9][0-9][0-9]/[0-9]/net.echinopsii.##g" | sed "s#.[0-9a-zA-Z]*-[0-9]*.[0-9]*.[0-9]*-SNAPSHOT.[0-9a-zA-Z/-]*.xhtml##g"`
	xhtml_file_name=`echo $target_file_path | sed "s#$KERNEL_HOME/[0-9a-zA-Z/.-]*META-INF##g" | sed "s#[0-9a-zA-Z/]*/##g"`
	source_file_path=`find $ARIANE_HOME/$module -name "$xhtml_file_name" | grep "src"`
	cp $source_file_path $target_file_path
done

cd $HERE
