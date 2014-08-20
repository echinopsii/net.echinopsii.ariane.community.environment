#!/bin/bash

usagepkg() {
    echo "  -f : input jar file to be bundlized";
    echo "  -o : output jar file directory path";
    echo "  -t : bundlor manifest path";
    echo "  -p : bundlor profile path";
    echo "";        
}

usage() {
    echo "usage: $0 [options - see options section] [-h : show this message]";
    echo ""
    usagepkg;
    exit;
}

actionBundlor() {
    if [[ "$option_b_input_jar" = ""  ]] || [[ ! -f $option_b_input_jar ]]; then
	echo "The input jar file to be bundlized is not defined correctly."
	usage=1;
    fi
    if [[ "$option_b_output_jar_dir" = "" ]] || [[ ! -d $option_b_output_jar_dir ]]; then
	echo "The bundle target directory is not defined correctly."
	usage=1;
    fi
    if [[ "$option_b_manifest_path" = "" ]] || [[ ! -f $option_b_manifest_path ]]; then
	echo "The bundlor manifest path is not defined correctly."
	usage=1;
    fi
    if [[ "$option_b_profile_path" = "" ]] || [[ ! -f $option_b_profile_path ]]; then
	echo "The bundlor manifest path is not defined correctly."
	usage=1;
    fi
    if [ ! -x "$BUNDLOR_HOME/bin/bundlor.sh" ]; then
	echo "The BUNDLOR_HOME is not defined correctly."
	usage=1;
    fi
 
    if [ "$usage" = "1" ]; then
	usage;
    else
       set -x
       mkdir /tmp/bundlor
       $BUNDLOR_HOME/bin/bundlor.sh -i $option_b_input_jar -m $option_b_manifest_path -o /tmp/bundlor -p $option_b_profile_path
       bname=`more $option_b_manifest_path | grep "Bundle-SymbolicName:" | sed "s/Bundle-SymbolicName: //g" | sed "s/\r//g"`
       version=`more /tmp/bundlor/META-INF/MANIFEST.MF | grep "Bundle-Version:" | sed "s/Bundle-Version: //g" | sed "s/\r//g"`
       outJarFileName="$bname-$version.jar"
       
       cp $option_b_input_jar $option_b_output_jar_dir/$outJarFileName
       zip -d $option_b_output_jar_dir/$outJarFileName META-INF/MANIFEST.MF > /dev/null
       jar -umf /tmp/bundlor/META-INF/MANIFEST.MF $option_b_output_jar_dir/$outJarFileName
       echo "-----"
       echo "MANIFEST OF BUNDLE $option_b_output_jar_dir/$outJarFileName:"
       echo ""
       unzip -p $option_b_output_jar_dir/$outJarFileName META-INF/MANIFEST.MF
       rm -rf /tmp/bundlor
       set +x
    fi
}
