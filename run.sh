readarray -t testlist < testlist.txt
let i=0
list=""
. marathon.properties
if [[ $1 == "uat2" ]]
then
  sed "s,marathon_jnlp,$marathon_jnlp_uat2,g" < Fixtures/default$.rb > Fixtures/default.rb
  sed "s,marathon_host,$marathon_host_uat2,g" < Modules/modGeneral.1rb > Modules/modGeneral.rb
elif [[ $1 == "uat3" ]]
then
  sed "s,marathon_jnlp,$marathon_jnlp_uat3,g" < Fixtures/default$.rb > Fixtures/default.rb
  sed "s,marathon_host,$marathon_host_uat3,g" < Modules/modGeneral.1rb > Modules/modGeneral.rb
elif [[ $1 == "uat4" ]]
then
  sed "s,marathon_jnlp,$marathon_jnlp_uat4,g" < Fixtures/default$.rb > Fixtures/default.rb
  sed "s,marathon_host,$marathon_host_uat4,g" < Modules/modGeneral.1rb > Modules/modGeneral.rb
elif [[ $1 == "uat5" ]]
then
  sed "s,marathon_jnlp,$marathon_jnlp_uat5,g" < Fixtures/default$.rb > Fixtures/default.rb
  sed "s,marathon_host,$marathon_host_uat5,g" < Modules/modGeneral.1rb > Modules/modGeneral.rb
fi
while (( ${#testlist[@]} > i )); do
  #printf "${testlist[i++]}"
  a=${testlist[i++]};
  skip=${a:0:1};
if [[ "${a}" == *#* ]]; then
      printf "";
else
    echo "$marathon_home/marathonite -capture -reportdir Reports -batch . ${list}"
     list="${list} ${a}"
fi
done
echo "${list}"
cp TestCases/Complete/*.rb TestCases
"$marathon_home/marathonite" -capture -reportdir Reports -batch . ${list}
rm TestCases/*.rb
