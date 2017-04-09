#!/bin/bash

function install_printer(){

         PrinterName="$1";
         Ip="$2";
         PpdFile="$3";
         
         lpadmin -p $PrinterName -v socket://$Ip -P $PpdFile
}

install_printer 'Samsung SCX-5635' 192.168.0.139 ./ppds/Samsung-SCX-5635-Postscript-Samsung.ppd

