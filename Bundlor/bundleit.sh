#!/bin/bash
#set -x

. ./lib/pkgFactory.lib.sh

parse() {
    gopts="0";
    while getopts "hf:o:t:p:" ACTION
    do
	gopts="1";
	case $ACTION in
	    f)
		option_b_input_jar=$OPTARG
		;;
	    o)
		option_b_output_jar_dir=$OPTARG
		;;
	    t)
		option_b_manifest_path=$OPTARG
		;;
	    p)
		option_b_profile_path=$OPTARG
		;;	    
	    ?)
		usage
		;;
	esac
    done

    if [[  "$gopts" = "0" ]]; then
	usage;
    fi
}

here=`pwd`

if [ ! -f "profile.${USER}" ]; then
    echo "Your profile is not defined in $here/profile.${USER}.";
    echo "You can find a sample here: $here/profile.template.";
    exit;
fi

. ./profile.${USER}

option_b_input_jar=""
option_b_output_jar_dir=""
option_b_manifest_path=""
option_b_profile_path=""

parse $*

actionBundlor $action
