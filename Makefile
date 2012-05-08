gadm2:
	wget http://ff07d01.filefactory.com/dlp/5xkecujkx4sd//t/4eb1782f4d1a05b1ddb4401651c54087/n/USA_adm.zip
	unzip USA_adm.zip

gadm1:
	wget http://www.gadm.org/data/shp/USA_adm.zip

tiger:
	wget ftp://ftp2.census.gov/geo/tiger/TIGER2011/COUNTY/tl_2011_us_county.zip

cdlmeta:
	wget -nc -P metadata http://www.nass.usda.gov/research/Cropland/metadata/XMLs_2006.zip
	wget -nc -P metadata http://www.nass.usda.gov/research/Cropland/metadata/XMLs_2008.zip
	unzip -d metadata metadata/XMLs_2008.zip cdlmeta_56m_r_ar_2008.xml