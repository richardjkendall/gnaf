create table LOCATION_TABLE as select * from LOCATION_VIEW;

create index POSTCODE_IDX on LOCATION_TABLE(postcode);
create index LOCALITY_IDX on LOCATION_TABLE(localityname);
create index GNAF_IDX on LOCATION_TABLE(gnafid);
create index RDNUM1_IDX on LOCATION_TABLE(roadnumber1);
create index RDNUM2_IDX on LOCATION_TABLE(roadnumber2);
create index ROADNAME_IDX on LOCATION_TABLE(roadname);
create index SITENAME_IDX on LOCATION_TABLE(addresssitename);
create index LOTNUM_IDX on LOCATION_TABLE(lotnumber);
create index UNITNUM_IDX on LOCATION_TABLE(unitnumber);
create index LAT_IDX on LOCATION_TABLE(latitude);
create index LONG_IDX on LOCATION_TABLE(longitude);
