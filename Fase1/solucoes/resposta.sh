#!/bin/bash 

# Script para a criação de usuários de uma policlínica.

# O comando groupadd serve para a criação de um novo grupo no sistema.
# O parâmetro -g passado permite escolher o GID (Group ID) seguido do nome que será criado
groupadd -g 1010 josegota # Grupo do administrador

groupadd -g 1000 administracao
groupadd -g 2000 enfermeiros
groupadd -g 3000 medicos

log_archive="/var/log/createusers.log" # Arquivo onde será gerado o log.

# O comando useradd serve para adicionar um usuário no sistema.
# A flag -u permite você escolher o UID (User ID)
# A flag -G faz com que ele adicione o usuário a uma lista de grupos (criados anteriormente).
# 
# O passwd é um comando para alterar/setar a senha de algum usuário.
# A flag -d deleta a senha tornando ela vazia. Não precisa de autenticação para o login.
# A flag -e expira a senha do usuário e faz com que na proxima vez que ele se logue, precise mudar ela.
useradd -u 1000 -g 1010 -G administracao,enfermeiros,medicos josegota >> $log_archive
passwd -d -e josegota | >> $log_archive

for (( i=1 ; i<=15 ; i++ )) do
        useradd -u $((1000+$i)) -g 1000 "adm$i" >> $log_archive # Cria usuario "admxx" onde 1 <= x <= 15
        passwd -d -e "adm$i" >> $log_archive
done

for (( i=1 ; i<=30 ; i++ )) do
        useradd -u $((2000+$i)) -g 2000 "enfermeiro$i" >> $log_archive # Cria usuario "enfermeiroxx" onde 1 <= x <= 30
        passwd -d -e "enfermeiro$i" >> $log_archive
done

for (( i=1 ; i<=20 ; i++)) do
        useradd -u $((3000+$i)) -g 3000 "med$i" >> $log_archive # Cria usuario "medxx" onde 1 <= x <= 20
        passwd -d -e "med$i" >> $log_archive
done

exit(0)
