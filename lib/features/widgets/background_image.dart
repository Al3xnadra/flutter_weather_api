class BackgroundImage {
  String imageName(String image) {
    switch (image) {
      case 'Sunny':
        return 'assets/images/sunny.jpeg';
      case 'Rain':
      case 'Patchy rain nearby':
        return 'assets/images/rain.jpeg';
      case 'Fog':
        return 'assets/images/fog.jpeg';
      case 'Snow':
      case 'Moderate or heavy snow showers':
        return 'assets/images/snow.jpeg';
      default:
        return 'assets/images/sunny.jpeg';
    }
  }
}
