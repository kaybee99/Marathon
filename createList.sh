cd TestCases/Complete
ls *.rb | cut -d'.' -f1 | awk '{print "#"$0}' > ../../testlist.txt
cd ..
