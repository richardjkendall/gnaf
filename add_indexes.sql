create index ADDRESS_DETAIL_PID on ADDRESS_DETAIL(address_detail_pid);
create index ADDRESS_DEFAULT_GEOCODE_PID on ADDRESS_DEFAULT_GEOCODE(address_detail_pid);
create index STREET_LOCALITY_PID on STREET_LOCALITY(street_locality_pid);
create index LOCALITY_PID on LOCALITY(locality_pid);
create index STATE_PID on STATE(state_pid);

create index FLAT_TYPE_AUT_CODE on FLAT_TYPE_AUT(code);
create index LEVEL_TYPE_AUT_CODE on LEVEL_TYPE_AUT(code);
create index STREET_SUFFIX_AUT_CODE on STREET_SUFFIX_AUT(code);
create index STREET_CLASS_AUT_CODE on STREET_CLASS_AUT(code);
create index STREET_TYPE_AUT_CODE on STREET_TYPE_AUT(code);
create index GEOCODE_TYPE_AUT_CODE on GEOCODE_TYPE_AUT(code);
create index GEOCODED_LEVEL_TYPE_AUT_CODE on GEOCODED_LEVEL_TYPE_AUT(code)
