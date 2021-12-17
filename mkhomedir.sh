#!/bin/sh 


dbus-send --system --dest=com.redhat.oddjob_mkhomedir --print-reply / com.redhat.oddjob_mkhomedir.mkhomedirfor string:"$PAM_USER"


## Atualização Caso seu sistema falhe ao criar a HomeDir descomente o seguinte codigo abaixo e comente o anterior

#dbus-send --system --dest=com.redhat.oddjob_mkhomedir --print-reply / com.redhat.oddjob_mkhomedir.mkhomedirfor string:$PAM_USER
