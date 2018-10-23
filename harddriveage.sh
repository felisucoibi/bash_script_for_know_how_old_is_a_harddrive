# bash_script_for_know_how_old_is_a_harddrive
Bash script to know how old is a harddrive.


## SCIRPT PARA MOSTRA RHORA SD EUSO DE LOS DISCOS....

for filename in /dev/sd*[b-z]; do

    
     OUTPUT2="$(lsblk -i $filename | grep crypt | cut -d ':' -f1 | cut -d 'R' -f2  | cut -d ' ' -f1)"
     echo -n "R$OUTPUT2   : "
     printf '\t'
     echo -n "$filename : "
     OUTPUT="$(sudo smartctl -a -d sat $filename | grep Power_On_Hours | cut -d "-" -f2 | tr -d " ")"
     printf '\t'
     echo -n "Horas: ${OUTPUT}"
     printf '\t'
     echo -n "Dias:  "
     echo -n $((OUTPUT / 24))
     printf '\t'
     echo -n "Meses:  "
     echo -n $((OUTPUT / 24 / 30))
     echo -n "	Añoss: "
     echo $((OUTPUT / 24 / 365))

     #echo "${OUTPUT}"
done
