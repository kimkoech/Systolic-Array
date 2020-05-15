for i in {0..3}
do
   python iterate.py $i

   NOW="$(date)"
   mkdir ~/cs148/results/"$NOW"
   cp -r reports/layout/* ~/cs148/results/"$NOW"
done