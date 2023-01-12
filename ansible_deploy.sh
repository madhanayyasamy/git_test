#!/bin/bash
# Copy source files to penetratindev environment   
echo "folder"
echo $0
part1="$(dirname "$0")"
echo $part1
part2="$(basename "$0")"
echo $part2
cd $part1
export file_contents=`cat version-angular.html`
#export ansible_inventory=`cat env.txt`
ansible_inventory=$(head -n 1 env.txt)
if [[ ${ansible_inventory} != "" ]]
then
echo $ansible_inventory
cd /home/ubuntu/cync-devops-ansible
ansible-playbook playbooks/angular.yml -i "dynamic-inventory/$ansible_inventory" --extra-vars "angular_version=$file_contents"
else
  echo  " ${ansible_inventory} env name is not passed "
fi
