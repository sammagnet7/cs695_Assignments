#!/bin/bash


GIT_COMMIT_ID="ab517660b8a2439024c63256333035f38eb04546"

TASK1_FILES="namespace_prog.c"
TASK2_FILES="simple_container.sh"
TASK3_FILES="conductor.sh config.sh"
TASK4_FILES="service-orchestrator.sh"

echo -e "\033[0;32mThis script should be executed just outside your submission directory\033[0m"

ROLL_NUMBER=""
read -p "Enter your roll number in lowercase: " ROLL_NUMBER

if [ -z "$ROLL_NUMBER" ]; then
    echo -e "\e[1;31mRoll number cannot be empty\e[0m"
    exit 1
fi

SOLUTION_DIR="${ROLL_NUMBER}_assignment3"

if [ ! -d "$SOLUTION_DIR" ]; then
    echo -e "\033[0;31m$SOLUTION_DIR not found in current working directory\033[0m"
    exit 1
fi

if [ ! -f "$SOLUTION_DIR/.git/logs/HEAD" ]; then
    echo -e "\033[0;31mCould't check git status within the submission direcroty033[0m"
    echo -e "\033[0;31mPlease make sure you move your solution within the latest assignment tarball\033[0m"
    exit 1
fi

SUBMIT_GIT_COMMIT_ID=$(cat $SOLUTION_DIR/.git/logs/HEAD | tail -1 | cut -d ' ' -f 2)

if [ "$GIT_COMMIT_ID" != "$SUBMIT_GIT_COMMIT_ID" ]; then
    echo -e "\033[0;31mGit commit id mismatch\033[0m"
    echo -e "\033[0;31mDon't commit anything within the submission directory\033[0m"
    exit 1
fi

SUBMISSION_DIR="${ROLL_NUMBER}_assignment3_submission"

if [ -d "$SUBMISSION_DIR" ]; then
    echo -e "\033[0;31m$SUBMISSION_DIR already exists. Delete or rename it\033[0m"
    exit 1
fi

mkdir $SUBMISSION_DIR

cp -r "$SOLUTION_DIR/.git" "$SUBMISSION_DIR/"

[ -f "$SOLUTION_DIR/.gitignore" ] && cp "$SOLUTION_DIR/.gitignore" "$SUBMISSION_DIR/"

mkdir $SUBMISSION_DIR/{task1,task2,task3,task4}

TASK1_DONE=true

for file in $TASK1_FILES; do
    if [ ! -f "$SOLUTION_DIR/task1/$file" ]; then
        echo -e "\033[0;31m$file not found in $SOLUTION_DIR/task1\033[0m"
        echo -e "\033[0;31mSkipping Task 1\033[0m"
        TASK1_DONE=false
    else
        cp "$SOLUTION_DIR/task1/$file" "$SUBMISSION_DIR/task1/"
    fi
done

TASK2_DONE=true

for file in $TASK2_FILES; do
    if [ ! -f "$SOLUTION_DIR/task2/$file" ]; then
        echo -e "\033[0;31m$file not found in $SOLUTION_DIR/task2\033[0m"
        echo -e "\033[0;31mSkipping Task 2\033[0m"
        TASK2_DONE=false
    else
        cp "$SOLUTION_DIR/task2/$file" "$SUBMISSION_DIR/task2/"
    fi
done


TASK3_DONE=true

for file in $TASK3_FILES; do
    if [ ! -f "$SOLUTION_DIR/task3/$file" ]; then
        echo -e "\033[0;31m$file not found in $SOLUTION_DIR/task3\033[0m"
        echo -e "\033[0;31mSkipping Task 3\033[0m"
        TASK3_DONE=false
    else
        cp "$SOLUTION_DIR/task3/$file" "$SUBMISSION_DIR/task3/"
    fi
done

TASK4_DONE=true

for file in $TASK4_FILES; do
    if [ ! -f "$SOLUTION_DIR/task4/$file" ]; then
        echo -e "\033[0;31m$file not found in $SOLUTION_DIR/task4\033[0m"
        echo -e "\033[0;31mSkipping Task 4\033[0m"
        TASK4_DONE=false
    else
        cp "$SOLUTION_DIR/task4/$file" "$SUBMISSION_DIR/task4/"
    fi
done


echo ""
echo -e "\033[0;32mSubmission directory created\033[0m"
echo -e "\033[0;32mSubmissions for the following tasks were found and added\033[0m"
[ "$TASK1_DONE" = true ] && echo -e "\033[0;32mTask 1\033[0m"
[ "$TASK2_DONE" = true ] && echo -e "\033[0;32mTask 2\033[0m"
[ "$TASK3_DONE" = true ] && echo -e "\033[0;32mTask 3\033[0m"
[ "$TASK4_DONE" = true ] && echo -e "\033[0;32mTask 4\033[0m"

echo ""
echo -e "\033[0;32mVerify the submission directory yourself once\033[0m"
echo "Only required scripts and files are added to the submission directory"
echo "that needed to be modified."
echo "Please make sure you are not adding any unnecessary files"
echo ""

tar -czf "${SOLUTION_DIR}.tar.gz" $SUBMISSION_DIR

echo -e "\033[0;32mSubmission tarball created\033[0m: ${SOLUTION_DIR}.tar.gz"

echo -e "\033[0;32mPlease verify the contents of the tarball before submission\033[0m"


