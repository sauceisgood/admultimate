#!/bin/bash
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;32m" [3]="\033[1;36m" [4]="\033[1;31m" [5]="\033[1;33m" )
barra="\033[0m\e[34m======================================================\033[1;37m"
while :
do
#menu banner
clear
echo -e "$barra"
echo -e "${cor[3]} HOST EXTRACTOR ${cor[2]}[NEW-ADM]"
echo -e "${cor[5]} Actualiza o Extrator menu 7 e 8 antes de usar"
echo -e "$barra"
echo -e "${cor[2]}[1] ${cor[4]}> ${cor[3]}EXTRACTOR HOST & SSL"
echo -e "${cor[2]}[2] ${cor[4]}> ${cor[3]}GUARDAR HOSTS EXTRAIDOS"
echo -e "${cor[2]}[3] ${cor[4]}> ${cor[3]}MOSTRAR STATUS DE WEB"
echo -e "${cor[2]}[4] ${cor[4]}> ${cor[3]}GERAR PAYLOAD FUNCIONAL"
echo -e "${cor[2]}[5] ${cor[4]}> ${cor[3]}VER PORTAS WEB & HOST"
echo -e "${cor[2]}[6] ${cor[4]}> ${cor[3]}VER PROXY HOST & WEB"
echo -e "${cor[2]}[7] ${cor[4]}> ${cor[3]}ACTUALIZAR PACOTES HOST EXTRACTOR"
echo -e "${cor[2]}[8] ${cor[4]}> ${cor[3]}ACTUALIZAR HOST EXTRACTOR"
echo -e "${cor[2]}[9] ${cor[4]}> ${cor[3]}MANUAL DE USO HOST EXTRACTOR"
echo -e "${cor[2]}[0] ${cor[4]}> ${cor[0]}SAIR DO MENU"
echo -e "$barra"
echo -n "Escolher opção: "
read opcion
#lista de menu
echo -e "\e[0m"
case $opcion in

1)
echo -e "\e[1;33m"
echo -n "HOST: ";
read HOST;
bash /etc/hostextractor/.scan.sh $HOST
echo ""
echo -e "\e[0m";
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar";
read foo
;;

2)
echo -e "\e[1;33mCopiar os hosts para poder verificar o status\e[0m";
echo -e "\e[1;33mCorta ENTER e depois CTRL + C\e[0m";
echo -e "\e[1;33mPara Guardar e salir, digita adm\e[0m";
echo -e "\e[1;33mPara voltar ao menu e entrar novamente no Extractor\e[0m";
echo -e "$barra"
echo -e "\e[1;36mHOST: \e[0m";
cat>lista-host.txt
;;

3)
echo "Mostrando status de hosts";
echo ""
bash /etc/hostextractor/.status.sh
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar"
read foo
;;

4)
bash /etc/hostextractor/.payloads
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar"
read foo;
;;

5)
echo -ne "\e[1;31m DOMINIO(IP/WEB): ";
read NIO
echo -ne "\e[1;31m PORTAS(53,80):  ";
read TOS
sleep 2
echo -e "\e[1;32m";
nmap -p $TOS $NIO
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar" 
read foo
;;

6)
echo -ne "\e[1;31mSITIO WEB/IP: ";
read WEB
echo ""
echo -e "\e[1;32m"
curl https://api.hackertarget.com/geoip/?q=$WEB
echo ""
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar" 
read foo
;;

7)
echo -ne "\033[1;36mActualizando pacotes Host Extractor"
echo ""
echo ""
apt-get update -y > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
apt-get install nmap -y > /dev/null 2>&1
apt-get install wget -y > /dev/null 2>&1
apt-get install curl > /dev/null 2>&1
apt-get install git -y > /dev/null 2>&1
echo -e "\033[1;31m apt-get paquetes \033[1;32m[ ! ] OK"
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar" 
read foo
;;

8)
echo -ne "\033[1;36mActualizando Host Extractor"
echo ""
echo ""
rm -rf $HOME/hostextractor/ > /dev/null 2>&1
rm -rf /etc/hostextractor
wget -O $HOME/hostextractor.tgz https://raw.githubusercontent.com/sauceisgood/admultimate/master/Install/hostextractor.tgz > /dev/null 2>&1
tar -xvf hostextractor.tgz > /dev/null 2>&1
rm -rf $HOME/hostextractor.tgz > /dev/null 2>&1
mv $HOME/hostextractor/ /etc/ > /dev/null 2>&1
rm -rf $HOME/hostextractor/ > /dev/null 2>&1
echo -e "\033[1;31m Host Extractor \033[1;32m[ ! ] OK"
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar" 
read foo
;;

9)
echo -e "\e[1;36m OPÇÕES:"
echo -e "\e[1;32m"
echo "[1] Extrair hosts http e https"
echo "[2] Hosts desbloqueados sitios web "
echo "[3] Mostrar status de Host"
echo "[4] Generar payloads funcionais web / host"
echo "[5] Mostra portas abertas / IP/ proxy"
echo " - Coloca uma virgula entre cada porta, exemplo: 22,53,442,443,80,8080,3128"
echo "[6] Ver informação de porxy web ou IP"
echo "[7] Actualizar pacotes de host-extractor"
echo "[8] Actualizar script host-extractor"
echo "[9] Manual de como usar o script host-extractor"
echo "[0] Sair do menu 0 y 0 salir do menu em español"
echo ""
echo -e "$barra"
echo -e "\e[1;31mEntrar para continuar" 
read foo
;;

25)clear
echo -e "\e[1;32mA Entrar no menu secreto...";
sleep 2
bash ._
read foo
;;

0)
exit 0;;
#error

*)clear
echo "Invalid command...";
sleep 1
;;

esac
done
