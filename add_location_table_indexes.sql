create index gnafid_idx on location_table(gnafid);
create index unitnumber_idx on location_table(unitnumber);
create index levelnumber_idx on location_table(levelnumber);
create index lotnumber_idx on location_table(lotnumber);
create index roadnumber1_idx on location_table(roadnumber1);
create index roadnumber2_idx on location_table(roadnumber2);
create index roadname_idx on location_table(roadname varchar_pattern_ops);
create index localityname_idx on location_table(localityname varchar_pattern_ops);
create index postcode_idx on location_table(postcode);
create index state_idx on location_table(statecode);
create index lat_idx on location_table(latitude);
create index long_idx on location_table(longitude);
create index addresssitename_idx on location_table(addresssitename varchar_pattern_ops);



