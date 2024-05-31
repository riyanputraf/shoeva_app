

String updateLocalhostUrl(String url) {
  if (url.contains('localhost')) {
    return url.replaceAll('localhost', '10.0.2.2');
  } else if (url.contains('127.0.0.1')) {
    return url.replaceAll('127.0.0.1', '10.0.2.2');
  }
  return url;
}
