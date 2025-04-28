#!/bin/bash

read -p "What is the name of the directory we are looking for?: " input
check_dir=$(find / -name $input 2>/dev/null | head -n 1)

if [[ "$check_dir" == *"$input" ]]; then
    echo "The directory exists...moving to directory to continue..."
    cd $check_dir
    sleep 2
    read -p "What file are we looking for? This is case specific: " file1
    check_file=$(find $check_dir -name $file1 2>/dev/null)
        if [ ! -n "$check_file" ]; then
            echo "File doesn't exist. Please wait while I create your txt..."
            touch $file1.txt
            sleep 2
            echo "File is now created...."
        elif [ $check_file != $empty_file ]; then
            echo "File exists."
        fi
elif [[ "$check_dir" != *"$input" ]]; then
    echo "The directory does not exist. Please wait while we create it."
    work_dir=$(pwd)
    echo "Creating needed directory in the path: $work_dir"
    mkdir $work_dir/$input
    echo "Directory now exists....moving into new directory"
    cd $input
    read -p "What is the name of the file you would like to create? " file2
        if [[ -z "$file2 "]]; then
            read -p "That is not a valid entry. Give your child a name: " file2
            touch $file2.txt
            echo "File is now created. Here is the path: $work_dir/$input/$file2.txt"
        else
            touch $work_dir/$input/$file2
            sleep 2
            echo "File is now created. Here is the path: $work_dir/$input/$file2.txt"
        fi
fi
sleep 2
echo "Job completed. If you didn't receive the desired results, please try again."
