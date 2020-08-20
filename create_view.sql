create or replace view LOCATION_VIEW

as

select

ad.address_detail_pid as gnafid,
ad.building_bame as addresssitename,
ad.flat_type as unittypecode,
concat(ad.flat_number, ad.flat_number_suffix) as unitnumber,
ad.level_type as leveltypecode,
concat(ad.level_number, ad.level_number_suffix) as levelnumber,
concat(ad.lot_number, ad.lot_number_suffix) as lotnumber,
concat(ad.number_first, ad.number_first_suffix) as roadnumber1,

