create or replace view LOCATION_VIEW

as

select

ad.address_detail_pid as gnafid,
ad.building_name as addresssitename,
ad.flat_type_code as unittypecode,
concat(ad.flat_number, ad.flat_number_suffix) as unitnumber,
ad.level_type_code as leveltypecode,
concat(ad.level_number, ad.level_number_suffix) as levelnumber,
concat(ad.lot_number, ad.lot_number_suffix) as lotnumber,
concat(ad.number_first, ad.number_first_suffix) as roadnumber1,
concat(ad.number_last, ad.number_last_suffix) as roadnumber2,
sl.street_name as roadname,
sl.street_type_code as roadtypecode,
l.locality_name as localityname,
ad.postcode as postcode,
st.state_abbreviation as statecode,
adg.latitude as latitude,
adg.longitude as longitude

from

ADDRESS_DETAIL ad
left join LOCALITY l on l.locality_pid = ad.locality_pid 
left join STREET_LOCALITY sl on sl.street_locality_pid = ad.street_locality_pid 
left join STATE st on st.state_pid = l.state_pid 
left join ADDRESS_DEFAULT_GEOCODE adg on adg.address_detail_pid = ad.address_detail_pid

where 

ad.confidence > -1;
