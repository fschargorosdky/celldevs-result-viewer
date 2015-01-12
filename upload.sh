zip -r simpledla.zip simpledla/
java -jar RESTful_CDppTest.jar PutXMLFile test test test/lopez/simpledla simpledla.xml
java -jar RESTful_CDppTest.jar PostZipFile test test test/lopez/simpledla?zdir=simpledla simpledla.zip
java -jar RESTful_CDppTest.jar PutFramework test test test/lopez/simpledla/simulation
