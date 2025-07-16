# run bash script crc32  --- you'll get checksum code , convert it to hex
# upload your file in s3
<!-- "# aws s3api put-object \
#   --bucket checksums-examples-sh758\
#   --key mytest.txt \
#   --body mytest.txt \
#   --checksum-algorithm CRC32 -->

# output will have checksum code which will be in base64 convert it to hex
