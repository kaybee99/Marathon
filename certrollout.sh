
keytool -delete -noprompt -alias ersenv -keystore /usr/lib/jvm/java-7-oracle/jre/lib/security/cacerts -storepass changeit

keytool -importcert -noprompt -trustcacerts -file ERS_New.cer -keystore /usr/lib/jvm/java-7-oracle/jre/lib/security/cacerts -storepass changeit -alias ersenv


