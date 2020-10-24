{ config, lib, uuid, name, ... }:

with lib;
{

  options = {

    uploadId = mkOption {
      default = "s3upload-${uuid}-${name}";
      type = types.str;
      description = "The name of this s3 bucket upload";
    };

    bucketName = mkOption {
      type = types.str;
      description = "Name of the S3 bucket to upload to.";
    };

    prefix = mkOption {
      type = types.str;
      description = "Prefix to upload to";
      default = "";
    };

    source = mkOption {
      type = types.either types.package types.str;
      description = "Source directory to upload";
    };

    region = mkOption {
      type = types.str;
      description = "Amazon S3 region.";
    };

    accessKeyId = mkOption {
      type = types.str;
      description = "The AWS Access Key ID.";
    };

    _source = mkOption { type = types.str; };
  };

  config = with lib; {
    _type = "s3-bucket-upload";
    _source =
      if config.source ? "drvPath"
      then config.source.drvPath
      else config.source;
  };
}
