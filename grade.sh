CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -e student-submission/ListExamples.java ]]
then
  echo "File found"
  cp student-submission/ListExamples.java ./
else
  echo "File not found"
  exit 1
fi

javac -cp $CPATH *.java 2>javac-errs.txt

if [[ $? -eq 0 ]]
then 
  echo "Compiled successfully"
else
  echo "Compiled unsuccessfully"
  exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples >out.txt

if [[ $? -eq 0 ]]
then 
  echo "Pass"
else
  echo "Fail"
fi


