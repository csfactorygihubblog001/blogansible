#!/bin/bash
declare -A extra_hash
extra_hash["reinstall_openvpn"]="no"
extra_hash["reinstall_selenium"]="no"
extra_hash["reinstall_mysql"]="no"
extra_hash["vagrant_mode"]="no"
extra_vars=""
for key in ${!extra_hash[@]}; do
	tmp="\"${key}\" : \"${extra_hash[$key]}\""

	if [ "x${extra_vars}" = "x" ];then
		extra_vars=$tmp
	else
		extra_vars=$extra_vars,$tmp
	fi
done

	if [ "x$extra_vars" != "x" ];then
		extra_vars="{ $extra_vars }"
		echo "Ansible実行します。パラメータ$extra_vars"
		ansible-playbook ./site.yml  --extra-vars "$extra_vars"
	else
		echo "Ansible実行します。パラメータ無し"
		ansible-playbook ./site.yml
	fi
