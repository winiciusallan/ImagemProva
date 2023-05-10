#!/bin/bash

# Script para automatizar a deleção dos usuários caso alguma mudança
# no código principal seja necessária.
groupdel administracao
groupdel enfermeiros
groupdel medicos
userdel josegota

for (( i=1 ; i<=15 ; i++ )) do
        userdel "adm$i"
done

for (( i=1 ; i<=30 ; i++ )) do
        userdel "enfermeiro$i"
done

for (( i=1 ; i<=20 ; i++)) do
        userdel "med$i"
done

