zip -r simpledla.zip simpledla/
java -jar RESTful_CDppTest.jar PutXMLFile test test test/dcdpp/simpledla simpledla.xml
java -jar RESTful_CDppTest.jar PostZipFile test test test/dcdpp/simpledla?zdir=simpledla simpledla.zip
java -jar RESTful_CDppTest.jar PutFramework test test test/dcdpp/simpledla/simulation
