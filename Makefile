gadm2:
	wget http://ff07d01.filefactory.com/dlp/5xkecujkx4sd//t/4eb1782f4d1a05b1ddb4401651c54087/n/USA_adm.zip
	unzip USA_adm.zip

gadm1:
	wget http://www.gadm.org/data/shp/USA_adm.zip

tiger:
	wget -nc -P tiger ftp://ftp2.census.gov/geo/tiger/TIGER2011/COUNTY/tl_2011_us_county.zip
	unzip -d tiger tiger/tl_2011_us_county.zip
	wget -nc -P tiger ftp://ftp2.census.gov/geo/tiger/TIGER2011/STATE/tl_2011_us_state.zip
	unzip -d tiger tiger/tl_2011_us_state.zip

cdlmeta:
	wget -nc -P metadata http://www.nass.usda.gov/research/Cropland/metadata/XMLs_2006.zip
	wget -nc -P metadata http://www.nass.usda.gov/research/Cropland/metadata/XMLs_2008.zip
	unzip -d metadata metadata/XMLs_2008.zip cdlmeta_56m_r_ar_2008.xml

mask:
	gdaltindex shp/cdl.shp tif/CDL*.tif 2>/dev/null
	md5sum --check shp/cdl.md5
	ogr2ogr -overwrite -t_srs EPSG:4326 shp/index_wgs84.shp shp/cdl.shp
	gdal_rasterize -l index_wgs84 -where "location LIKE 'tif/CDL_2006_%.tif'"  -at -burn 1 -a_nodata 255 -tr 0.08333333 0.08333333 -tap -ot UInt32 shp/index_wgs84.shp mask/CDL_2006.tif -q
	gdal_rasterize -l index_wgs84 -where "location LIKE 'tif/CDL_2008_%.tif'"  -at -burn 1 -a_nodata 255 -tr 0.08333333 0.08333333 -tap -ot UInt32 shp/index_wgs84.shp mask/CDL_2008.tif -q