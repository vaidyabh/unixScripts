######################################################################################
# Script_Name : read_lines_in_step.sh
#
# Description:	
#				This script will read the line by line data from a file.
#				It will read 20 lines at a time and print the data
#
# Modules:
#			Module1 : If the data file have more than 20 lines
#			Module2 : If the data file have less than 20 lines
#
######################################################################################


#Finding the root folder from where script is invoked

export rootFolder=$(cd $(dirname $0) > /dev/null 2>&1; pwd);
export confFolder=${rootFolder}/../config

#Reading the command line arguments using the Getopts Method
usage()
{
	echo "Usage: $0 Invalid number of arguments are passed"
	echo ""
	echo "  -A: File with the data to read                "
	
	echo ""
}

while getopts "A::h" opt;
do
	case $opt in
		A) fileName=${OPTARG};; 
		*) usage
			exit 9;;
	esac
done

#Module1 : Function to read the data if the number of the lines greter than 20

while read line
do	
	#Reading the lines one by one with , as delimiter
	readLine=`echo $line | cut -f1 -d','`
	
	#Counter value to check the number of the lines read by current process
	countValue=`expr ${countValue} + 1`
	
	#Appending the lines with comma separated values
	readData=${readLine},${readData}
	
	#Print the lines when counter values reaches 20
	if [ ${counterValue} -eq 20 ]
	then
		#Replacing the last comma with blank space
		readData=`echo ${readLine} | sed s '/,$//g'`	
		echo "Printing the set of 20 lines"
		echo "Data is : $readData"
	#Resetting the value of the counter and data file 
		countValue=0
		readData=""
	fi
done <$FILE_NAME

#Module2 : Number of lines are less than in the readFile

	readData=`echo ${readLine} | sed s '/,$//g'`	
	echo "Printing the set of 20 lines"
	echo "Data is : $readData"