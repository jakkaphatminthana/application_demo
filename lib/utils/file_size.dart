String getFileSize(double fileSize) {
  double fileSizeKB = fileSize / 1024;
  if (fileSizeKB < 1) {
    return '$fileSize Bytes';
  }
  double fileSizeMB = fileSizeKB / 1024;
  if (fileSizeMB < 1) {
    return '${fileSizeKB.toStringAsFixed(2)} KB';
  }
  double fileSizeGB = fileSizeMB / 1024;
  if (fileSizeGB < 1) {
    return '${fileSizeMB.toStringAsFixed(2)} MB';
  }
  return '${fileSizeGB.toStringAsFixed(2)} GB';
}
