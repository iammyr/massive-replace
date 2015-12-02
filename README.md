# massive-replace
Facilitate performing massive replacements across the content of multiple files.

## USAGE
Run the commands with no arguments to learn how to use them. 

massive-replace.sh uses sedml.sh but you could also use sedml.sh directly if you do not need the additional functionalities provided by the massive-replace.sh script.

## EXAMPLES

./massive-replace.sh sedml.sh input/folder output/folder input_folder_index 'bar\s=\snew\sString(\snew\ssun\.misc\.BASE64Decoder()\.decodeBuffer(\nnew\ssun\.misc\.BASE64Encoder()\.encode(\sparam\.getBytes()\s)\s));' 'bar=param;'

./sedml.sh test.in 's/if\s(param\s!=\snull.*}/hello/g' test.out
