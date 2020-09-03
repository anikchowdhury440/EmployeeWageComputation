#!/bin/bash -x

# CONSTANTS FOR THE PROGRAM
IS_PART_TIME=1
IS_FULL_TIME=2
MAX_HRS_IN_MONTH=100
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20

#VARIABLES
totalEmpHrs=0
totalWorkingDays=0

function getWorkingHours(){
	case $1 in
                $IS_FULL_TIME)
                        empHrs=8
                        ;;
                $IS_PART_TIME)
                        empHrs=4
                        ;;
                *)
                        empHrs=0
                        ;;
        esac
	echo $empHrs
}

function calcDailyWage() {
	local workHrs=$1
	wage=$(( $workHrs*$EMP_RATE_PER_HR ))
	echo $wage
}

while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
	((totalWorkingDays++))
	workHours="$( getWorkingHours $((RANDOM%3)) )"
	totalEmpHrs=$(($totalEmpHrs+$workHours))
	empDailyWage[$totalWorkingDays]="$( calcDailyWage $workHours )"
done

totalSalary="$( calcDailyWage $totalEmpHrs )"
echo "Daily wage " ${empDailyWage[@]}

