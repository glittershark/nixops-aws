#!/usr/bin/env python3

from nixops.resources import ResourceOptions

class S3BucketUploadOptions(ResourceOptions):
    uploadId: str
    bucketName: str
    prefix: str
    source: str
    _source: str
    region: str
    accessKeyId: str
