#!/bin/sh
dbname="postgres"
username="postgres"
fileroot="/path/to/the/files/*"
step=10

while true
do
	bid_01=$(python generator.py 1 $step);
	bid_02=$(python generator.py 1 $((2*$step)));
	ask_01=$(python generator.py 1 $step);
	ask_02=$(python generator.py 1 $((2*$step)));
	bid_avg=$(bc<<<"scale=2;($bid_01+$bid_02)/2");
	ask_avg=$(bc<<<"scale=2;($ask_01+$ask_02)/2");
	stats="'{\"bid_avg\":\"$bid_avg\",\"ask_avg\":\"$ask_avg\"}'";
	sleep 5s;
	psql $dbname $username -c "
	  UPDATE newtable
	  SET timestamp = now()::timestamp,
	      bid_01 = $bid_01,
	      bid_02 = $bid_02,
	      stats = $stats,
	      ask_01 = $ask_01,
	      ask_02 = $ask_02
	  WHERE id=1;"
	sleep 0.001s;
done
