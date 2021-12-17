/*Specify connection options. Use an unrestricted user ID.*/
options metaserver=example.com

          metaport=8561               

          metauser="sasadm@saspw"     

          metapass="passwd"  

          metaprotocol=bridge       

          metarepository=Foundation;

/*Specify the directory  for the extracted AD data (master
tables).*/
libname adir "/example/ADIRextract";

/* Specify the directory for the extracted  metadata (target tables).*/
libname meta "/example/METAextract";

/* Specify the directory  for the comparison output (change tables).*/
libname updates "/example/METAupdt";

/* Extract identity information from AD (master).*/
%let _EXTRACTONLY = ; 
%include "example/importad.sas";

/* Extract identity information from the metadata (target).*/
%mduextr(libref=work);

/* Compare AD (master) to metadata (target).*/ 
%mducmp(master=adir, target=work, change=updates);

/* Validate the change tables.*/
%mduchgv(change=updates, target=work, temp=work, errorsds=work.mduchgverrors);

/* Load  the  changes into the metadata.*/
%mduchglb(change=updates);
