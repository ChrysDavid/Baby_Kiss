String getMapUrlTemplate(String mapType, String mapTilerApiKey) {
  switch (mapType) {
    case 'satellite':
      return 'https://api.maptiler.com/maps/hybrid/256/{z}/{x}/{y}.jpg?key=$mapTilerApiKey';
    case 'streets':
    default:
      return 'https://api.maptiler.com/maps/streets-v2/256/{z}/{x}/{y}.png?key=$mapTilerApiKey';
  }
}
